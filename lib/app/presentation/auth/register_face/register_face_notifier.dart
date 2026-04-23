import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_face_api/flutter_face_api.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:ibm_presensi_app/app/module/entity/auth.dart';
import 'package:ibm_presensi_app/app/module/use_case/auth_register_face_use_case.dart';
import 'package:ibm_presensi_app/app/presentation/common/dashboard/dashboard_notifier.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/camera_utils.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class RegisterFaceNotifier extends AppProvider with WidgetsBindingObserver {
  final AuthRegisterFaceUseCase _registerFaceUseCase;
  final Dio _dio;

  RegisterFaceNotifier(this._registerFaceUseCase, this._dio) {
    WidgetsBinding.instance.addObserver(this);
    init();
  }

  // ========== CAMERA & FACE DETECTION ==========
  CameraController? _cameraController;
  CameraDescription? _cameraDescription;
  final FaceSDK _faceSDK = FaceSDK.instance;

  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableClassification: true,
      performanceMode: FaceDetectorMode.fast,
    ),
  );

  // ========== STATE VARIABLES ==========
  bool _isProcessing = false;
  bool _isFaceDetected = false;
  bool _isLocationGranted = false;
  bool _isRegistrationSuccess = false;
  double _percentMatch = 0.0;
  String _statusMessage = "Menyiapkan kamera...";
  bool _isErrorMessage = false;
  DateTime? _lastProcessingTime;
  DateTime? _lastMessageTime;
  Uint8List? _capturedFaceBytes;

  // ========== GETTERS ==========
  CameraController? get cameraController => _cameraController;
  bool get isFaceDetected => _isFaceDetected;
  bool get isLocationGranted => _isLocationGranted;
  bool get isRegistrationSuccess => _isRegistrationSuccess;
  double get percentMatch => _percentMatch;
  String get statusMessage => _statusMessage;
  bool get isErrorMessage => _isErrorMessage;
  Uint8List? get capturedFaceBytes => _capturedFaceBytes;

  // ========== INIT ==========
  @override
  Future<void> init() async {
    await _setupRequirements();
  }

  Future<void> _setupRequirements() async {
    showLoading();
    try {
      _isLocationGranted = await Permission.camera.isGranted;
      await _faceSDK.initialize();

      if (!_isLocationGranted) {
        final status = await Permission.camera.request();
        _isLocationGranted = status.isGranted;
      }

      if (_isLocationGranted) {
        await _initializeCamera();
      } else {
        _updateStatus("Izin kamera diperlukan", isError: true);
      }
    } catch (e) {
      debugPrint("🚨 INIT_ERROR: $e");
      _updateStatus("Gagal menginisialisasi kamera", isError: true);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  // ========== CAMERA INITIALIZATION ==========
  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        _updateStatus("Kamera tidak tersedia", isError: true);
        return;
      }

      _cameraDescription = cameras.firstWhere(
        (cam) => cam.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );

      _cameraController = CameraController(
        _cameraDescription!,
        ResolutionPreset.medium,
        enableAudio: false,
        imageFormatGroup: Platform.isAndroid
            ? ImageFormatGroup.nv21
            : ImageFormatGroup.bgra8888,
      );

      await _cameraController!.initialize();
      _updateStatus("Posisikan wajah Anda di dalam bingkai", isError: false);
      _startStream();
    } catch (e) {
      _updateStatus("Gagal membuka kamera", isError: true);
    }
    notifyListeners();
  }

  // ========== FACE DETECTION STREAM ==========
  void _startStream() {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    _cameraController!.startImageStream((image) {
      if (_isProcessing || _isFaceDetected || isLoading) return;

      final now = DateTime.now();
      if (_lastProcessingTime != null &&
          now.difference(_lastProcessingTime!).inMilliseconds < 600) {
        return;
      }
      _lastProcessingTime = now;

      _detectFace(image);
    });
  }

  Future<void> _detectFace(CameraImage image) async {
    _isProcessing = true;
    try {
      final inputImage = CameraUtils.convertCameraImageToInputImage(
        image,
        _cameraDescription!,
      );
      if (inputImage == null) return;

      final faces = await _faceDetector.processImage(inputImage);
      if (faces.isEmpty) {
        _updateStatus("Wajah tidak terdeteksi", isError: false);
        return;
      }

      final face = faces.first;

      // Validasi posisi wajah
      if (face.headEulerAngleY! > 15 || face.headEulerAngleY! < -15 ||
          face.headEulerAngleX! > 15 || face.headEulerAngleX! < -15) {
        _updateStatus("Hadap lurus ke kamera", isError: true);
        return;
      }

      // Validasi jarak wajah
      if (face.boundingBox.width < 120) {
        _updateStatus("Dekatkan wajah Anda", isError: true);
        return;
      }

      _updateStatus("Tahan... Kedipkan mata", isError: false);

      // Deteksi kedipan
      if (face.leftEyeOpenProbability != null &&
          face.rightEyeOpenProbability != null) {
        if (face.leftEyeOpenProbability! < 0.25 &&
            face.rightEyeOpenProbability! < 0.25) {
          _isFaceDetected = true;
          HapticFeedback.mediumImpact();
          await _cameraController?.stopImageStream();
          await Future.delayed(const Duration(milliseconds: 400));
          await _captureAndRegister();
        }
      }
    } catch (e) {
      debugPrint("🚨 FACE_DETECT_ERROR: $e");
    } finally {
      _isProcessing = false;
    }
  }

  // ========== CAPTURE & REGISTER ==========
  Future<void> _captureAndRegister() async {
    showLoading();
    try {
      if (_cameraController == null || !_cameraController!.value.isInitialized) {
        throw Exception("Kamera error");
      }

      final photo = await _cameraController!.takePicture();
      final bytes = await photo.readAsBytes();
      _capturedFaceBytes = bytes;

      final params = RegisterFaceParam(
        faceModel: "REGISTERED_FACE",
        imagePath: photo.path,
      );

      final result = await _registerFaceUseCase(params);

      if (result is SuccessState<bool> && result.data == true) {
        await SharedPreferencesHelper.setBool(
          AppPreferences.IS_FACE_REGISTERED,
          true,
        );

        _percentMatch = 100.0;
        _isRegistrationSuccess = true;
        _updateStatus("Registrasi Berhasil! ✅", isError: false);

        // Sync Dashboard
        if (sl.isRegistered<DashboardNotifier>()) {
          await sl<DashboardNotifier>().refreshAll();
        }
      } else {
        _resetStream(result.message);
      }
    } catch (e) {
      _resetStream("Gagal mengambil gambar");
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  // ========== HELPER METHODS ==========
  void _updateStatus(String msg, {bool isError = true}) {
    if (_statusMessage == msg) return;
    _statusMessage = msg;
    _isErrorMessage = isError;
    _lastMessageTime = DateTime.now();
    notifyListeners();
  }

  void _resetStream(String errorMsg) {
    _isFaceDetected = false;
    _isProcessing = false;
    _percentMatch = 0.0;
    _capturedFaceBytes = null;
    _updateStatus(errorMsg, isError: true);

    Future.delayed(const Duration(seconds: 3), () {
      if (_cameraController != null &&
          !_cameraController!.value.isStreamingImages &&
          !isLoading) {
        _startStream();
      }
    });
  }

  void resetStatus() {
    _statusMessage = "Posisikan wajah Anda di dalam bingkai";
    _isErrorMessage = false;
    notifyListeners();
  }

  // ========== PERMISSION ==========
  Future<void> requestCameraPermission() async {
    final status = await Permission.camera.request();
    _isLocationGranted = status.isGranted;

    if (_isLocationGranted) {
      await _initializeCamera();
    } else if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
    notifyListeners();
  }

  // ========== STOP CAMERA ==========
  Future<void> stopCamera() async {
    if (_cameraController != null) {
      final controller = _cameraController;
      _cameraController = null;
      notifyListeners();

      try {
        if (controller!.value.isStreamingImages) {
          await controller.stopImageStream();
        }
        await controller.dispose();
      } catch (e) {
        debugPrint("🚨 Error dispose camera: $e");
      }
    }
  }

  // ========== NAVIGATE TO NEXT ==========
  void navigateToNext(BuildContext context) {
    stopCamera();
    
    // Cek role user
    final session = SharedPreferencesHelper.getUserSession();
    
    if (session != null) {
      if (session.isAdmin) {
        Navigator.pushNamedAndRemoveUntil(context, '/admin-navbar', (route) => false);
      } else if (session.isManager) {
        Navigator.pushNamedAndRemoveUntil(context, '/manager-navbar', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, '/main-navbar', (route) => false);
      }
    } else {
      Navigator.pushNamedAndRemoveUntil(context, '/main-navbar', (route) => false);
    }
  }

  // ========== LIFECYCLE ==========
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive || state == AppLifecycleState.paused) {
      stopCamera();
    } else if (state == AppLifecycleState.resumed && _isLocationGranted && _cameraController == null) {
      _initializeCamera();
    }
  }

  // ========== DISPOSE ==========
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _faceDetector.close();
    stopCamera();
    super.dispose();
  }
}
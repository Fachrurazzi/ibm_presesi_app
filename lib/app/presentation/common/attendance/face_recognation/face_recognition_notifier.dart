import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:ibm_presensi_app/app/module/entity/auth.dart';
import 'package:ibm_presensi_app/app/module/use_case/auth_register_face_use_case.dart';
import 'package:ibm_presensi_app/core/helper/camera_utils.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FaceRecognitionNotifier extends AppProvider with WidgetsBindingObserver {
  final AuthRegisterFaceUseCase _registerFaceUseCase;

  FaceRecognitionNotifier(this._registerFaceUseCase) {
    WidgetsBinding.instance.addObserver(this);
    init();
  }

  // ========== CAMERA ==========
  CameraController? _cameraController;
  CameraDescription? _cameraDescription;
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableClassification: true,
      performanceMode: FaceDetectorMode.fast,
    ),
  );

  // ========== STATE ==========
  bool _isProcessing = false;
  bool _isFaceDetected = false;
  bool _isCameraGranted = false;
  bool _isVerificationSuccess = false;
  String _statusMessage = "Menyiapkan kamera...";
  bool _isErrorMessage = false;
  DateTime? _lastProcessingTime;
  Uint8List? _capturedFaceBytes;

  // ========== GETTERS ==========
  CameraController? get cameraController => _cameraController;
  bool get isFaceDetected => _isFaceDetected;
  bool get isCameraGranted => _isCameraGranted;
  bool get isVerificationSuccess => _isVerificationSuccess;
  String get statusMessage => _statusMessage;
  bool get isErrorMessage => _isErrorMessage;
  Uint8List? get capturedFaceBytes => _capturedFaceBytes;

  // ========== INIT ==========
  @override
  Future<void> init() async {
    await _checkPermission();
  }

  Future<void> _checkPermission() async {
    final status = await Permission.camera.status;

    if (status.isGranted) {
      _isCameraGranted = true;
      await _initializeCamera();
    } else if (status.isDenied || status.isRestricted) {
      final result = await Permission.camera.request();
      _isCameraGranted = result.isGranted;
      if (_isCameraGranted) {
        await _initializeCamera();
      } else {
        _updateStatus("Izin kamera diperlukan", isError: true);
      }
    } else if (status.isPermanentlyDenied) {
      _isCameraGranted = false;
      _updateStatus("Izin kamera ditolak permanen. Buka pengaturan.",
          isError: true);
    }
    notifyListeners();
  }

  Future<void> requestCameraPermission() async {
    await openAppSettings();
  }

  // ========== CAMERA INIT ==========
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
      debugPrint("🚨 CAMERA_INIT_ERROR: $e");
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
          now.difference(_lastProcessingTime!).inMilliseconds < 500) {
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
      if (face.headEulerAngleY! > 20 ||
          face.headEulerAngleY! < -20 ||
          face.headEulerAngleX! > 20 ||
          face.headEulerAngleX! < -20) {
        _updateStatus("Hadap lurus ke kamera", isError: true);
        return;
      }

      // Validasi jarak
      if (face.boundingBox.width < 100) {
        _updateStatus("Dekatkan wajah Anda", isError: true);
        return;
      }

      _updateStatus("Tahan... Kedipkan mata", isError: false);

      // Deteksi kedipan
      if (face.leftEyeOpenProbability != null &&
          face.rightEyeOpenProbability != null) {
        if (face.leftEyeOpenProbability! < 0.2 &&
            face.rightEyeOpenProbability! < 0.2) {
          _isFaceDetected = true;
          HapticFeedback.mediumImpact();
          await _cameraController?.stopImageStream();
          await Future.delayed(const Duration(milliseconds: 300));
          await _captureAndVerify();
        }
      }
    } catch (e) {
      debugPrint("🚨 FACE_DETECT_ERROR: $e");
    } finally {
      _isProcessing = false;
    }
  }

  // ========== CAPTURE & VERIFY ==========
  Future<void> _captureAndVerify() async {
    showLoading();
    try {
      if (_cameraController == null ||
          !_cameraController!.value.isInitialized) {
        throw Exception("Kamera error");
      }

      final photo = await _cameraController!.takePicture();
      final bytes = await photo.readAsBytes();
      _capturedFaceBytes = bytes;

      // Register face (atau bisa juga verify ke server)
      final params = RegisterFaceParam(
        faceModel: "VERIFICATION",
        imagePath: photo.path,
      );

      final result = await _registerFaceUseCase(params);

      if (result is SuccessState<bool> && result.data == true) {
        _isVerificationSuccess = true;
        _updateStatus("Verifikasi Berhasil! ✅", isError: false);
      } else {
        _resetStream("Verifikasi gagal, coba lagi");
      }
    } catch (e) {
      _resetStream("Gagal mengambil gambar");
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  // ========== HELPERS ==========
  void _updateStatus(String msg, {bool isError = true}) {
    if (_statusMessage == msg) return;
    _statusMessage = msg;
    _isErrorMessage = isError;
    notifyListeners();
  }

  void _resetStream(String errorMsg) {
    _isFaceDetected = false;
    _isProcessing = false;
    _capturedFaceBytes = null;
    _updateStatus(errorMsg, isError: true);

    Future.delayed(const Duration(seconds: 2), () {
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

  // ========== NAVIGATE ==========
  void navigateToNext(BuildContext context, {String nextRoute = '/map'}) {
    stopCamera();
    Navigator.pushReplacementNamed(context, nextRoute);
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

  // ========== LIFECYCLE ==========
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      stopCamera();
    } else if (state == AppLifecycleState.resumed &&
        _isCameraGranted &&
        _cameraController == null) {
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

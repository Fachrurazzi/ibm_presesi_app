import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_face_api/flutter_face_api.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ibm_presensi_app/app/module/use_case/auth_register_face.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_notifier.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/camera_utils.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class FaceRecognitionNotifier extends AppProvider with WidgetsBindingObserver {
  final AuthRegisterFaceUseCase _registerFaceUseCase;
  final Dio _dio;

  FaceRecognitionNotifier(this._registerFaceUseCase, this._dio) {
    WidgetsBinding.instance.addObserver(this);
    init();
  }

  // --- Core Objects ---
  CameraController? _cameraController;
  CameraDescription? _cameraDescription;
  final _faceSDK = FaceSDK.instance;
  MatchFacesImage? _masterFace;

  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableClassification: true, // Wajib untuk deteksi kedipan
      performanceMode: FaceDetectorMode.fast,
    ),
  );

  // --- State Variables ---
  bool _isProcessing = false;
  bool _isFaceDetected = false;
  bool _isLocationGranted = false;
  bool _isRegistrationMode = false;
  double _percentMatch = 0.0;
  String biometricMessage = "Menyiapkan sensor...";
  bool isErrorMessage = false;
  DateTime? _lastProcessingTime;
  DateTime? _lastMessageTime;
  Uint8List? _capturedFaceBytes;

  // --- Getters ---
  CameraController? get cameraController => _cameraController;
  bool get isFaceDetected => _isFaceDetected;
  bool get isLocationGranted => _isLocationGranted;
  bool get isRegistrationMode => _isRegistrationMode;
  double get percentMatch => _percentMatch;
  Uint8List? get capturedFaceBytes => _capturedFaceBytes;

  @override
  Future<void> init() async {
    await _setupRequirements();
  }

  /// Meminta izin lokasi secara manual jika belum diberikan
  Future<void> requestLocationPermission() async {
    await stopCameraManual();

    final status = await Permission.locationWhenInUse.request();
    _isLocationGranted = status.isGranted;

    if (_isLocationGranted) {
      await _initializeCamera();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
    notifyListeners();
  }

  void resetBiometricMessage() {
    biometricMessage = "";
    notifyListeners();
  }

  void resetState() {
    _capturedFaceBytes = null;
    _isFaceDetected = false;
    _isProcessing = false;
    _percentMatch = 0.0;
    biometricMessage = "";
    isErrorMessage = false;
    notifyListeners();
  }

  // --- INITIALIZATION ---
  Future<void> _setupRequirements() async {
    showLoading();
    try {
      _isLocationGranted = await Permission.locationWhenInUse.isGranted;
      await _faceSDK.initialize();

      final bool hasRegistered =
          SharedPreferencesHelper.getBool(AppPreferences.IS_FACE_REGISTERED) ??
              false;
      final String? photoUrl =
          SharedPreferencesHelper.getString(AppPreferences.IMAGE_URL);

      if (!hasRegistered || photoUrl == null || photoUrl.isEmpty) {
        _isRegistrationMode = true;
      } else {
        _isRegistrationMode = false;
        await _fetchMasterPhoto(photoUrl);
      }

      if (_isLocationGranted) {
        await _initializeCamera();
      } else {
        _updateMessage("Akses lokasi diperlukan",
            isError: true, bypassThrottle: true);
      }
    } catch (e) {
      debugPrint("🚨 INIT_ERROR: $e");
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) return;

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
      _isFaceDetected = false;
      _isProcessing = false;
      _capturedFaceBytes = null;
      _updateMessage("Posisikan wajah Anda",
          isError: false, bypassThrottle: true);

      _startStream();
    } catch (e) {
      _updateMessage("Kamera tidak tersedia",
          isError: true, bypassThrottle: true);
    }
  }

  // --- STREAMING & DETECTION ---
  void _startStream() {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    _cameraController!.startImageStream((image) {
      if (_isProcessing ||
          _isFaceDetected ||
          isLoading ||
          !_isLocationGranted) {
        return;
      }

      final now = DateTime.now();
      if (_lastProcessingTime != null &&
          now.difference(_lastProcessingTime!).inMilliseconds < 600) return;
      _lastProcessingTime = now;

      _detectFaceLogic(image);
    });
  }

  Future<void> _detectFaceLogic(CameraImage image) async {
    _isProcessing = true;
    try {
      final inputImage = CameraUtils.convertCameraImageToInputImage(
          image, _cameraDescription!);
      if (inputImage == null) return;

      final faces = await _faceDetector.processImage(inputImage);
      if (faces.isEmpty) {
        _updateMessage("Wajah tidak terdeteksi", isError: false);
        return;
      }

      final face = faces[0];

      if (face.headEulerAngleY! > 15 ||
          face.headEulerAngleY! < -15 ||
          face.headEulerAngleX! > 15 ||
          face.headEulerAngleX! < -15) {
        _updateMessage("Hadap lurus ke kamera", isError: true);
        return;
      }

      if (face.boundingBox.width < 120) {
        _updateMessage("Dekatkan wajah Anda", isError: true);
        return;
      }

      _updateMessage("Tahan... Kedipkan mata", isError: false);

      if (face.leftEyeOpenProbability != null &&
          face.rightEyeOpenProbability != null) {
        if (face.leftEyeOpenProbability! < 0.25 &&
            face.rightEyeOpenProbability! < 0.25) {
          _isFaceDetected = true;
          HapticFeedback.mediumImpact();
          await _cameraController?.stopImageStream();
          await Future.delayed(const Duration(milliseconds: 400));
          await _captureAndVerify();
        }
      }
    } catch (e) {
      debugPrint("🚨 FACE_LOGIC_ERROR: $e");
    } finally {
      _isProcessing = false;
    }
  }

  // --- CAPTURE & VERIFICATION ---
  Future<void> _captureAndVerify() async {
    showLoading();
    try {
      if (_cameraController == null ||
          !_cameraController!.value.isInitialized) {
        throw Exception("Kamera error");
      }

      final XFile photo = await _cameraController!.takePicture();
      final Uint8List bytes = await photo.readAsBytes();
      _capturedFaceBytes = bytes;

      if (_isRegistrationMode) {
        await _handleRegistration(photo.path, bytes);
      } else {
        await _handleVerification(bytes);
      }
    } catch (e) {
      _resetStream("Gagal mengambil gambar");
    } finally {
      hideLoading();
    }
  }

  Future<void> _handleVerification(Uint8List liveBytes) async {
    if (_masterFace == null) {
      _resetStream("Foto master tidak ditemukan");
      return;
    }

    try {
      final liveFace = MatchFacesImage(liveBytes, ImageType.LIVE);
      final request = MatchFacesRequest([_masterFace!, liveFace]);
      final response = await _faceSDK.matchFaces(request);

      if (response.error != null) {
        _resetStream("Biometrik Error. Coba lagi.");
      } else {
        final split = await _faceSDK.splitComparedFaces(response.results, 0.80);
        if (split.matchedFaces.isNotEmpty) {
          _percentMatch = (split.matchedFaces[0].similarity * 100);
          _updateMessage("Verifikasi Berhasil! ✅",
              isError: false, bypassThrottle: true);
          notifyListeners();
        } else {
          _resetStream("Wajah tidak cocok ❌");
        }
      }
    } catch (e) {
      _resetStream("Gagal mencocokkan wajah");
    }
  }

  Future<void> _handleRegistration(String path, Uint8List bytes) async {
    final resp = await _registerFaceUseCase(
        param: RegisterFaceParam(faceModel: "MASTER_FACE", imagePath: path));
    if (resp.success) {
      await SharedPreferencesHelper.setBool(
          AppPreferences.IS_FACE_REGISTERED, true);
      _masterFace = MatchFacesImage(bytes, ImageType.PRINTED);
      _percentMatch = 100.0;
      _updateMessage("Registrasi Berhasil! ✅",
          isError: false, bypassThrottle: true);
      if (sl.isRegistered<HomeNotifier>()) sl<HomeNotifier>().init();
    } else {
      _resetStream(resp.message);
    }
  }

  // --- HELPERS ---
  Future<void> _fetchMasterPhoto(String path) async {
    try {
      String fullUrl =
          path.startsWith('http') ? path : "${AppConfig.STORAGE_URL}/$path";
      final resp = await _dio.get(fullUrl,
          options: Options(
              responseType: ResponseType.bytes,
              validateStatus: (status) => status! < 500));
      if (resp.statusCode == 200) {
        _masterFace =
            MatchFacesImage(Uint8List.fromList(resp.data), ImageType.PRINTED);
      } else {
        _isRegistrationMode = true;
      }
    } catch (e) {
      _isRegistrationMode = true;
    }
  }

  void _updateMessage(String msg,
      {bool isError = true, bool bypassThrottle = false}) {
    final now = DateTime.now();
    if (biometricMessage == msg) return;
    if (!isError && !bypassThrottle) {
      if (_lastMessageTime != null &&
          now.difference(_lastMessageTime!).inSeconds < 2) return;
    }
    biometricMessage = msg;
    isErrorMessage = isError;
    _lastMessageTime = now;
    notifyListeners();
  }

  void _resetStream(String errorMsg) {
    _isFaceDetected = false;
    _isProcessing = false;
    _percentMatch = 0.0;
    _capturedFaceBytes = null;
    _updateMessage(errorMsg, isError: true, bypassThrottle: true);

    Future.delayed(const Duration(seconds: 3), () {
      if (_cameraController != null &&
          !_cameraController!.value.isStreamingImages &&
          !isLoading) {
        _startStream();
      }
    });
  }

  Future<void> stopCameraManual() async {
    if (_cameraController != null) {
      final controller = _cameraController;
      _cameraController = null; // UI Langsung berhenti render
      notifyListeners();

      try {
        if (controller!.value.isStreamingImages) {
          await controller.stopImageStream();
        }
        await controller.dispose();
      } catch (e) {
        debugPrint("🚨 Error dispose: $e");
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _faceDetector.close();
    if (_cameraController != null) {
      _cameraController!.dispose();
      _cameraController = null;
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      stopCameraManual();
    } else if (state == AppLifecycleState.resumed &&
        _isLocationGranted &&
        _cameraController == null) {
      _initializeCamera();
    }
  }
}

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_face_api/flutter_face_api.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ibm_presensi_app/app/module/use_case/auth_register_face.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_notifier.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/camera_utils.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
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
      enableClassification: true,
      performanceMode: FaceDetectorMode.fast,
    ),
  );

  // --- State Variables ---
  bool _isProcessing = false;
  bool _isFaceDetected = false;
  bool _isLocationGranted = false;
  bool _isRegistrationMode = false;
  double _percentMatch = 0.0;
  String biometricMessage = "Posisikan wajah Anda";
  bool isErrorMessage = false;
  DateTime? _lastProcessingTime;

  // KUNCI: Variabel untuk menyimpan foto hasil scan agar bisa ditampilkan di Overlay Screen
  Uint8List? _capturedFaceBytes;

  // --- Getters ---
  CameraController? get cameraController => _cameraController;
  bool get isFaceDetected => _isFaceDetected;
  bool get isLocationGranted => _isLocationGranted;
  bool get isRegistrationMode => _isRegistrationMode;
  double get percentMatch => _percentMatch;
  Uint8List? get capturedFaceBytes => _capturedFaceBytes; // Expose ke Screen

  @override
  Future<void> init() async {
    showLoading();

    // 1. Cek Izin & Inisialisasi SDK
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

    // 2. Warm-up hardware & init kamera
    await Future.delayed(const Duration(milliseconds: 400));
    await _initializeCamera();

    hideLoading();
    notifyListeners();
  }

  // --- CAMERA & PERMISSION LOGIC ---

  Future<void> requestLocationPermission() async {
    if (_cameraController != null &&
        _cameraController!.value.isStreamingImages) {
      await _cameraController!.stopImageStream();
    }

    final status = await Permission.locationWhenInUse.request();
    _isLocationGranted = status.isGranted;

    if (status.isPermanentlyDenied) {
      openAppSettings();
    }

    await _initializeCamera();
    notifyListeners();
  }

  Future<void> stopCameraManual() async {
    if (_cameraController != null) {
      if (_cameraController!.value.isStreamingImages) {
        await _cameraController!.stopImageStream();
      }
      await _cameraController!.dispose();
      _cameraController = null;
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
      _startStream();
      notifyListeners();
    } catch (e) {
      debugPrint("🚨 CAMERA_ERROR: $e");
      errorMessage = "Hardware kamera sibuk atau tidak ditemukan.";
    }
  }

  void _startStream() {
    if (_cameraController == null || !_cameraController!.value.isInitialized)
      return;

    _cameraController!.startImageStream((image) {
      if (_isProcessing || _isFaceDetected || isLoading) return;

      final now = DateTime.now();
      if (_lastProcessingTime != null &&
          now.difference(_lastProcessingTime!).inMilliseconds < 500) return;
      _lastProcessingTime = now;

      _detectFaceLogic(image);
    });
  }

  // --- BIOMETRIC LOGIC ---

  Future<void> _detectFaceLogic(CameraImage image) async {
    _isProcessing = true;
    try {
      final inputImage = CameraUtils.convertCameraImageToInputImage(
          image, _cameraDescription!);
      if (inputImage == null) return;

      final faces = await _faceDetector.processImage(inputImage);

      if (faces.isEmpty) {
        _updateMessage("Dekatkan wajah ke kamera", isError: false);
        return;
      }

      final face = faces[0];

      // Validasi jarak wajah (Geometri dasar)
      if (face.boundingBox.width < 110) {
        _updateMessage("Wajah terlalu jauh", isError: true);
        return;
      }

      _updateMessage("Tahan... Kedipkan mata Anda", isError: false);

      // ANTI-SPOOFING: Deteksi Kedipan
      if (face.leftEyeOpenProbability != null &&
          face.rightEyeOpenProbability != null) {
        if (face.leftEyeOpenProbability! < 0.2 &&
            face.rightEyeOpenProbability! < 0.2) {
          _isFaceDetected = true;
          HapticFeedback.heavyImpact();

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

  Future<void> _captureAndVerify() async {
    showLoading();
    try {
      if (_cameraController == null) return;
      final XFile photo = await _cameraController!.takePicture();
      final Uint8List bytes = await photo.readAsBytes();

      // SIMPAN BYTES: Agar Screen bisa menampilkan foto hasil scan di Overlay
      _capturedFaceBytes = bytes;

      if (_isRegistrationMode) {
        await _handleRegistration(photo.path, bytes);
      } else {
        await _handleVerification(bytes);
      }
    } catch (e) {
      _resetStream("Kamera terganggu, coba lagi.");
    }
  }

  Future<void> _handleVerification(Uint8List liveBytes) async {
    if (_masterFace == null) {
      _resetStream("Foto master belum dimuat.");
      return;
    }

    try {
      final liveFace = MatchFacesImage(liveBytes, ImageType.LIVE);
      final request = MatchFacesRequest([_masterFace!, liveFace]);
      final response = await _faceSDK.matchFaces(request);

      if (response.error != null) {
        _resetStream("Gagal memproses biometrik.");
      } else {
        final split = await _faceSDK.splitComparedFaces(response.results, 0.80);
        if (split.matchedFaces.isNotEmpty) {
          _percentMatch = (split.matchedFaces[0].similarity * 100);
          _updateMessage("Verifikasi Berhasil! ✅", isError: false);
          notifyListeners(); // Update Screen untuk memicu navigasi & overlay
        } else {
          _resetStream("Wajah tidak cocok ❌");
        }
      }
    } catch (e) {
      _resetStream("Gagal mencocokkan wajah.");
    } finally {
      hideLoading();
    }
  }

  // --- UTILS ---

  Future<void> _fetchMasterPhoto(String path) async {
    try {
      String fullUrl =
          path.startsWith('http') ? path : "${AppConfig.STORAGE_URL}/$path";
      String finalUrl = "$fullUrl?v=${DateTime.now().millisecondsSinceEpoch}";
      final resp = await _dio.get(finalUrl,
          options: Options(responseType: ResponseType.bytes));

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

  Future<void> _handleRegistration(String path, Uint8List bytes) async {
    final resp = await _registerFaceUseCase(
        param: RegisterFaceParam(faceModel: "MASTER_FACE", imagePath: path));
    if (resp.success) {
      await SharedPreferencesHelper.setBool(
          AppPreferences.IS_FACE_REGISTERED, true);
      _masterFace = MatchFacesImage(bytes, ImageType.PRINTED);
      _percentMatch = 100.0;
      _isRegistrationMode = false;
      _updateMessage("Registrasi Berhasil! ✅", isError: false);
      if (sl.isRegistered<HomeNotifier>()) sl<HomeNotifier>().init();
    } else {
      _resetStream(resp.message);
    }
    hideLoading();
  }

  void _updateMessage(String msg, {bool isError = true}) {
    if (biometricMessage != msg) {
      biometricMessage = msg;
      isErrorMessage = isError;
      notifyListeners();
    }
  }

  void _resetStream(String errorMsg) {
    _isFaceDetected = false;
    _isProcessing = false;
    _percentMatch = 0.0;
    _capturedFaceBytes = null; // Reset foto jika gagal
    _updateMessage(errorMsg);

    Future.delayed(const Duration(seconds: 2), () {
      if (_cameraController != null &&
          !_cameraController!.value.isStreamingImages &&
          !isLoading) {
        _startStream();
      }
    });
  }

  void resetState() {
    _capturedFaceBytes = null;
    _resetStream("Siap...");
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    stopCameraManual();
    _faceDetector.close();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      stopCameraManual();
    } else if (state == AppLifecycleState.resumed) {
      _initializeCamera();
    }
  }
}

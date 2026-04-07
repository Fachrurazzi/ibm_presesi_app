import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_face_api/flutter_face_api.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:ibm_presensi_app/app/module/entity/profile.dart';
import 'package:ibm_presensi_app/app/module/use_case/update_profile.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_notifier.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/camera_utils.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class FaceRecognitionNotifier extends AppProvider with WidgetsBindingObserver {
  final UpdateProfileUseCase _updateProfileUseCase;
  final Dio _dio;

  FaceRecognitionNotifier(this._updateProfileUseCase, this._dio) {
    WidgetsBinding.instance.addObserver(this);
    init();
  }

  // --- VARIABLES ---
  CameraController? _cameraController;
  CameraDescription? _cameraDescription;
  final _faceSDK = FaceSDK.instance;
  MatchFacesImage? mfImage1;

  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableClassification: true,
      enableTracking: true,
    ),
  );

  bool _isProcessing = false;
  bool _isLive = false;
  bool _isLocationGranted = false;
  bool _isRegistrationMode = false;
  double _percentMatch = 0.0;

  // --- GETTERS ---
  CameraController? get cameraController => _cameraController;
  bool get isLive => _isLive;
  bool get isLocationGranted => _isLocationGranted;
  bool get isRegistrationMode => _isRegistrationMode;
  double get percentMatch => _percentMatch;

  @override
  Future<void> init() async {
    showLoading();
    await checkLocationPermission();
    await _faceSDK.initialize();

    String? photoUrl =
        await SharedPreferencesHelper.getString(AppPreferences.IMAGE_URL);
    if (photoUrl == null ||
        photoUrl.isEmpty ||
        !photoUrl.contains('users-avatar')) {
      _isRegistrationMode = true;
    } else {
      await _fetchBasePhoto(photoUrl);
    }

    await _initializeCamera();
    hideLoading();
    notifyListeners();
  }

  Future<void> checkLocationPermission() async {
    final status = await Permission.locationWhenInUse.status;
    _isLocationGranted = status.isGranted;
    notifyListeners();
  }

  Future<void> requestLocationPermission() async {
    final status = await Permission.locationWhenInUse.request();
    if (status.isGranted) {
      _isLocationGranted = true;
      snackbarMessage = "Izin lokasi diberikan! 📍";
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
    notifyListeners();
  }

  Future<void> _fetchBasePhoto(String path) async {
    try {
      String fullUrl =
          path.startsWith('http') ? path : "${AppConfig.STORAGE_URL}/$path";
      String finalUrl = "$fullUrl?v=${DateTime.now().millisecondsSinceEpoch}";

      final response = await _dio.get(
        finalUrl,
        options: Options(
          responseType: ResponseType.bytes,
          validateStatus: (status) => status! < 500,
        ),
      );

      if (response.statusCode == 200) {
        final Uint8List bytes = Uint8List.fromList(response.data);
        mfImage1 = MatchFacesImage(bytes, ImageType.PRINTED);
        _isRegistrationMode = false;
      } else {
        _isRegistrationMode = true;
      }
    } catch (e) {
      _isRegistrationMode = true;
    }
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      _cameraDescription = cameras
          .firstWhere((cam) => cam.lensDirection == CameraLensDirection.front);

      _cameraController = CameraController(
        _cameraDescription!,
        ResolutionPreset.medium,
        enableAudio: false,
        imageFormatGroup: Platform.isAndroid
            ? ImageFormatGroup.nv21
            : ImageFormatGroup.bgra8888,
      );

      await _cameraController!.initialize();

      _cameraController!.startImageStream((CameraImage image) {
        // KUNCI: Cegah loop jika sedang sibuk, sudah live, atau sedang loading UI
        if (_isProcessing || _isLive || isLoading) return;
        _processCameraImage(image);
      });
    } catch (e) {
      errorMessage = "Gagal mengakses kamera.";
    }
  }

  Future<void> _processCameraImage(CameraImage image) async {
    _isProcessing = true;
    try {
      final inputImage = CameraUtils.convertCameraImageToInputImage(
          image, _cameraDescription!);
      if (inputImage == null) return;

      final faces = await _faceDetector.processImage(inputImage);

      if (faces.length > 1) {
        errorMessage = "Hanya boleh ada 1 wajah di layar.";
        notifyListeners();
        return;
      }

      if (faces.isEmpty) {
        errorMessage = "";
        return;
      }

      final face = faces[0];

      // LOGIKA KEDIPAN (LIVENESS)
      if (face.leftEyeOpenProbability != null &&
          face.rightEyeOpenProbability != null) {
        if (face.leftEyeOpenProbability! < 0.2 &&
            face.rightEyeOpenProbability! < 0.2) {
          _isLive = true;
          HapticFeedback.mediumImpact();

          // A. STOP STREAM SEGERA
          await _cameraController?.stopImageStream();

          // B. JEDA 500ms agar hardware kamera beralih mode (PENTING!)
          await Future.delayed(const Duration(milliseconds: 500));

          notifyListeners();

          // C. AMBIL FOTO
          await _captureAndVerify();
        }
      }
    } catch (e) {
      debugPrint("Process Error: $e");
    } finally {
      if (!_isLive) _isProcessing = false;
    }
  }

  Future<void> _captureAndVerify() async {
    try {
      showLoading();
      if (_cameraController == null ||
          !_cameraController!.value.isInitialized) {
        return;
      }

      final XFile file = await _cameraController!.takePicture();
      final Uint8List bytes = await file.readAsBytes();

      if (_isRegistrationMode) {
        await _registerFace(bytes);
      } else {
        await _matchFaces(bytes);
      }
    } catch (e) {
      debugPrint("Capture Error: $e");
      _restartCameraStream("Gagal mengambil foto. Silakan berkedip lagi.");
    }
  }

  Future<void> _registerFace(Uint8List bytes) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final file = File(
          '${tempDir.path}/face_reg_${DateTime.now().millisecondsSinceEpoch}.jpg');
      await file.writeAsBytes(bytes);

      final name =
          await SharedPreferencesHelper.getString(AppPreferences.USER_NAME) ??
              'User';
      final response = await _updateProfileUseCase(
          ProfileParamUpdate(name: name, image: file));

      if (response.success && response.data != null) {
        final user = response.data as ProfileEntity;
        await SharedPreferencesHelper.setString(
            AppPreferences.IMAGE_URL, user.image ?? "");
        mfImage1 = MatchFacesImage(bytes, ImageType.PRINTED);
        _percentMatch = 100.0;
        _isRegistrationMode = false;
        snackbarMessage = "Wajah berhasil didaftarkan! ✅";
        if (sl.isRegistered<HomeNotifier>()) sl<HomeNotifier>().init();
      } else {
        _restartCameraStream(response.message);
      }
    } catch (e) {
      _restartCameraStream("Gagal registrasi.");
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  Future<void> _matchFaces(Uint8List bytes) async {
    if (mfImage1 == null) {
      _restartCameraStream("Data master tidak ditemukan.");
      return;
    }

    try {
      MatchFacesImage mfImage2 = MatchFacesImage(bytes, ImageType.LIVE);
      final request = MatchFacesRequest([mfImage1!, mfImage2]);
      final response = await _faceSDK.matchFaces(request);

      if (response.error != null) {
        _restartCameraStream("Gagal memproses wajah.");
      } else {
        final split = await _faceSDK.splitComparedFaces(response.results, 0.75);
        if (split.matchedFaces.isNotEmpty) {
          _percentMatch = double.parse(
              (split.matchedFaces[0].similarity * 100).toStringAsFixed(1));
          snackbarMessage = "Terverifikasi! ($_percentMatch%)";
        } else {
          _restartCameraStream("Wajah tidak cocok dengan database.");
        }
      }
    } catch (e) {
      _restartCameraStream("Kesalahan biometrik.");
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  void _restartCameraStream(String errorMsg) {
    hideLoading();
    _percentMatch = -1.0;
    _isLive = false;
    _isProcessing = false;
    errorMessage = errorMsg;
    notifyListeners();

    // Beri jeda agar hardware tidak crash saat start stream kembali
    Future.delayed(const Duration(milliseconds: 600), () {
      if (_cameraController != null &&
          !_cameraController!.value.isStreamingImages) {
        _cameraController!.startImageStream((image) {
          if (!_isProcessing && !_isLive && !isLoading) {
            _processCameraImage(image);
          }
        });
      }
    });
  }

  void resetState() {
    _percentMatch = 0.0;
    _isLive = false;
    _isProcessing = false;
    errorMessage = "";

    // Nyalakan kembali stream kamera agar user bisa scan ulang
    if (_cameraController != null &&
        !_cameraController!.value.isStreamingImages) {
      _cameraController!.startImageStream((image) {
        if (!_isProcessing && !_isLive && !isLoading)
          _processCameraImage(image);
      });
    }

    notifyListeners();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _faceDetector.close();
    _cameraController?.dispose();
    super.dispose();
  }
}

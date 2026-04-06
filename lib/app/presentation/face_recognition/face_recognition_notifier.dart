import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_face_api/flutter_face_api.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ibm_presensi_app/app/module/use_case/update_profile.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_notifier.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ibm_presensi_app/app/module/entity/profile.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class FaceRecognitionNotifier extends AppProvider with WidgetsBindingObserver {
  final UpdateProfileUseCase _updateProfileUseCase;
  final Dio _dio;

  FaceRecognitionNotifier(this._updateProfileUseCase, this._dio) {
    WidgetsBinding.instance.addObserver(this);
    init();
  }

  final _faceSDK = FaceSDK.instance;
  MatchFacesImage? mfImage1, mfImage2;
  Image? _currentImage, _basePhotoWidget;
  double _percentMatch = 0.0;
  bool _isRegistrationMode = false;
  bool _isLocationGranted = false;

  Image? get currentImage => _currentImage;
  Image? get basePhotoWidget => _basePhotoWidget;
  double get percentMatch => _percentMatch;
  bool get isRegistrationMode => _isRegistrationMode;
  bool get isLocationGranted => _isLocationGranted;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      checkLocationPermission();
    }
  }

  @override
  Future<void> init() async {
    try {
      showLoading();
      await checkLocationPermission();
      await _faceSDK.initialize();

      String? photoUrl = await SharedPreferencesHelper.getString(AppPreferences.IMAGE_URL);

      if (photoUrl == null || photoUrl.isEmpty || !photoUrl.contains('users-avatar')) {
        _isRegistrationMode = true;
      } else {
        await _fetchBasePhoto(photoUrl);
      }
    } catch (e) {
      debugPrint("FACE_SDK_INIT_ERROR: $e");
      _isRegistrationMode = true;
    } finally {
      hideLoading();
      notifyListeners();
    }
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
      snackbarMessage = "Izin lokasi berhasil diberikan! 📍";
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
    notifyListeners();
  }

  Future<void> _fetchBasePhoto(String path) async {
    try {
      String fullUrl = path.startsWith('http') ? path : "${AppConfig.STORAGE_URL}/$path";
      String finalUrl = "$fullUrl?v=${DateTime.now().millisecondsSinceEpoch}";

      final response = await _dio.get(
        finalUrl,
        options: Options(
          responseType: ResponseType.bytes,
          headers: {"User-Agent": "Mozilla/5.0"},
          validateStatus: (status) => status! < 500,
        ),
      );

      if (response.statusCode == 200) {
        final Uint8List bytes = Uint8List.fromList(response.data);
        _setImage(bytes, ImageType.PRINTED, 1);
        _isRegistrationMode = false;
      } else {
        _isRegistrationMode = true;
      }
    } catch (e) {
      _isRegistrationMode = true;
    }
  }

  void _setImage(Uint8List bytes, ImageType type, int flag) {
    final mdImage = MatchFacesImage(bytes, type);
    if (flag == 1) {
      mfImage1 = mdImage;
      _basePhotoWidget = Image.memory(bytes, fit: BoxFit.cover);
    } else {
      mfImage2 = mdImage;
      _currentImage = Image.memory(bytes, fit: BoxFit.cover);
    }
    notifyListeners();
  }

  Future<void> getCurrentPhoto() async {
    _currentImage = null;
    _percentMatch = 0.0;
    errorMessage = "";
    notifyListeners();

    final response = await _faceSDK.startFaceCapture();

    if (response.image != null) {
      final bytes = response.image!.image;
      _setImage(bytes, ImageType.LIVE, 2);

      if (_isRegistrationMode) {
        await _registerFace(bytes);
      } else {
        await _matchFaces();
      }
    }
  }

  Future<void> _registerFace(Uint8List bytes) async {
    showLoading();
    try {
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/face_reg_${DateTime.now().millisecondsSinceEpoch}.jpg');
      await file.writeAsBytes(bytes);

      final name = await SharedPreferencesHelper.getString(AppPreferences.USER_NAME) ?? 'User';
      final response = await _updateProfileUseCase(ProfileParamUpdate(name: name, image: file));

      if (response.success && response.data != null) {
        final user = response.data as ProfileEntity;
        await SharedPreferencesHelper.setString(AppPreferences.IMAGE_URL, user.image ?? "");
        _setImage(bytes, ImageType.PRINTED, 1);
        _percentMatch = 100.0;
        _isRegistrationMode = false;
        snackbarMessage = "Wajah berhasil didaftarkan! ✅";
        if (sl.isRegistered<HomeNotifier>()) sl<HomeNotifier>().init();
      } else {
        _percentMatch = -1.0;
        errorMessage = response.message;
      }
    } catch (e) {
      _percentMatch = -1.0;
      errorMessage = "Gagal registrasi: $e";
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  Future<void> _matchFaces() async {
    if (mfImage1 == null || mfImage2 == null) {
      errorMessage = "Data foto master tidak ditemukan.";
      notifyListeners();
      return;
    }

    showLoading();
    try {
      final request = MatchFacesRequest([mfImage1!, mfImage2!]);
      final response = await _faceSDK.matchFaces(request);

      if (response.error != null) {
        _percentMatch = -1.0;
        errorMessage = "Gagal memproses wajah. Pastikan cahaya cukup.";
      } else {
        final split = await _faceSDK.splitComparedFaces(response.results, 0.75);
        if (split.matchedFaces.isNotEmpty) {
          _percentMatch = double.parse((split.matchedFaces[0].similarity * 100).toStringAsFixed(1));
        } else {
          _percentMatch = -1.0;
          if (response.results.isEmpty) {
            errorMessage = "Wajah tidak terdeteksi. Posisikan wajah di dalam lingkaran.";
          } else {
            errorMessage = "Wajah tidak cocok dengan foto master Anda!";
          }
        }
      }
    } catch (e) {
      _percentMatch = -1.0;
      errorMessage = "Terjadi kesalahan biometrik.";
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
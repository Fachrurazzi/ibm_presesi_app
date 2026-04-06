import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/use_case/update_profile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ibm_presensi_app/app/module/entity/profile.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_notifier.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class ProfileNotifier extends AppProvider {
  final UpdateProfileUseCase _updateProfileUseCase;

  static String? _internalLatestPhotoUrl;
  static String? get latestPhotoUrlGlobal => _internalLatestPhotoUrl;

  ProfileNotifier(this._updateProfileUseCase) {
    init();
  }

  // --- State Variables ---
  String _name = '';
  String _position = '';
  String? _imageUrlServer;
  File? _imageFileLocal;
  String _joinDate = '';
  bool _obscureOld = true;
  bool _obscureNew = true;

  // --- Getters ---
  String get name => _name;
  String get position => _position;
  String? get imageUrlServer => _imageUrlServer;
  File? get imageFileLocal => _imageFileLocal;
  String get joinDate => _joinDate;
  bool get obscureOld => _obscureOld;
  bool get obscureNew => _obscureNew;

  final nameController = TextEditingController();
  final oldPassController = TextEditingController();
  final newPassController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  void toggleObscureOld() {
    _obscureOld = !_obscureOld;
    notifyListeners();
  }

  void toggleObscureNew() {
    _obscureNew = !_obscureNew;
    notifyListeners();
  }

  @override
  Future<void> init() async {
    debugPrint("PROFILE_INIT: Sinkronisasi data...");

    _name =
        await SharedPreferencesHelper.getString(AppPreferences.USER_NAME) ?? '';
    _position =
        await SharedPreferencesHelper.getString(AppPreferences.POSITION_NAME) ??
            'Karyawan';
    _joinDate =
        await SharedPreferencesHelper.getString(AppPreferences.JOIN_DATE) ??
            '-';

    String? savedUrl =
        await SharedPreferencesHelper.getString(AppPreferences.IMAGE_URL);
    _imageUrlServer = _sanitizeUrl(savedUrl);

    if (nameController.text.isEmpty) {
      nameController.text = _name;
    }

    notifyListeners();
  }

  // Membersihkan URL agar valid untuk dipanggil widget
  String? _sanitizeUrl(String? url) {
    if (url == null || url.isEmpty) return null;
    String clean = url;
    if (clean.contains('?v=')) clean = clean.split('?v=').first;
    if (clean.contains('/api/storage/http')) {
      clean = clean.split('/api/storage/').last;
    }
    if (clean.contains('/storage/') && !clean.contains('/api/storage/')) {
      clean = clean.replaceFirst('/storage/', '/api/storage/');
    }
    if (!clean.startsWith('http')) {
      String path = clean.startsWith('/') ? clean.substring(1) : clean;
      clean = "${AppConfig.STORAGE_URL}/$path";
    }
    return clean.replaceAll('api/storage//', 'api/storage/');
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile =
          await _picker.pickImage(source: source, imageQuality: 50);
      if (pickedFile != null) {
        _imageFileLocal = File(pickedFile.path);
        notifyListeners();
      }
    } catch (e) {
      errorMessage = "Gagal mengambil gambar";
      notifyListeners();
    }
  }

  Future<void> submitSave() async {
    final inputName = nameController.text.trim();
    if (inputName.isEmpty) {
      errorMessage = "Nama tidak boleh kosong";
      notifyListeners();
      return;
    }

    showLoading();
    final response = await _updateProfileUseCase(
      ProfileParamUpdate(
        name: inputName,
        image: _imageFileLocal,
        oldPassword: oldPassController.text,
        newPassword: newPassController.text,
      ),
    );

    if (response.success) {
      final userResponse = response.data as ProfileEntity;
      _name = inputName;

      if (userResponse.position != null) {
        _position = userResponse.position!['name']?.toString() ?? "Karyawan";
      }

      await SharedPreferencesHelper.setString(AppPreferences.USER_NAME, _name);
      await SharedPreferencesHelper.setString(
          AppPreferences.POSITION_NAME, _position);

      // KUNCI UTAMA: Tangkap dan cek string image-nya di sini
      String? rawImageUrl = response.data?.image;

      if (rawImageUrl == null || rawImageUrl.isEmpty) {
        // Jika log ini muncul, cek ProfileEntity.fromJson Anda
        debugPrint("🚨 BUG DETECTED: userResponse.image is NULL atau kosong!");
      } else {
        debugPrint("✅ IMAGE DITEMUKAN DARI RESPONSE: $rawImageUrl");
        String? cleanUrlToSave = _sanitizeUrl(rawImageUrl);

        if (cleanUrlToSave != null) {
          String uniqueUrl =
              "$cleanUrlToSave?v=${DateTime.now().millisecondsSinceEpoch}";
          // Simpan ke SharedPreferences
          await SharedPreferencesHelper.setString(
              AppPreferences.IMAGE_URL, uniqueUrl);

          // Update state layar Profile
          _imageUrlServer = uniqueUrl;

          // Update state layar Home SECARA PAKSA
          if (sl.isRegistered<HomeNotifier>()) {
            sl<HomeNotifier>().updateUserData(
              newName: _name,
              newPosition: _position,
              newPhoto: uniqueUrl,
            );
          }
        }
      }

      _imageFileLocal = null;
      oldPassController.clear();
      newPassController.clear();

      hideLoading();
      snackbarMessage = "Profil Berhasil Diperbarui! ✅";
      notifyListeners();
    } else {
      hideLoading();
      errorMessage = response.message;
      notifyListeners();
    }
  }

  void resetState() {
    _internalLatestPhotoUrl = null;
    _imageFileLocal = null;
    _name = '';
    _position = '';
    _imageUrlServer = null;
    nameController.clear();
    oldPassController.clear();
    newPassController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    oldPassController.dispose();
    newPassController.dispose();
    super.dispose();
  }
}

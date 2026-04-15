import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ibm_presensi_app/app/module/entity/profile.dart';
import 'package:ibm_presensi_app/app/module/use_case/update_profile.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_notifier.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class ProfileNotifier extends AppProvider {
  final UpdateProfileUseCase _updateProfileUseCase;

  ProfileNotifier(this._updateProfileUseCase) {
    init();
  }

  // --- UI State ---
  ProfileEntity _profile = const ProfileEntity();
  File? _imageFileLocal;
  String? _imageUrlServer;
  bool _obscureOld = true;
  bool _obscureNew = true;
  bool isUpdateSuccess = false;

  // --- Getters ---
  ProfileEntity get profile => _profile;
  String get name => _profile.name.isEmpty ? "Karyawan IBM" : _profile.name;
  String get position => _profile.positionName;
  String? get imageUrlServer => _imageUrlServer;
  File? get imageFileLocal => _imageFileLocal;

  // REVISI: Pastikan getter joinDate mengambil data yang benar
  String get joinDate => _profile.joinDate.isEmpty || _profile.joinDate == "-"
      ? (SharedPreferencesHelper.getString(AppPreferences.JOIN_DATE) ?? "-")
      : _profile.joinDate;

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
    debugPrint("🚀 PROFILE_INIT: Sinkronisasi data...");

    final sName = SharedPreferencesHelper.getString(AppPreferences.USER_NAME) ??
        "Karyawan IBM";
    final sPos =
        SharedPreferencesHelper.getString(AppPreferences.POSITION_NAME) ??
            "Anggota IBM";
    final sJoin =
        SharedPreferencesHelper.getString(AppPreferences.JOIN_DATE) ?? "-";
    final sImg = SharedPreferencesHelper.getString(AppPreferences.IMAGE_URL);

    // REVISI: Update internal state profile dengan JOIN_DATE yang pasti
    _profile = _profile.copyWith(
      name: sName,
      joinDate: sJoin,
      position: PositionEntity(name: sPos),
    );

    if (sImg != null) _imageUrlServer = _sanitizeUrl(sImg);
    if (nameController.text.isEmpty) nameController.text = _profile.name;

    notifyListeners();
  }

  void updateFromAuth({
    required String name,
    required String? photo,
    required String joinDate,
    required String position,
  }) {
    _profile = _profile.copyWith(
      name: name,
      joinDate: joinDate,
      position: PositionEntity(name: position),
    );

    if (photo != null) _imageUrlServer = _sanitizeUrl(photo);
    nameController.text = name;

    notifyListeners();
  }

  String? _sanitizeUrl(String? url) {
    if (url == null || url.isEmpty) return null;
    String clean = url.contains('?v=') ? url.split('?v=').first : url;
    if (!clean.startsWith('http')) {
      String path = clean.startsWith('/') ? clean.substring(1) : clean;
      clean = "${AppConfig.STORAGE_URL}/$path";
    }
    return clean.replaceAll(RegExp(r'(?<!:)/{2,}'), '/');
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
      errorMessage = "Izin kamera/galeri ditolak";
      notifyListeners();
    }
  }

  Future<void> submitSave() async {
    final inputName = nameController.text.trim();
    if (inputName.isEmpty) {
      errorMessage = "Nama lengkap wajib diisi";
      notifyListeners();
      return;
    }

    isUpdateSuccess = false;
    showLoading();

    try {
      final response = await _updateProfileUseCase(
        param: ProfileParamUpdate(
          name: inputName,
          image: _imageFileLocal,
          oldPassword:
              oldPassController.text.isEmpty ? null : oldPassController.text,
          newPassword:
              newPassController.text.isEmpty ? null : newPassController.text,
        ),
      );

      if (response.success && response.data != null) {
        final userResponse = response.data as ProfileEntity;

        // KUNCI: Pertahankan Join Date lama jika response API tidak mengirimkannya
        String currentJoinDate =
            userResponse.joinDate.isEmpty || userResponse.joinDate == "-"
                ? _profile.joinDate
                : userResponse.joinDate;

        _profile = userResponse.copyWith(joinDate: currentJoinDate);

        // Logic Foto: Cache Busting
        String? finalPhotoUrl = _imageUrlServer;
        if (userResponse.image != null) {
          String? cleanUrl = _sanitizeUrl(userResponse.image);
          if (cleanUrl != null) {
            finalPhotoUrl =
                "$cleanUrl?v=${DateTime.now().millisecondsSinceEpoch}";
            _imageUrlServer = finalPhotoUrl;
          }
        }

        // Simpan ke Storage secara permanen
        await Future.wait([
          SharedPreferencesHelper.setString(
              AppPreferences.USER_NAME, _profile.name),
          SharedPreferencesHelper.setString(
              AppPreferences.POSITION_NAME, _profile.positionName),
          SharedPreferencesHelper.setString(
              AppPreferences.JOIN_DATE, _profile.joinDate),
          SharedPreferencesHelper.setString(
              AppPreferences.IMAGE_URL, finalPhotoUrl ?? ""),
        ]);

        // Sync ke HomeNotifier
        if (sl.isRegistered<HomeNotifier>()) {
          sl<HomeNotifier>().updateUserData(
            newName: _profile.name,
            newPosition: _profile.positionName,
            newPhoto: finalPhotoUrl,
          );
        }

        _imageFileLocal = null;
        oldPassController.clear();
        newPassController.clear();
        isUpdateSuccess = true;
      } else {
        errorMessage = response.message;
      }
    } catch (e) {
      errorMessage = "Gagal memperbarui profil";
      debugPrint("🚨 PROFILE_UPDATE_ERROR: $e");
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  void resetState() {
    _imageFileLocal = null;
    oldPassController.clear();
    newPassController.clear();
    init();
  }

  @override
  void dispose() {
    nameController.dispose();
    oldPassController.dispose();
    newPassController.dispose();
    super.dispose();
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/user.dart';
import 'package:ibm_presensi_app/app/module/use_case/user_update_profile_use_case.dart';
import 'package:ibm_presensi_app/app/presentation/common/dashboard/dashboard_notifier.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:image_picker/image_picker.dart';

class ProfileNotifier extends AppProvider {
  final UserUpdateProfileUseCase _updateProfileUseCase;

  ProfileNotifier(this._updateProfileUseCase) {
    init();
  }

  // ========== STATE VARIABLES ==========
  UserEntity _user = UserEntity.empty(); // 👈 Gunakan empty()
  File? _imageFileLocal;
  String? _imageUrlServer;
  bool _obscureOld = true;
  bool _obscureNew = true;
  bool _isUpdateSuccess = false;
  String _profileError = "";

  // ========== GETTERS ==========
  UserEntity get user => _user;
  String get userName => _user.name.isNotEmpty ? _user.name : "Karyawan IBM";
  String get userPosition => _user.displayPosition;
  String? get imageUrlServer => _imageUrlServer;
  File? get imageFileLocal => _imageFileLocal;
  String get joinDate => _user.joinDate ?? "-";
  bool get obscureOld => _obscureOld;
  bool get obscureNew => _obscureNew;
  bool get isUpdateSuccess => _isUpdateSuccess;
  String get profileError => _profileError;

  final nameController = TextEditingController();
  final oldPassController = TextEditingController();
  final newPassController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  // ========== TOGGLE PASSWORD VISIBILITY ==========
  void toggleObscureOld() {
    _obscureOld = !_obscureOld;
    notifyListeners();
  }

  void toggleObscureNew() {
    _obscureNew = !_obscureNew;
    notifyListeners();
  }

  // ========== INIT ==========
  @override
  Future<void> init() async {
    await loadLocalData();
  }

  Future<void> loadLocalData() async {
    final session = SharedPreferencesHelper.getUserSession();
    if (session != null) {
      _user = UserEntity(
        id: session.id,
        name: session.name,
        email: session.email,
        positionName: session.positionName,
        joinDate: session.joinDate,
        leaveQuota: session.leaveQuota,
        remainingLeave: session.remainingLeave,
        cashableLeave: session.cashableLeave,
        isDefaultPassword: session.isDefaultPassword,
        isFaceRegistered: session.isFaceRegistered,
      );
      _imageUrlServer = session.avatarUrl;
      nameController.text = session.name;
    }

    // Fallback dari SharedPreferences langsung
    if (_user.name.isEmpty) {
      final sName =
          SharedPreferencesHelper.getString(AppPreferences.USER_NAME) ??
              "Karyawan IBM";
      final sPos =
          SharedPreferencesHelper.getString(AppPreferences.POSITION_NAME) ??
              "Staff";
      final sJoin =
          SharedPreferencesHelper.getString(AppPreferences.JOIN_DATE) ?? "-";
      final sImg =
          SharedPreferencesHelper.getString(AppPreferences.USER_AVATAR);

      _user = _user.copyWith(
        name: sName,
        positionName: sPos,
        joinDate: sJoin,
      );
      if (sImg != null) _imageUrlServer = _sanitizeUrl(sImg);
      nameController.text = sName;
    }

    notifyListeners();
  }

  // ========== RESET DATA ==========
  void resetData() {
    debugPrint("🧹 [PROFILE] Resetting memory...");
    UserEntity user = UserEntity.empty();
    _imageFileLocal = null;
    _imageUrlServer = null;
    _isUpdateSuccess = false;
    _profileError = "";
    nameController.clear();
    oldPassController.clear();
    newPassController.clear();
    init();
  }

  // ========== UPDATE FROM AUTH (Dipanggil dari Login) ==========
  void updateFromAuth({
    required String name,
    required String? photo,
    required String joinDate,
    required String position,
    int? leaveQuota,
    int? remainingLeave,
  }) {
    _user = _user.copyWith(
      name: name,
      positionName: position,
      joinDate: joinDate,
      leaveQuota: leaveQuota ?? _user.leaveQuota,
      remainingLeave: remainingLeave ?? _user.remainingLeave,
    );

    if (photo != null) _imageUrlServer = _sanitizeUrl(photo);
    nameController.text = name;

    notifyListeners();
  }

  // ========== SANITIZE URL ==========
  String? _sanitizeUrl(String? url) {
    if (url == null || url.isEmpty) return null;
    if (url.startsWith('http')) return url;
    return AppConfig.getImageUrl(url);
  }

  // ========== PICK IMAGE ==========
  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile =
          await _picker.pickImage(source: source, imageQuality: 70);
      if (pickedFile != null) {
        _imageFileLocal = File(pickedFile.path);
        notifyListeners();
      }
    } catch (e) {
      _profileError = "Izin kamera/galeri ditolak";
      notifyListeners();
    }
  }

  // ========== SUBMIT UPDATE ==========
  Future<void> submitUpdate() async {
    final inputName = nameController.text.trim();
    if (inputName.isEmpty) {
      _profileError = "Nama lengkap wajib diisi";
      notifyListeners();
      return;
    }

    _isUpdateSuccess = false;
    _profileError = "";
    showLoading();

    try {
      final params = UserUpdateParams(
        name: inputName,
        imagePath: _imageFileLocal?.path,
      );

      final result = await _updateProfileUseCase(params);

      if (result is SuccessState<UserEntity> && result.data != null) {
        final updatedUser = result.data!;

        // Update state
        _user = updatedUser;
        _imageFileLocal = null;
        _imageUrlServer = updatedUser.fullAvatarUrl;

        // Save to SharedPreferences
        final session = SharedPreferencesHelper.getUserSession();
        if (session != null) {
          final updatedSession = session.copyWith(
            name: updatedUser.name,
            avatar: updatedUser.fullAvatarUrl,
          );
          await SharedPreferencesHelper.saveUserSession(updatedSession);
        }

        // Sync to DashboardNotifier
        if (sl.isRegistered<DashboardNotifier>()) {
          sl<DashboardNotifier>().updateUserInfo(
            name: updatedUser.name,
            avatar: updatedUser.fullAvatarUrl,
          );
        }

        _isUpdateSuccess = true;
      } else {
        _profileError = result.message;
      }
    } catch (e) {
      _profileError = "Gagal memperbarui profil";
      debugPrint("🚨 PROFILE_UPDATE_ERROR: $e");
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  // ========== CLEAR ERROR ==========
  @override
  void clearError() {
    _profileError = "";
    notifyListeners();
  }

  void clearSuccess() {
    _isUpdateSuccess = false;
    notifyListeners();
  }

  // ========== DISPOSE ==========
  @override
  void dispose() {
    nameController.dispose();
    oldPassController.dispose();
    newPassController.dispose();
    super.dispose();
  }
}

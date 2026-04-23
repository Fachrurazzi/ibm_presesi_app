import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/auth.dart';
import 'package:ibm_presensi_app/app/module/use_case/auth_update_password_use_case.dart';
import 'package:ibm_presensi_app/app/presentation/common/dashboard/dashboard_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/common/profile/profile_notifier.dart';

import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class ChangePasswordNotifier extends AppProvider {
  final AuthUpdatePasswordUseCase _updatePasswordUseCase;

  ChangePasswordNotifier(this._updatePasswordUseCase) {
    init();
  }

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  String _errorMessage = "";
  @override
  String get errorMessage => _errorMessage;

  void toggleVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  @override
  Future<void> init() async {
    _errorMessage = "";
    currentPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
  }

  Future<void> submit(BuildContext context) async {
    final currentPass = currentPasswordController.text;
    final newPass = newPasswordController.text;
    final confirm = confirmPasswordController.text;

    if (!_validate(currentPass, newPass, confirm)) return;

    _errorMessage = "";
    showLoading();

    try {
      final params = AuthUpdatePasswordParam(
        currentPassword: currentPass,
        newPassword: newPass,
      );

      final result = await _updatePasswordUseCase(params);

      if (result is SuccessState<bool> && result.data == true) {
        await SharedPreferencesHelper.setBool(
          AppPreferences.IS_DEFAULT_PASSWORD,
          false,
        );

        if (sl.isRegistered<DashboardNotifier>()) {
          await sl<DashboardNotifier>().refreshAll();
        }
        if (sl.isRegistered<ProfileNotifier>()) {
          await sl<ProfileNotifier>().loadLocalData();
        }

        hideLoading();

        final isFaceReg = SharedPreferencesHelper.getBool(
              AppPreferences.IS_FACE_REGISTERED,
            ) ??
            false;

        if (!context.mounted) return;

        if (!isFaceReg) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/face-recognition',
            (route) => false,
          );
        } else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/main-navbar',
            (route) => false,
          );
        }
      } else {
        hideLoading();
        _errorMessage = result.message;
        notifyListeners();
      }
    } catch (e) {
      hideLoading();
      _errorMessage = "Gagal memperbarui password. Cek koneksi Anda.";
      notifyListeners();
    }
  }

  bool _validate(String currentPass, String newPass, String confirm) {
    if (currentPass.isEmpty) {
      _errorMessage = "Password lama harus diisi";
      notifyListeners();
      return false;
    }
    if (newPass.length < 8) {
      _errorMessage = "Password baru minimal 8 karakter";
      notifyListeners();
      return false;
    }
    if (!newPass.contains(RegExp(r'[0-9]'))) {
      _errorMessage = "Password harus mengandung angka";
      notifyListeners();
      return false;
    }
    if (newPass != confirm) {
      _errorMessage = "Konfirmasi password tidak cocok";
      notifyListeners();
      return false;
    }
    if (currentPass == newPass) {
      _errorMessage = "Password baru tidak boleh sama dengan password lama";
      notifyListeners();
      return false;
    }
    return true;
  }

  @override
  void clearError() {
    _errorMessage = "";
    notifyListeners();
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}

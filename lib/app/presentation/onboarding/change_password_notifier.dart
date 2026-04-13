import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/use_case/auth_update_password.dart';
import 'package:ibm_presensi_app/app/presentation/profile/profile_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_notifier.dart'; // Tambahkan ini
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class ChangePasswordNotifier extends AppProvider {
  final AuthUpdatePasswordUseCase _updatePasswordUseCase;

  ChangePasswordNotifier(this._updatePasswordUseCase) {
    init();
  }

  final passwordController = TextEditingController();
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
  void init() {
    _errorMessage = "";
    passwordController.clear();
    confirmPasswordController.clear();
  }

  Future<void> submit(BuildContext context) async {
    if (passwordController.text.length < 8) {
      _errorMessage = "Password minimal harus 8 karakter";
      notifyListeners();
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      _errorMessage = "Konfirmasi password tidak cocok";
      notifyListeners();
      return;
    }

    _errorMessage = "";
    showLoading();

    try {
      final response =
          await _updatePasswordUseCase(param: passwordController.text);

      if (response.success) {
        // 1. UPDATE STATUS PASSWORD (Sudah bukan default)
        await SharedPreferencesHelper.setBool(
            AppPreferences.IS_DEFAULT_PASSWORD, false);

        // 2. SINKRONISASI DATA TERBARU (Sangat Penting!)
        // Kita panggil init HomeNotifier agar dia menarik data terbaru (termasuk is_face_registered)
        if (sl.isRegistered<HomeNotifier>()) {
          await sl<HomeNotifier>().refreshData();
        }

        if (sl.isRegistered<ProfileNotifier>()) {
          await sl<ProfileNotifier>().init();
        }

        hideLoading();

        // 3. AMBIL STATUS WAJAH TERBARU SETELAH REFRESH
        final isFaceReg = SharedPreferencesHelper.getBool(
                AppPreferences.IS_FACE_REGISTERED) ??
            false;

        // 4. NAVIGASI BERDASARKAN STATUS NYATA
        if (!isFaceReg) {
          debugPrint("🚀 NAVIGASI: User Baru -> Ambil Wajah");
          if (!context.mounted) return;
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/face-recognition',
            (route) => false,
            arguments: {'isRegistration': true},
          );
        } else {
          debugPrint("🏠 NAVIGASI: User Lama -> Dashboard");
          if (!context.mounted) return;
          Navigator.pushNamedAndRemoveUntil(
              context, '/main-navbar', (route) => false);
        }
      } else {
        hideLoading();
        _errorMessage = response.message;
        notifyListeners();
      }
    } catch (e) {
      hideLoading();
      debugPrint("🚨 ERROR_CHANGE_PASS: $e");
      _errorMessage = "Terjadi kesalahan sistem.";
      notifyListeners();
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}

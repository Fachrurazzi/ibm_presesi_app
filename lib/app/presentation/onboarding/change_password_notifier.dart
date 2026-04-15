import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/use_case/auth_update_password.dart';
import 'package:ibm_presensi_app/app/presentation/profile/profile_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_notifier.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class ChangePasswordNotifier extends AppProvider {
  final AuthUpdatePasswordUseCase _updatePasswordUseCase;

  ChangePasswordNotifier(this._updatePasswordUseCase) {
    init();
  }

  // --- Controllers & State ---
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

  /// Proses Submit Ganti Password
  Future<void> submit(BuildContext context) async {
    final pass = passwordController.text;
    final confirm = confirmPasswordController.text;

    // 1. VALIDASI INPUT
    if (pass.length < 8) {
      _errorMessage = "Password minimal harus 8 karakter";
      notifyListeners();
      return;
    }

    if (!pass.contains(RegExp(r'[0-9]'))) {
      _errorMessage = "Password harus mengandung setidaknya satu angka";
      notifyListeners();
      return;
    }

    if (pass != confirm) {
      _errorMessage = "Konfirmasi password tidak cocok";
      notifyListeners();
      return;
    }

    _errorMessage = "";
    showLoading();

    try {
      // 2. HIT API LARAVEL
      final response = await _updatePasswordUseCase(param: pass);

      if (response.success) {
        // A. Update Status Lokal: Password sudah bukan default lagi
        await SharedPreferencesHelper.setBool(
            AppPreferences.IS_DEFAULT_PASSWORD, false);

        // B. SINKRONISASI DATA (Penting agar data Face Registration terbaru terambil)
        if (sl.isRegistered<HomeNotifier>()) {
          await sl<HomeNotifier>().refreshData();
        }

        if (sl.isRegistered<ProfileNotifier>()) {
          await sl<ProfileNotifier>().init();
        }

        hideLoading();

        // C. CEK STATUS WAJAH TERBARU SETELAH SYNC
        final isFaceReg = SharedPreferencesHelper.getBool(
                AppPreferences.IS_FACE_REGISTERED) ??
            false;

        // D. NAVIGASI BERDASARKAN KONDISI USER
        if (!context.mounted) return;

        if (!isFaceReg) {
          // User baru yang belum daftar wajah
          debugPrint("🚀 NAVIGASI: Ke Pendaftaran Wajah");
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/face-recognition',
            (route) => false,
            arguments: {'isRegistration': true},
          );
        } else {
          // User lama yang sudah punya data wajah
          debugPrint("🏠 NAVIGASI: Ke Dashboard Utama");
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
      _errorMessage = "Gagal memperbarui password. Cek koneksi Anda.";
      notifyListeners();
    }
  }

  /// Reset pesan error agar tidak memicu notifikasi berulang di UI
  void clearError() {
    _errorMessage = "";
    notifyListeners();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}

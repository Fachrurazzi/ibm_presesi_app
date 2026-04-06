import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/auth.dart';
import 'package:ibm_presensi_app/app/module/use_case/auth_login.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_notifier.dart'; // Tambahkan ini
import 'package:ibm_presensi_app/app/presentation/profile/profile_notifier.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart'; // Tambahkan ini
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class LoginNotifier extends AppProvider {
  final AuthLoginUseCase _authLoginUseCase;

  LoginNotifier(this._authLoginUseCase) {
    init();
  }

  bool _isLoged = false;
  bool get isLoged => _isLoged;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isShowPassword = false;
  bool get isShowPassword => _isShowPassword;

  set isShowPassword(bool param) {
    _isShowPassword = param;
    notifyListeners();
  }

  @override
  void init() {
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    final String? auth =
        await SharedPreferencesHelper.getString(AppPreferences.AUTH_TOKEN);
    if (auth?.isNotEmpty ?? false) {
      // Jika sudah login, pastikan Home data siap
      if (sl.isRegistered<HomeNotifier>()) {
        await sl<HomeNotifier>().init();
      }
      _isLoged = true;
      notifyListeners();
    }
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      snackbarMessage = "Email dan password wajib diisi";
      notifyListeners();
      return;
    }

    showLoading();

    // --- KUNCI 1: BERSIHKAN TOTAL SEBELUM LOGIN ---
    await SharedPreferencesHelper.logout();

    final param = AuthEntity(email: email, password: password);
    final response = await _authLoginUseCase(param: param);

    if (response.success) {
      // Tunggu sebentar agar SharedPreferences benar-benar selesai menulis data Auth
      await Future.delayed(const Duration(milliseconds: 300));

      // --- KUNCI 2: RESET SEMUA NOTIFIER ---
      if (sl.isRegistered<ProfileNotifier>()) {
        sl<ProfileNotifier>().resetState();
        await sl<ProfileNotifier>().init();
      }

      if (sl.isRegistered<HomeNotifier>()) {
        // Panggil init() yang akan membaca URL foto yang baru saja disimpan
        await sl<HomeNotifier>().init();
      }
      _isLoged = true;
    } else {
      errorMessage = response.message;
    }

    hideLoading();
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

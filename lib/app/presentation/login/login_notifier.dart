import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/auth.dart';
import 'package:ibm_presensi_app/app/module/use_case/auth_login.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
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

  // Dispose controllers to prevent memory leaks
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _checkAuth() async {
    showLoading();
    final String? auth =
        await SharedPreferencesHelper.getString(AppPreferences.AUTH_TOKEN);
    if (auth?.isNotEmpty ?? false) {
      _isLoged = true;
    }
    hideLoading();
  }

  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      snackbarMessage = "Email dan password tidak boleh kosong";
      return;
    }

    showLoading();
    final param = AuthEntity(
        email: emailController.text, password: passwordController.text);

    final response = await _authLoginUseCase(param: param);

    if (response.success) {
      _isLoged = true;
      // Simpan session di sini jika belum dilakukan di UseCase
    } else {
      snackbarMessage = response.message;
    }

    hideLoading();
  }
}

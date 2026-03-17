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

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

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

  _checkAuth() async {
    showLoading();

    final String? auth = await SharedPreferencesHelper.getString(PREF_AUTH);

    if (auth?.isNotEmpty ?? false) _isLoged = true;

    hideLoading();
  }

  login() async {
    showLoading();

    final param = AuthEntity(
        email: _emailController.text, password: _passwordController.text);

    final response = await _authLoginUseCase(param: param);

    if (response.success) {
    } else {
      snackbarMessage = response.message;
    }
    _checkAuth();
    hideLoading();
  }
}

import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/auth.dart';
import 'package:ibm_presensi_app/app/module/use_case/auth_forgot_password_use_case.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class ForgotPasswordNotifier extends AppProvider {
  final AuthForgotPasswordUseCase _forgotPasswordUseCase;

  ForgotPasswordNotifier(this._forgotPasswordUseCase) {
    init();
  }

  final emailController = TextEditingController();

  String _errorMessage = "";
  @override
  String get errorMessage => _errorMessage;

  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;

  @override
  Future<void> init() async {
    _errorMessage = "";
    _isSuccess = false;
    emailController.clear();
  }

  Future<void> submit() async {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      _errorMessage = "Email harus diisi";
      notifyListeners();
      return;
    }

    if (!email.contains('@') || !email.contains('.')) {
      _errorMessage = "Format email tidak valid";
      notifyListeners();
      return;
    }

    _errorMessage = "";
    _isSuccess = false;
    showLoading();

    try {
      final params = AuthForgotPasswordParam(email: email);
      final result = await _forgotPasswordUseCase(params);

      if (result is SuccessState<bool> && result.data == true) {
        _isSuccess = true;
      } else {
        _errorMessage = result.message;
      }
    } catch (e) {
      _errorMessage = "Gagal mengirim permintaan. Cek koneksi Anda.";
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  @override
  void clearError() {
    _errorMessage = "";
    notifyListeners();
  }

  void resetSuccess() {
    _isSuccess = false;
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/auth.dart';
import 'package:ibm_presensi_app/app/module/use_case/auth_login.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/profile/profile_notifier.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class LoginNotifier extends AppProvider {
  final AuthLoginUseCase _authLoginUseCase;

  LoginNotifier(this._authLoginUseCase) {
    init();
  }

  bool _isLogged = false;
  bool get isLogged => _isLogged;
  String _onboardingStep = "";
  String get onboardingStep => _onboardingStep;
  String loginError = "";
  bool _isShowPassword = false;
  bool get isShowPassword => _isShowPassword;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  set isShowPassword(bool value) {
    _isShowPassword = value;
    notifyListeners();
  }

  @override
  void init() {
    _checkAuthStatus();
  }

  void clearOnboardingStep() {
    _onboardingStep = "";
    notifyListeners();
  }

  Future<void> _checkAuthStatus() async {
    final token = SharedPreferencesHelper.getString(AppPreferences.AUTH_TOKEN);
    if (token != null && token.isNotEmpty) {
      await _syncRelatedNotifiers();
      _isLogged = true;
      notifyListeners();
    }
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (!_validateInput(email, password)) return;

    loginError = "";
    showLoading();

    try {
      await SharedPreferencesHelper.logout();

      final response = await _authLoginUseCase(
        param: AuthEntity(
            email: email, password: password, name: "", positionName: ""),
      );

      if (response.success && response.data != null) {
        final userResult = response.data as AuthEntity;

        // 1. Simpan Token
        await SharedPreferencesHelper.setString(
            AppPreferences.AUTH_TOKEN, userResult.accessToken ?? "");

        // 2. Simpan Sesi ke Disk (Async)
        await _saveUserSession(userResult);

        // 3. UPDATE RAM SECARA INSTAN (Sesuai Revisi)
        _updateAllStatesInstantly(userResult);

        // 4. Navigasi
        _determineNextStep(userResult);
      } else {
        loginError = response.message;
      }
    } catch (e) {
      loginError = "Gagal login. Periksa koneksi ke server IBM.";
      debugPrint("🚨 LOGIN_ERROR: $e");
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  bool _validateInput(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      loginError = "Email dan password wajib diisi";
      notifyListeners();
      return false;
    }
    return true;
  }

  Future<void> _saveUserSession(AuthEntity user) async {
    final joinDate = user.joinDate ?? "-";
    await SharedPreferencesHelper.setString(
        AppPreferences.USER_NAME, user.name ?? 'User IBM');
    await SharedPreferencesHelper.setString(
        AppPreferences.POSITION_NAME, user.displayPosition);
    await SharedPreferencesHelper.setString(
        AppPreferences.IMAGE_URL, user.imageUrl);
    await SharedPreferencesHelper.setString(AppPreferences.JOIN_DATE, joinDate);
    await SharedPreferencesHelper.setBool(
        AppPreferences.IS_DEFAULT_PASSWORD, user.isDefaultPassword);
    await SharedPreferencesHelper.setBool(
        AppPreferences.IS_FACE_REGISTERED, user.isFaceRegistered);
  }

  void _updateAllStatesInstantly(AuthEntity user) {
    // Update Home RAM
    if (sl.isRegistered<HomeNotifier>()) {
      sl<HomeNotifier>().updateUserData(
        newName: user.name,
        newPosition: user.displayPosition,
        newPhoto: user.imageUrl,
      );
      sl<HomeNotifier>().refreshData();
    }

    // UPDATE PROFILE RAM (MENGGUNAKAN METHOD BARU)
    if (sl.isRegistered<ProfileNotifier>()) {
      sl<ProfileNotifier>().updateFromAuth(
        name: user.name ?? "User IBM",
        photo: user.imageUrl,
        joinDate: user.joinDate ?? "-",
        position: user.displayPosition,
      );
    }
  }

  Future<void> _syncRelatedNotifiers() async {
    if (sl.isRegistered<ProfileNotifier>()) await sl<ProfileNotifier>().init();
    if (sl.isRegistered<HomeNotifier>()) await sl<HomeNotifier>().init();
  }

  void _determineNextStep(AuthEntity user) {
    if (user.isDefaultPassword) {
      _onboardingStep = '/change-password';
    } else if (!user.isFaceRegistered) {
      _onboardingStep = '/face-recognition';
    } else {
      _onboardingStep = '/main-navbar';
      _isLogged = true;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

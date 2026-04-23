import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/auth.dart';
import 'package:ibm_presensi_app/app/module/use_case/auth_login_use_case.dart';
import 'package:ibm_presensi_app/app/presentation/common/dashboard/dashboard_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/common/profile/profile_notifier.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:ibm_presensi_app/core/router/navbar_router.dart';

class LoginNotifier extends AppProvider {
  final AuthLoginUseCase _authLoginUseCase;

  LoginNotifier(this._authLoginUseCase) {
    init();
  }

  bool _isLogged = false;
  bool get isLogged => _isLogged;

  String _onboardingStep = "";
  String get onboardingStep => _onboardingStep;

  String _loginError = "";
  String get loginError => _loginError;

  bool _isShowPassword = false;
  bool get isShowPassword => _isShowPassword;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  set isShowPassword(bool value) {
    _isShowPassword = value;
    notifyListeners();
  }

  @override
  Future<void> init() async {
    await _checkAuthStatus();
  }

  void clearOnboardingStep() {
    _onboardingStep = "";
    notifyListeners();
  }

  Future<void> _checkAuthStatus() async {
    try {
      final token =
          SharedPreferencesHelper.getString(AppPreferences.AUTH_TOKEN);
      if (token != null && token.isNotEmpty) {
        await _syncRelatedNotifiers();
        _isLogged = true;
        notifyListeners();
      }
    } catch (e) {
      debugPrint("🚨 CHECK_AUTH_ERROR: $e");
      // Token invalid, force logout
      await SharedPreferencesHelper.logout();
    }
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (!_validateInput(email, password)) return;

    _loginError = "";
    showLoading();

    try {
      await SharedPreferencesHelper.logout();

      final param = AuthLoginParam(
        email: email,
        password: password,
        deviceName: 'FlutterApp',
      );

      final result = await _authLoginUseCase(param);

      // ✅ Gunakan type check
      if (result is SuccessState<AuthEntity> && result.data != null) {
        final user = result.data!;

        // Simpan Token
        await SharedPreferencesHelper.saveToken(
          user.accessToken ?? '',
          tokenType: user.tokenType,
        );

        // Simpan Sesi User
        final session = UserSession.fromUserEntity(user);
        await SharedPreferencesHelper.saveUserSession(session);

        // Update RAM
        _updateAllStatesInstantly(user);

        // Tentukan langkah selanjutnya
        _determineNextStep(user);
      } else {
        _loginError = result.message;
      }
    } catch (e) {
      _loginError = "Gagal login. Periksa koneksi ke server IBM.";
      debugPrint("🚨 LOGIN_ERROR: $e");
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  bool _validateInput(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      _loginError = "Email dan password wajib diisi";
      notifyListeners();
      return false;
    }
    if (!email.contains('@') || !email.contains('.')) {
      _loginError = "Format email tidak valid";
      notifyListeners();
      return false;
    }
    return true;
  }

  void _updateAllStatesInstantly(AuthEntity user) {
    // 1. Update Dashboard RAM
    if (sl.isRegistered<DashboardNotifier>()) {
      sl<DashboardNotifier>().updateUserInfo(
        name: user.name,
        position: user.displayPosition,
        avatar: user.imageUrl,
      );
    }

    // 2. Update Profile RAM
    if (sl.isRegistered<ProfileNotifier>()) {
      sl<ProfileNotifier>().updateFromAuth(
        name: user.name,
        photo: user.imageUrl,
        joinDate: user.joinDate ?? "-",
        position: user.displayPosition,
        leaveQuota: user.leaveQuota,
        remainingLeave: user.remainingLeave,
      );
    }
  }

  Future<void> _syncRelatedNotifiers() async {
    try {
      if (sl.isRegistered<ProfileNotifier>()) {
        await sl<ProfileNotifier>().init();
      }
      if (sl.isRegistered<DashboardNotifier>()) {
        await sl<DashboardNotifier>().init();
      }
    } catch (e) {
      debugPrint("🚨 SYNC_NOTIFIERS_ERROR: $e");
    }
  }

void _determineNextStep(AuthEntity user) {
  if (user.needsPasswordChange) {
    _onboardingStep = '/change-password';
  } else if (!user.hasFaceRegistered) {
    _onboardingStep = '/face-recognition';
  } else {
    // Save session first
    final session = UserSession.fromUserEntity(user);
    SharedPreferencesHelper.saveUserSession(session);
    
    // Use NavbarRouter
    _onboardingStep = NavbarRouter.getHomeRoute();
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

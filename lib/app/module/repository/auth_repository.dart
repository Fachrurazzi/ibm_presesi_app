import 'package:ibm_presensi_app/app/module/entity/auth.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

abstract class AuthRepository {
  /// Login user
  Future<DataState<AuthEntity>> login(AuthLoginParam param);

  /// Get current authenticated user (from /me endpoint)
  Future<DataState<AuthEntity>> getMe();

  /// Update password
  Future<DataState<bool>> updatePassword(AuthUpdatePasswordParam param);

  /// Forgot password - request reset link
  Future<DataState<bool>> forgotPassword(AuthForgotPasswordParam param);

  /// Reset password with token
  Future<DataState<bool>> resetPassword(AuthResetPasswordParam param);

  /// Register face for face recognition
  Future<DataState<bool>> registerFace(RegisterFaceParam param);

  /// Resend email verification
  Future<DataState<bool>> resendVerification();

  /// Logout from current device
  Future<DataState<bool>> logout();

  /// Logout from all devices
  Future<DataState<bool>> logoutAll();
}

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:ibm_presensi_app/app/data/model/auth_model.dart';
import 'package:ibm_presensi_app/app/data/source/auth_api_service.dart';
import 'package:ibm_presensi_app/app/module/entity/auth.dart';
import 'package:ibm_presensi_app/app/module/repository/auth_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService _apiService;

  AuthRepositoryImpl(this._apiService);

  @override
  Future<DataState<AuthEntity>> login(AuthLoginParam param) {
    final request = LoginRequest(
      email: param.email,
      password: param.password,
      deviceName: param.deviceName,
    );

    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.login(request.toJson());
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final response = LoginResponse.fromJson(json as Map<String, dynamic>);
        debugPrint('✅ Login success: ${response.user.email}');
        return AuthEntity(
          id: response.user.id,
          email: response.user.email,
          name: response.user.name,
          positionId: response.user.positionId,
          positionName: response.user.positionName,
          isDefaultPassword: response.user.isDefaultPassword,
          isFaceRegistered: response.user.isFaceRegistered,
          imageUrl: response.user.imageUrl ?? '',
          joinDate: response.user.joinDate,
          leaveQuota: response.user.leaveQuota,
          remainingLeave: response.user.remainingLeave,
          cashableLeave: response.user.cashableLeave,
          emailVerifiedAt: response.user.emailVerifiedAt,
          accessToken: response.accessToken,
          tokenType: response.tokenType,
        );
      },
    );
  }

  @override
  Future<DataState<AuthEntity>> getMe() {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getMe();
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'] as Map<String, dynamic>?;
        final user = UserModel.fromJson(data ?? json as Map<String, dynamic>);
        debugPrint('✅ GetMe success: ${user.email}');
        return AuthEntity(
          id: user.id,
          email: user.email,
          name: user.name,
          positionId: user.positionId,
          positionName: user.positionName,
          isDefaultPassword: user.isDefaultPassword,
          isFaceRegistered: user.isFaceRegistered,
          imageUrl: user.imageUrl ?? '',
          joinDate: user.joinDate,
          leaveQuota: user.leaveQuota,
          remainingLeave: user.remainingLeave,
          cashableLeave: user.cashableLeave,
          emailVerifiedAt: user.emailVerifiedAt,
        );
      },
    );
  }

  @override
  Future<DataState<bool>> updatePassword(AuthUpdatePasswordParam param) {
    final request = UpdatePasswordRequest(
      currentPassword: param.currentPassword,
      password: param.newPassword,
      passwordConfirmation: param.newPassword,
    );

    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.updatePassword(request.toJson());
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (_) {
        debugPrint('✅ Password updated successfully');
        return true;
      },
    );
  }

  @override
  Future<DataState<bool>> forgotPassword(AuthForgotPasswordParam param) {
    final request = ForgotPasswordRequest(email: param.email);

    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.forgotPassword(request.toJson());
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (_) {
        debugPrint('✅ Forgot password request sent to: ${param.email}');
        return true;
      },
    );
  }

  @override
  Future<DataState<bool>> resetPassword(AuthResetPasswordParam param) {
    final request = ResetPasswordRequest(
      email: param.email,
      token: param.token,
      password: param.newPassword,
      passwordConfirmation: param.newPassword,
    );

    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.resetPassword(request.toJson());
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (_) {
        debugPrint('✅ Password reset successfully for: ${param.email}');
        return true;
      },
    );
  }

  @override
  Future<DataState<bool>> registerFace(RegisterFaceParam param) {
    return handleResponse(
      apiCall: () async {
        final file = File(param.imagePath);
        // 🆕 Cek apakah file exists
        if (!await file.exists()) {
          throw Exception('File gambar tidak ditemukan: ${param.imagePath}');
        }
        // 🆕 Cek ukuran file (max 5MB)
        final fileSize = await file.length();
        if (fileSize > 5 * 1024 * 1024) {
          throw Exception('Ukuran file terlalu besar (maksimal 5MB)');
        }
        final jsonString = await _apiService.registerFace(
          faceModel: param.faceModel,
          image: file,
        );
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (_) {
        debugPrint('✅ Face registered successfully');
        return true;
      },
    );
  }

  @override
  Future<DataState<bool>> resendVerification() {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.resendVerification();
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (_) {
        debugPrint('✅ Verification email resent');
        return true;
      },
    );
  }

  @override
  Future<DataState<bool>> logout() {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.logout();
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (_) {
        debugPrint('✅ Logout success');
        return true;
      },
    );
  }

  @override
  Future<DataState<bool>> logoutAll() {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.logoutAll();
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (_) {
        debugPrint('✅ Logout from all devices success');
        return true;
      },
    );
  }
}

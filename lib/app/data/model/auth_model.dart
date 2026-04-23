import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

// ========== LOGIN REQUEST ==========
@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String email,
    required String password,
    @Default('FlutterApp') @JsonKey(name: 'device_name') String deviceName,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

// ========== LOGIN RESPONSE ==========
@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'token_type') @Default('Bearer') String tokenType,
    required UserModel user,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

// ========== USER MODEL ==========
@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String name,
    required String email,
    @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
    @JsonKey(name: 'position_id') int? positionId,
    @JsonKey(name: 'position_name') String? positionName,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'join_date') String? joinDate,
    @JsonKey(name: 'leave_quota') @Default(12) int leaveQuota,
    @JsonKey(name: 'remaining_leave') @Default(12) int remainingLeave,
    @JsonKey(name: 'cashable_leave') @Default(0) int cashableLeave,
    @JsonKey(name: 'is_default_password') @Default(false) bool isDefaultPassword,
    @JsonKey(name: 'is_face_registered') @Default(false) bool isFaceRegistered,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

// ========== UPDATE PASSWORD REQUEST ==========
@freezed
class UpdatePasswordRequest with _$UpdatePasswordRequest {
  const factory UpdatePasswordRequest({
    @JsonKey(name: 'current_password') required String currentPassword,
    required String password,
    @JsonKey(name: 'password_confirmation') required String passwordConfirmation,
  }) = _UpdatePasswordRequest;

  factory UpdatePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordRequestFromJson(json);
}

// ========== FORGOT PASSWORD REQUEST ==========
@freezed
class ForgotPasswordRequest with _$ForgotPasswordRequest {
  const factory ForgotPasswordRequest({
    required String email,
  }) = _ForgotPasswordRequest;

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordRequestFromJson(json);
}

// ========== RESET PASSWORD REQUEST ==========
@freezed
class ResetPasswordRequest with _$ResetPasswordRequest {
  const factory ResetPasswordRequest({
    required String email,
    required String token,
    required String password,
    @JsonKey(name: 'password_confirmation') required String passwordConfirmation,
  }) = _ResetPasswordRequest;

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestFromJson(json);
}
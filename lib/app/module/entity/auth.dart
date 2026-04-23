import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

// ========== AUTH ENTITY ==========
@freezed
class Auth with _$Auth {
  const Auth._();

  const factory Auth.entity({
    required int id,
    required String email,
    required String name,
    @JsonKey(name: 'position_id') int? positionId,
    @JsonKey(name: 'position_name') String? positionName,
    @JsonKey(name: 'is_default_password')
    @Default(false)
    bool isDefaultPassword,
    @JsonKey(name: 'is_face_registered') @Default(false) bool isFaceRegistered,
    @JsonKey(name: 'image_url') @Default('') String imageUrl,
    @JsonKey(name: 'join_date') String? joinDate,
    @JsonKey(name: 'leave_quota') @Default(12) int leaveQuota,
    @JsonKey(name: 'remaining_leave') @Default(12) int remainingLeave,
    @JsonKey(name: 'cashable_leave') @Default(0) int cashableLeave,
    @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'token_type') @Default('Bearer') String tokenType,
    @JsonKey(name: 'roles') @Default([]) List<String> roles,
    @JsonKey(name: 'permissions') @Default([]) List<String> permissions,
  }) = AuthEntity;

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  /// Helper untuk mapping data dari API Laravel PT IBM
  static Auth fromLaravelJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>? ?? json;

    final userData = data['user'] is Map<String, dynamic>
        ? data['user'] as Map<String, dynamic>
        : data;

    final combinedJson = {
      ...userData,
      if (data.containsKey('access_token'))
        'access_token': data['access_token'],
      if (data.containsKey('token_type')) 'token_type': data['token_type'],
    };

    return Auth.fromJson(combinedJson);
  }
}

// ========== PARAMETER CLASSES ==========

/// Parameter untuk login
class AuthLoginParam {
  final String email;
  final String password;
  final String deviceName;

  const AuthLoginParam({
    required this.email,
    required this.password,
    this.deviceName = 'FlutterApp',
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'device_name': deviceName,
    };
  }
}

/// Parameter untuk update password
class AuthUpdatePasswordParam {
  final String currentPassword;
  final String newPassword;

  const AuthUpdatePasswordParam({
    required this.currentPassword,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'current_password': currentPassword,
      'password': newPassword,
      'password_confirmation': newPassword,
    };
  }
}

/// Parameter untuk forgot password
class AuthForgotPasswordParam {
  final String email;

  const AuthForgotPasswordParam({required this.email});

  Map<String, dynamic> toJson() => {'email': email};
}

/// Parameter untuk reset password
class AuthResetPasswordParam {
  final String email;
  final String token;
  final String newPassword;

  const AuthResetPasswordParam({
    required this.email,
    required this.token,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'token': token,
      'password': newPassword,
      'password_confirmation': newPassword,
    };
  }
}

/// Parameter untuk registrasi wajah
class RegisterFaceParam {
  final String faceModel;
  final String imagePath;

  const RegisterFaceParam({
    required this.faceModel,
    required this.imagePath,
  });
}

// ========== EXTENSIONS ==========
extension AuthEntityX on AuthEntity {
  bool get hasValidToken => accessToken != null && accessToken!.isNotEmpty;
  bool get hasImage => imageUrl.isNotEmpty;
  String get displayName => name;
  String get displayPosition => positionName ?? 'Staff';
  String get displayJoinDate => joinDate ?? '-';
  bool get needsPasswordChange => isDefaultPassword;
  bool get hasFaceRegistered => isFaceRegistered;
  bool get isEmailVerified => emailVerifiedAt != null;

  /// Role checkers
  bool get isAdmin => roles.any(
        (r) => r.toLowerCase() == 'admin' || r.toLowerCase() == 'super_admin',
      );
  bool get isManager => roles.any((r) => r.toLowerCase() == 'manager');
  bool get isUser => !isAdmin && !isManager;

  /// Permission checkers
  bool can(String permission) => permissions.contains(permission);
  bool get canApproveLeave => can('approve_leave') || isAdmin || isManager;
  bool get canApprovePermission =>
      can('approve_permission') || isAdmin || isManager;
  bool get canManageUsers => can('manage_users') || isAdmin;
  bool get canManageMasterData => can('manage_master_data') || isAdmin;

  /// Get authorization header value
  String get authHeader => '$tokenType $accessToken';

  /// Get role display
  String get roleDisplay {
    if (isAdmin) return 'Administrator';
    if (isManager) return 'Manager';
    return 'Karyawan';
  }

  /// Get leave usage percentage
  double get leaveUsagePercentage {
    if (leaveQuota == 0) return 0;
    final used = leaveQuota - remainingLeave;
    return (used / leaveQuota) * 100;
  }
}

extension AuthLoginParamX on AuthLoginParam {
  bool get isValid => email.isNotEmpty && password.isNotEmpty;
  bool get isEmailValid => email.contains('@') && email.contains('.');
}

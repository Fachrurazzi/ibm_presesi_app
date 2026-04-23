// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginRequestImpl _$$LoginRequestImplFromJson(Map<String, dynamic> json) =>
    _$LoginRequestImpl(
      email: json['email'] as String,
      password: json['password'] as String,
      deviceName: json['device_name'] as String? ?? 'FlutterApp',
    );

Map<String, dynamic> _$$LoginRequestImplToJson(_$LoginRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'device_name': instance.deviceName,
    };

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String? ?? 'Bearer',
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'user': instance.user,
    };

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      emailVerifiedAt: json['email_verified_at'] as String?,
      positionId: (json['position_id'] as num?)?.toInt(),
      positionName: json['position_name'] as String?,
      imageUrl: json['image_url'] as String?,
      joinDate: json['join_date'] as String?,
      leaveQuota: (json['leave_quota'] as num?)?.toInt() ?? 12,
      remainingLeave: (json['remaining_leave'] as num?)?.toInt() ?? 12,
      cashableLeave: (json['cashable_leave'] as num?)?.toInt() ?? 0,
      isDefaultPassword: json['is_default_password'] as bool? ?? false,
      isFaceRegistered: json['is_face_registered'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'position_id': instance.positionId,
      'position_name': instance.positionName,
      'image_url': instance.imageUrl,
      'join_date': instance.joinDate,
      'leave_quota': instance.leaveQuota,
      'remaining_leave': instance.remainingLeave,
      'cashable_leave': instance.cashableLeave,
      'is_default_password': instance.isDefaultPassword,
      'is_face_registered': instance.isFaceRegistered,
    };

_$UpdatePasswordRequestImpl _$$UpdatePasswordRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdatePasswordRequestImpl(
      currentPassword: json['current_password'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
    );

Map<String, dynamic> _$$UpdatePasswordRequestImplToJson(
        _$UpdatePasswordRequestImpl instance) =>
    <String, dynamic>{
      'current_password': instance.currentPassword,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
    };

_$ForgotPasswordRequestImpl _$$ForgotPasswordRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ForgotPasswordRequestImpl(
      email: json['email'] as String,
    );

Map<String, dynamic> _$$ForgotPasswordRequestImplToJson(
        _$ForgotPasswordRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

_$ResetPasswordRequestImpl _$$ResetPasswordRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ResetPasswordRequestImpl(
      email: json['email'] as String,
      token: json['token'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
    );

Map<String, dynamic> _$$ResetPasswordRequestImplToJson(
        _$ResetPasswordRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'token': instance.token,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
    };

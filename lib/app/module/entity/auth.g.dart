// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthEntityImpl _$$AuthEntityImplFromJson(Map<String, dynamic> json) =>
    _$AuthEntityImpl(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      name: json['name'] as String,
      positionId: (json['position_id'] as num?)?.toInt(),
      positionName: json['position_name'] as String?,
      isDefaultPassword: json['is_default_password'] as bool? ?? false,
      isFaceRegistered: json['is_face_registered'] as bool? ?? false,
      imageUrl: json['image_url'] as String? ?? '',
      joinDate: json['join_date'] as String?,
      leaveQuota: (json['leave_quota'] as num?)?.toInt() ?? 12,
      remainingLeave: (json['remaining_leave'] as num?)?.toInt() ?? 12,
      cashableLeave: (json['cashable_leave'] as num?)?.toInt() ?? 0,
      emailVerifiedAt: json['email_verified_at'] as String?,
      accessToken: json['access_token'] as String?,
      tokenType: json['token_type'] as String? ?? 'Bearer',
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      permissions: (json['permissions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AuthEntityImplToJson(_$AuthEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'position_id': instance.positionId,
      'position_name': instance.positionName,
      'is_default_password': instance.isDefaultPassword,
      'is_face_registered': instance.isFaceRegistered,
      'image_url': instance.imageUrl,
      'join_date': instance.joinDate,
      'leave_quota': instance.leaveQuota,
      'remaining_leave': instance.remainingLeave,
      'cashable_leave': instance.cashableLeave,
      'email_verified_at': instance.emailVerifiedAt,
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'roles': instance.roles,
      'permissions': instance.permissions,
    };

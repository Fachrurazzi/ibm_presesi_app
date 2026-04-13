// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthModelImpl _$$AuthModelImplFromJson(Map<String, dynamic> json) =>
    _$AuthModelImpl(
      accessToken: json['access_token'] as String?,
      tokenType: json['token_type'] as String? ?? 'Bearer',
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AuthModelImplToJson(_$AuthModelImpl instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'user': instance.user,
    };

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      image: json['image'] as String?,
      imageUrl: json['image_url'] as String?,
      position: json['position'] == null
          ? null
          : PositionModel.fromJson(json['position'] as Map<String, dynamic>),
      positionName: json['position_name'] as String?,
      joinDate: json['join_date'] as String?,
      leaveQuota: (json['leave_quota'] as num?)?.toInt(),
      cashableLeave: (json['cashable_leave'] as num?)?.toInt(),
      isDefaultPassword: json['is_default_password'] as bool? ?? false,
      isFaceRegistered: json['is_face_registered'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'image': instance.image,
      'image_url': instance.imageUrl,
      'position': instance.position,
      'position_name': instance.positionName,
      'join_date': instance.joinDate,
      'leave_quota': instance.leaveQuota,
      'cashable_leave': instance.cashableLeave,
      'is_default_password': instance.isDefaultPassword,
      'is_face_registered': instance.isFaceRegistered,
    };

_$PositionModelImpl _$$PositionModelImplFromJson(Map<String, dynamic> json) =>
    _$PositionModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String? ?? 'Karyawan IBM',
    );

Map<String, dynamic> _$$PositionModelImplToJson(_$PositionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

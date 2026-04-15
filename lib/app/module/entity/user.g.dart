// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      image: json['image'] as String?,
      leaveQuota: (json['leave_quota'] as num?)?.toInt(),
      joinDate: json['join_date'] as String?,
      isFaceRegistered: json['is_face_registered'] as bool?,
      positionId: (json['position_id'] as num?)?.toInt(),
      position: json['position'] == null
          ? null
          : PositionEntity.fromJson(json['position'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'image': instance.image,
      'leave_quota': instance.leaveQuota,
      'join_date': instance.joinDate,
      'is_face_registered': instance.isFaceRegistered,
      'position_id': instance.positionId,
      'position': instance.position,
    };

_$PositionEntityImpl _$$PositionEntityImplFromJson(Map<String, dynamic> json) =>
    _$PositionEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$PositionEntityImplToJson(
        _$PositionEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

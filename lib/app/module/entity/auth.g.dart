// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthEntityImpl _$$AuthEntityImplFromJson(Map<String, dynamic> json) =>
    _$AuthEntityImpl(
      id: json['id'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
      position: json['position'] as Map<String, dynamic>?,
      positionName: json['position_name'] as String?,
      isDefaultPassword: json['is_default_password'] as bool? ?? false,
      isFaceRegistered: json['is_face_registered'] as bool? ?? false,
      imageUrl: json['image_url'] as String? ?? '',
      joinDate: json['join_date'] as String?,
      accessToken: json['access_token'] as String?,
    );

Map<String, dynamic> _$$AuthEntityImplToJson(_$AuthEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'position': instance.position,
      'position_name': instance.positionName,
      'is_default_password': instance.isDefaultPassword,
      'is_face_registered': instance.isFaceRegistered,
      'image_url': instance.imageUrl,
      'join_date': instance.joinDate,
      'access_token': instance.accessToken,
    };

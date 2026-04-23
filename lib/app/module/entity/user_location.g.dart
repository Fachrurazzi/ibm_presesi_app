// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserLocationImpl _$$UserLocationImplFromJson(Map<String, dynamic> json) =>
    _$UserLocationImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      positionName: json['position_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      lastLatitude: (json['last_latitude'] as num?)?.toDouble(),
      lastLongitude: (json['last_longitude'] as num?)?.toDouble(),
      lastLocationAt: json['last_location_at'] == null
          ? null
          : DateTime.parse(json['last_location_at'] as String),
      isOnline: json['is_online'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserLocationImplToJson(_$UserLocationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'position_name': instance.positionName,
      'avatar_url': instance.avatarUrl,
      'last_latitude': instance.lastLatitude,
      'last_longitude': instance.lastLongitude,
      'last_location_at': instance.lastLocationAt?.toIso8601String(),
      'is_online': instance.isOnline,
    };

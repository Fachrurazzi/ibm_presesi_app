// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PositionEntityImpl _$$PositionEntityImplFromJson(Map<String, dynamic> json) =>
    _$PositionEntityImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      userCount: (json['user_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PositionEntityImplToJson(
        _$PositionEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'user_count': instance.userCount,
    };

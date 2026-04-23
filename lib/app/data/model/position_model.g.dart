// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PositionRequestImpl _$$PositionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PositionRequestImpl(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$PositionRequestImplToJson(
        _$PositionRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$PositionListResponseImpl _$$PositionListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PositionListResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => PositionEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PositionListResponseImplToJson(
        _$PositionListResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShiftRequestImpl _$$ShiftRequestImplFromJson(Map<String, dynamic> json) =>
    _$ShiftRequestImpl(
      name: json['name'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$ShiftRequestImplToJson(_$ShiftRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'description': instance.description,
    };

_$ShiftListResponseImpl _$$ShiftListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ShiftListResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => ShiftEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ShiftListResponseImplToJson(
        _$ShiftListResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$ShiftResponseImpl _$$ShiftResponseImplFromJson(Map<String, dynamic> json) =>
    _$ShiftResponseImpl(
      data: ShiftEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ShiftResponseImplToJson(_$ShiftResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShiftEntityImpl _$$ShiftEntityImplFromJson(Map<String, dynamic> json) =>
    _$ShiftEntityImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      startTimeDisplay: json['start_time_display'] as String?,
      endTimeDisplay: json['end_time_display'] as String?,
      durationHours: (json['duration_hours'] as num?)?.toDouble() ?? 0.0,
      isOvernight: json['is_overnight'] as bool? ?? false,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$ShiftEntityImplToJson(_$ShiftEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'start_time_display': instance.startTimeDisplay,
      'end_time_display': instance.endTimeDisplay,
      'duration_hours': instance.durationHours,
      'is_overnight': instance.isOvernight,
      'description': instance.description,
    };

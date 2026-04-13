// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceEntityImpl _$$AttendanceEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      date: json['date'] as String?,
      isLate: json['is_late'] as bool? ?? false,
      lunchMoney: (json['lunch_money'] as num?)?.toInt() ?? 0,
      lunchMoneyLabel: json['lunch_money_label'] as String? ?? 'Rp 0',
      scheduleStart: json['schedule_start'] as String?,
      scheduleEnd: json['schedule_end'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AttendanceEntityImplToJson(
        _$AttendanceEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'date': instance.date,
      'is_late': instance.isLate,
      'lunch_money': instance.lunchMoney,
      'lunch_money_label': instance.lunchMoneyLabel,
      'schedule_start': instance.scheduleStart,
      'schedule_end': instance.scheduleEnd,
      'runtimeType': instance.$type,
    };

_$AttendanceParamEntityImpl _$$AttendanceParamEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceParamEntityImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      address: json['address'] as String? ?? '',
      image: json['image'] as String? ?? '',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AttendanceParamEntityImplToJson(
        _$AttendanceParamEntityImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
      'image': instance.image,
      'runtimeType': instance.$type,
    };

_$AttendanceParamGetEntityImpl _$$AttendanceParamGetEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceParamGetEntityImpl(
      month: (json['month'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AttendanceParamGetEntityImplToJson(
        _$AttendanceParamGetEntityImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'year': instance.year,
      'runtimeType': instance.$type,
    };

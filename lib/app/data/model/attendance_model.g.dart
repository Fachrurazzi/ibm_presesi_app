// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceRequestImpl _$$AttendanceRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceRequestImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$AttendanceRequestImplToJson(
        _$AttendanceRequestImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_$AttendanceResponseImpl _$$AttendanceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceResponseImpl(
      data: AttendanceEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AttendanceResponseImplToJson(
        _$AttendanceResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$AttendanceScheduleResponseImpl _$$AttendanceScheduleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceScheduleResponseImpl(
      data: AttendanceSchedule.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AttendanceScheduleResponseImplToJson(
        _$AttendanceScheduleResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$AttendanceSummaryResponseImpl _$$AttendanceSummaryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceSummaryResponseImpl(
      data: AttendanceSummary.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AttendanceSummaryResponseImplToJson(
        _$AttendanceSummaryResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$PaginatedAttendanceResponseImpl _$$PaginatedAttendanceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedAttendanceResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => AttendanceEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaginatedAttendanceResponseImplToJson(
        _$PaginatedAttendanceResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

_$ReportSuspiciousRequestImpl _$$ReportSuspiciousRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ReportSuspiciousRequestImpl(
      reason: json['reason'] as String? ?? 'Terdeteksi fake GPS/emulator',
    );

Map<String, dynamic> _$$ReportSuspiciousRequestImplToJson(
        _$ReportSuspiciousRequestImpl instance) =>
    <String, dynamic>{
      'reason': instance.reason,
    };

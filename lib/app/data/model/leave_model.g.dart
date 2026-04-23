// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaveRequestImpl _$$LeaveRequestImplFromJson(Map<String, dynamic> json) =>
    _$LeaveRequestImpl(
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      reason: json['reason'] as String,
      category: json['category'] as String? ?? 'annual',
    );

Map<String, dynamic> _$$LeaveRequestImplToJson(_$LeaveRequestImpl instance) =>
    <String, dynamic>{
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'reason': instance.reason,
      'category': instance.category,
    };

_$LeaveResponseImpl _$$LeaveResponseImplFromJson(Map<String, dynamic> json) =>
    _$LeaveResponseImpl(
      data: LeaveEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LeaveResponseImplToJson(_$LeaveResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$PaginatedLeaveResponseImpl _$$PaginatedLeaveResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedLeaveResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => LeaveEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: LeavePaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaginatedLeaveResponseImplToJson(
        _$PaginatedLeaveResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

_$LeaveTypesResponseImpl _$$LeaveTypesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$LeaveTypesResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => LeaveType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LeaveTypesResponseImplToJson(
        _$LeaveTypesResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$LeaveQuotaResponseImpl _$$LeaveQuotaResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$LeaveQuotaResponseImpl(
      data: LeaveQuota.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LeaveQuotaResponseImplToJson(
        _$LeaveQuotaResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$LeaveUpdateStatusRequestImpl _$$LeaveUpdateStatusRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$LeaveUpdateStatusRequestImpl(
      status: json['status'] as String,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$LeaveUpdateStatusRequestImplToJson(
        _$LeaveUpdateStatusRequestImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'note': instance.note,
    };

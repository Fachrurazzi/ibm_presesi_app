// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaveEntityImpl _$$LeaveEntityImplFromJson(Map<String, dynamic> json) =>
    _$LeaveEntityImpl(
      id: (json['id'] as num).toInt(),
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      duration: (json['duration'] as num?)?.toInt() ?? 1,
      reason: json['reason'] as String,
      category: json['category'] as String? ?? 'annual',
      categoryLabel: json['category_label'] as String?,
      status: json['status'] as String? ?? 'PENDING',
      statusLabel: json['status_label'] as String?,
      note: json['note'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$LeaveEntityImplToJson(_$LeaveEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'duration': instance.duration,
      'reason': instance.reason,
      'category': instance.category,
      'category_label': instance.categoryLabel,
      'status': instance.status,
      'status_label': instance.statusLabel,
      'note': instance.note,
      'created_at': instance.createdAt,
    };

_$LeaveTypeImpl _$$LeaveTypeImplFromJson(Map<String, dynamic> json) =>
    _$LeaveTypeImpl(
      value: json['value'] as String,
      label: json['label'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$LeaveTypeImplToJson(_$LeaveTypeImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
      'description': instance.description,
    };

_$LeaveQuotaImpl _$$LeaveQuotaImplFromJson(Map<String, dynamic> json) =>
    _$LeaveQuotaImpl(
      totalQuota: (json['total_quota'] as num?)?.toInt() ?? 12,
      usedThisYear: (json['used_this_year'] as num?)?.toInt() ?? 0,
      remainingQuota: (json['remaining_quota'] as num?)?.toInt() ?? 12,
      cashableLeave: (json['cashable_leave'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$LeaveQuotaImplToJson(_$LeaveQuotaImpl instance) =>
    <String, dynamic>{
      'total_quota': instance.totalQuota,
      'used_this_year': instance.usedThisYear,
      'remaining_quota': instance.remainingQuota,
      'cashable_leave': instance.cashableLeave,
    };

_$PaginatedLeaveImpl _$$PaginatedLeaveImplFromJson(Map<String, dynamic> json) =>
    _$PaginatedLeaveImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => LeaveEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: LeavePaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaginatedLeaveImplToJson(
        _$PaginatedLeaveImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

_$LeavePaginationMetaImpl _$$LeavePaginationMetaImplFromJson(
        Map<String, dynamic> json) =>
    _$LeavePaginationMetaImpl(
      currentPage: (json['current_page'] as num?)?.toInt() ?? 1,
      perPage: (json['per_page'] as num?)?.toInt() ?? 10,
      total: (json['total'] as num?)?.toInt() ?? 0,
      lastPage: (json['last_page'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$LeavePaginationMetaImplToJson(
        _$LeavePaginationMetaImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'per_page': instance.perPage,
      'total': instance.total,
      'last_page': instance.lastPage,
    };

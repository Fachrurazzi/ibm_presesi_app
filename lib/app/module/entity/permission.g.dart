// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermissionEntityImpl _$$PermissionEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$PermissionEntityImpl(
      id: (json['id'] as num).toInt(),
      type: json['type'] as String,
      typeLabel: json['type_label'] as String?,
      date: json['date'] as String,
      reason: json['reason'] as String,
      imageProofUrl: json['image_proof_url'] as String?,
      status: json['status'] as String? ?? 'PENDING',
      statusLabel: json['status_label'] as String?,
      note: json['note'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$PermissionEntityImplToJson(
        _$PermissionEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'type_label': instance.typeLabel,
      'date': instance.date,
      'reason': instance.reason,
      'image_proof_url': instance.imageProofUrl,
      'status': instance.status,
      'status_label': instance.statusLabel,
      'note': instance.note,
      'created_at': instance.createdAt,
    };

_$PermissionTypeImpl _$$PermissionTypeImplFromJson(Map<String, dynamic> json) =>
    _$PermissionTypeImpl(
      value: json['value'] as String,
      label: json['label'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$PermissionTypeImplToJson(
        _$PermissionTypeImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
      'description': instance.description,
    };

_$PermissionCheckResultImpl _$$PermissionCheckResultImplFromJson(
        Map<String, dynamic> json) =>
    _$PermissionCheckResultImpl(
      date: json['date'] as String,
      hasPermission: json['has_permission'] as bool? ?? false,
      permission: json['permission'] == null
          ? null
          : PermissionEntity.fromJson(
              json['permission'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PermissionCheckResultImplToJson(
        _$PermissionCheckResultImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'has_permission': instance.hasPermission,
      'permission': instance.permission,
    };

_$PaginatedPermissionImpl _$$PaginatedPermissionImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedPermissionImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => PermissionEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: PermissionPaginationMeta.fromJson(
          json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaginatedPermissionImplToJson(
        _$PaginatedPermissionImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

_$PermissionPaginationMetaImpl _$$PermissionPaginationMetaImplFromJson(
        Map<String, dynamic> json) =>
    _$PermissionPaginationMetaImpl(
      currentPage: (json['current_page'] as num?)?.toInt() ?? 1,
      perPage: (json['per_page'] as num?)?.toInt() ?? 10,
      total: (json['total'] as num?)?.toInt() ?? 0,
      lastPage: (json['last_page'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$PermissionPaginationMetaImplToJson(
        _$PermissionPaginationMetaImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'per_page': instance.perPage,
      'total': instance.total,
      'last_page': instance.lastPage,
    };

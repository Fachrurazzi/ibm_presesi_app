// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermissionRequestImpl _$$PermissionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PermissionRequestImpl(
      type: json['type'] as String,
      date: json['date'] as String,
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$$PermissionRequestImplToJson(
        _$PermissionRequestImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'date': instance.date,
      'reason': instance.reason,
    };

_$PermissionResponseImpl _$$PermissionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PermissionResponseImpl(
      data: PermissionEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PermissionResponseImplToJson(
        _$PermissionResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$PaginatedPermissionResponseImpl _$$PaginatedPermissionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedPermissionResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => PermissionEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: PermissionPaginationMeta.fromJson(
          json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaginatedPermissionResponseImplToJson(
        _$PaginatedPermissionResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

_$PermissionTypesResponseImpl _$$PermissionTypesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PermissionTypesResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => PermissionType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PermissionTypesResponseImplToJson(
        _$PermissionTypesResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$PermissionCheckResponseImpl _$$PermissionCheckResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PermissionCheckResponseImpl(
      data:
          PermissionCheckResult.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PermissionCheckResponseImplToJson(
        _$PermissionCheckResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$PermissionUpdateStatusRequestImpl
    _$$PermissionUpdateStatusRequestImplFromJson(Map<String, dynamic> json) =>
        _$PermissionUpdateStatusRequestImpl(
          status: json['status'] as String,
          note: json['note'] as String?,
        );

Map<String, dynamic> _$$PermissionUpdateStatusRequestImplToJson(
        _$PermissionUpdateStatusRequestImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'note': instance.note,
    };

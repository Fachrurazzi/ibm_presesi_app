import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibm_presensi_app/app/module/entity/permission.dart';

part 'permission_model.freezed.dart';
part 'permission_model.g.dart';

// ========== PERMISSION REQUEST ==========
@freezed
class PermissionRequest with _$PermissionRequest {
  const factory PermissionRequest({
    required String type,
    required String date,
    required String reason,
  }) = _PermissionRequest;

  factory PermissionRequest.fromJson(Map<String, dynamic> json) =>
      _$PermissionRequestFromJson(json);
}

// ========== PERMISSION RESPONSE ==========
@freezed
class PermissionResponse with _$PermissionResponse {
  const factory PermissionResponse({
    required PermissionEntity data,
  }) = _PermissionResponse;

  factory PermissionResponse.fromJson(Map<String, dynamic> json) =>
      _$PermissionResponseFromJson(json);
}

// ========== PAGINATED PERMISSION RESPONSE ==========
@freezed
class PaginatedPermissionResponse with _$PaginatedPermissionResponse {
  const factory PaginatedPermissionResponse({
    required List<PermissionEntity> data,
    required PermissionPaginationMeta meta,
  }) = _PaginatedPermissionResponse;

  factory PaginatedPermissionResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginatedPermissionResponseFromJson(json);
}

// ========== PERMISSION TYPES RESPONSE ==========
@freezed
class PermissionTypesResponse with _$PermissionTypesResponse {
  const factory PermissionTypesResponse({
    required List<PermissionType> data,
  }) = _PermissionTypesResponse;

  factory PermissionTypesResponse.fromJson(Map<String, dynamic> json) =>
      _$PermissionTypesResponseFromJson(json);
}

// ========== PERMISSION CHECK RESPONSE ==========
@freezed
class PermissionCheckResponse with _$PermissionCheckResponse {
  const factory PermissionCheckResponse({
    required PermissionCheckResult data,
  }) = _PermissionCheckResponse;

  factory PermissionCheckResponse.fromJson(Map<String, dynamic> json) =>
      _$PermissionCheckResponseFromJson(json);
}

// ========== UPDATE STATUS REQUEST ==========
@freezed
class PermissionUpdateStatusRequest with _$PermissionUpdateStatusRequest {
  const factory PermissionUpdateStatusRequest({
    required String status,
    String? note,
  }) = _PermissionUpdateStatusRequest;

  factory PermissionUpdateStatusRequest.fromJson(Map<String, dynamic> json) =>
      _$PermissionUpdateStatusRequestFromJson(json);
}

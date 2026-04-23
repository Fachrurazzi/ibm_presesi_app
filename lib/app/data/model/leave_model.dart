import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibm_presensi_app/app/module/entity/leave.dart';

part 'leave_model.freezed.dart';
part 'leave_model.g.dart';

// ========== LEAVE REQUEST ==========
@freezed
class LeaveRequest with _$LeaveRequest {
  const factory LeaveRequest({
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
    required String reason,
    @Default('annual') String category,
  }) = _LeaveRequest;

  factory LeaveRequest.fromJson(Map<String, dynamic> json) =>
      _$LeaveRequestFromJson(json);
}

// ========== LEAVE RESPONSE ==========
@freezed
class LeaveResponse with _$LeaveResponse {
  const factory LeaveResponse({
    required LeaveEntity data,
  }) = _LeaveResponse;

  factory LeaveResponse.fromJson(Map<String, dynamic> json) =>
      _$LeaveResponseFromJson(json);
}

// ========== PAGINATED LEAVE RESPONSE ==========
@freezed
class PaginatedLeaveResponse with _$PaginatedLeaveResponse {
  const factory PaginatedLeaveResponse({
    required List<LeaveEntity> data,
    required LeavePaginationMeta meta,
  }) = _PaginatedLeaveResponse;

  factory PaginatedLeaveResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginatedLeaveResponseFromJson(json);
}

// ========== LEAVE TYPES RESPONSE ==========
@freezed
class LeaveTypesResponse with _$LeaveTypesResponse {
  const factory LeaveTypesResponse({
    required List<LeaveType> data,
  }) = _LeaveTypesResponse;

  factory LeaveTypesResponse.fromJson(Map<String, dynamic> json) =>
      _$LeaveTypesResponseFromJson(json);
}

// ========== LEAVE QUOTA RESPONSE ==========
@freezed
class LeaveQuotaResponse with _$LeaveQuotaResponse {
  const factory LeaveQuotaResponse({
    required LeaveQuota data,
  }) = _LeaveQuotaResponse;

  factory LeaveQuotaResponse.fromJson(Map<String, dynamic> json) =>
      _$LeaveQuotaResponseFromJson(json);
}

// ========== UPDATE STATUS REQUEST ==========
@freezed
class LeaveUpdateStatusRequest with _$LeaveUpdateStatusRequest {
  const factory LeaveUpdateStatusRequest({
    required String status, // APPROVED atau REJECTED
    String? note,
  }) = _LeaveUpdateStatusRequest;

  factory LeaveUpdateStatusRequest.fromJson(Map<String, dynamic> json) =>
      _$LeaveUpdateStatusRequestFromJson(json);
}

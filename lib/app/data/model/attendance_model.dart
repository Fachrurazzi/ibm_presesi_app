import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';

part 'attendance_model.freezed.dart';
part 'attendance_model.g.dart';

// ========== ATTENDANCE REQUEST ==========
@freezed
class AttendanceRequest with _$AttendanceRequest {
  const factory AttendanceRequest({
    required double latitude,
    required double longitude,
  }) = _AttendanceRequest;

  factory AttendanceRequest.fromJson(Map<String, dynamic> json) =>
      _$AttendanceRequestFromJson(json);
}

// ========== ATTENDANCE RESPONSE (Single) ==========
@freezed
class AttendanceResponse with _$AttendanceResponse {
  const factory AttendanceResponse({
    required AttendanceEntity data,
  }) = _AttendanceResponse;

  factory AttendanceResponse.fromJson(Map<String, dynamic> json) =>
      _$AttendanceResponseFromJson(json);
}

// ========== ATTENDANCE SCHEDULE RESPONSE ==========
@freezed
class AttendanceScheduleResponse with _$AttendanceScheduleResponse {
  const factory AttendanceScheduleResponse({
    required AttendanceSchedule data,
  }) = _AttendanceScheduleResponse;

  factory AttendanceScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$AttendanceScheduleResponseFromJson(json);
}

// ========== ATTENDANCE SUMMARY RESPONSE ==========
@freezed
class AttendanceSummaryResponse with _$AttendanceSummaryResponse {
  const factory AttendanceSummaryResponse({
    required AttendanceSummary data,
  }) = _AttendanceSummaryResponse;

  factory AttendanceSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$AttendanceSummaryResponseFromJson(json);
}

// ========== PAGINATED ATTENDANCE RESPONSE ==========
@freezed
class PaginatedAttendanceResponse with _$PaginatedAttendanceResponse {
  const factory PaginatedAttendanceResponse({
    required List<AttendanceEntity> data,
    required PaginationMeta meta,
  }) = _PaginatedAttendanceResponse;

  factory PaginatedAttendanceResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginatedAttendanceResponseFromJson(json);
}

// ========== REPORT SUSPICIOUS REQUEST ==========
@freezed
class ReportSuspiciousRequest with _$ReportSuspiciousRequest {
  const factory ReportSuspiciousRequest({
    @Default('Terdeteksi fake GPS/emulator') String reason,
  }) = _ReportSuspiciousRequest;

  factory ReportSuspiciousRequest.fromJson(Map<String, dynamic> json) =>
      _$ReportSuspiciousRequestFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibm_presensi_app/app/module/entity/schedule.dart';

part 'schedule_model.freezed.dart';
part 'schedule_model.g.dart';

// ========== SCHEDULE REQUEST ==========
@freezed
class ScheduleRequest with _$ScheduleRequest {
  const factory ScheduleRequest({
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'shift_id') required int shiftId,
    @JsonKey(name: 'office_id') required int officeId,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') String? endDate,
    @JsonKey(name: 'is_wfa') @Default(false) bool isWfa,
    @JsonKey(name: 'is_banned') @Default(false) bool isBanned,
    @JsonKey(name: 'banned_reason') String? bannedReason,
  }) = _ScheduleRequest;

  factory ScheduleRequest.fromJson(Map<String, dynamic> json) =>
      _$ScheduleRequestFromJson(json);
}

// ========== SCHEDULE RESPONSE ==========
@freezed
class ScheduleResponse with _$ScheduleResponse {
  const factory ScheduleResponse({
    required ScheduleEntity data,
  }) = _ScheduleResponse;

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleResponseFromJson(json);
}

// ========== PAGINATED SCHEDULE RESPONSE ==========
@freezed
class PaginatedScheduleResponse with _$PaginatedScheduleResponse {
  const factory PaginatedScheduleResponse({
    required List<ScheduleEntity> data,
    required SchedulePaginationMeta meta,
  }) = _PaginatedScheduleResponse;

  factory PaginatedScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginatedScheduleResponseFromJson(json);
}

// ========== BAN SCHEDULE REQUEST ==========
@freezed
class BanScheduleRequest with _$BanScheduleRequest {
  const factory BanScheduleRequest({
    @JsonKey(name: 'banned_reason') required String bannedReason,
  }) = _BanScheduleRequest;

  factory BanScheduleRequest.fromJson(Map<String, dynamic> json) =>
      _$BanScheduleRequestFromJson(json);
}

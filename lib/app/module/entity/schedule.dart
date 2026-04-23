import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibm_presensi_app/app/module/entity/office.dart';
import 'package:ibm_presensi_app/app/module/entity/shift.dart';
import 'package:ibm_presensi_app/app/module/entity/user.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

// ========== SCHEDULE ENTITY (Admin) ==========
@freezed
class ScheduleEntity with _$ScheduleEntity {
  const factory ScheduleEntity({
    required int id,
    required ScheduleUser user,
    required ShiftInfo shift,
    required OfficeInfo office,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') String? endDate,
    @JsonKey(name: 'is_wfa') @Default(false) bool isWfa,
    @JsonKey(name: 'is_banned') @Default(false) bool isBanned,
    @JsonKey(name: 'banned_reason') String? bannedReason,
    @JsonKey(name: 'is_active') @Default(false) bool isActive,
    @JsonKey(name: 'date_range') String? dateRange,
  }) = _ScheduleEntity;

  factory ScheduleEntity.fromJson(Map<String, dynamic> json) =>
      _$ScheduleEntityFromJson(json);
}

// ========== SCHEDULE USER (Embedded) ==========
@freezed
class ScheduleUser with _$ScheduleUser {
  const factory ScheduleUser({
    required int id,
    required String name,
    String? position,
  }) = _ScheduleUser;

  factory ScheduleUser.fromJson(Map<String, dynamic> json) =>
      _$ScheduleUserFromJson(json);
}

// ========== PAGINATED SCHEDULE ==========
@freezed
class PaginatedSchedule with _$PaginatedSchedule {
  const factory PaginatedSchedule({
    required List<ScheduleEntity> data,
    required SchedulePaginationMeta meta,
  }) = _PaginatedSchedule;

  factory PaginatedSchedule.fromJson(Map<String, dynamic> json) =>
      _$PaginatedScheduleFromJson(json);
}

@freezed
class SchedulePaginationMeta with _$SchedulePaginationMeta {
  const factory SchedulePaginationMeta({
    @JsonKey(name: 'current_page') @Default(1) int currentPage,
    @JsonKey(name: 'per_page') @Default(10) int perPage,
    @Default(0) int total,
    @JsonKey(name: 'last_page') @Default(1) int lastPage,
  }) = _SchedulePaginationMeta;

  factory SchedulePaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$SchedulePaginationMetaFromJson(json);
}

// ========== PARAMETER CLASSES ==========

/// Parameter untuk create/update schedule
class ScheduleParams {
  final int userId;
  final int shiftId;
  final int officeId;
  final String startDate;
  final String? endDate;
  final bool isWfa;
  final bool isBanned;
  final String? bannedReason;

  const ScheduleParams({
    required this.userId,
    required this.shiftId,
    required this.officeId,
    required this.startDate,
    this.endDate,
    this.isWfa = false,
    this.isBanned = false,
    this.bannedReason,
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'user_id': userId,
      'shift_id': shiftId,
      'office_id': officeId,
      'start_date': startDate,
      'is_wfa': isWfa,
      'is_banned': isBanned,
    };
    if (endDate != null) json['end_date'] = endDate;
    if (bannedReason != null) json['banned_reason'] = bannedReason;
    return json;
  }
}

/// Parameter untuk ban schedule
class BanScheduleParams {
  final int id;
  final String reason;

  const BanScheduleParams({required this.id, required this.reason});

  Map<String, dynamic> toJson() => {'banned_reason': reason};
}

/// Parameter untuk list schedule (Admin)
class ScheduleListParams {
  final int page;
  final int perPage;
  final int? userId;
  final String? status; // active, expired

  const ScheduleListParams({
    this.page = 1,
    this.perPage = 10,
    this.userId,
    this.status,
  });

  Map<String, dynamic> toQueryParams() {
    final params = <String, String>{
      'page': page.toString(),
      'per_page': perPage.toString(),
    };
    if (userId != null) params['user_id'] = userId.toString();
    if (status != null) params['status'] = status!;
    return params;
  }
}

// ========== EXTENSIONS ==========
extension ScheduleEntityX on ScheduleEntity {
  bool get isActiveNow => isActive;
  bool get isExpired =>
      endDate != null && DateTime.parse(endDate!).isBefore(DateTime.now());

  String get statusDisplay {
    if (isBanned) return 'Ditangguhkan';
    if (isActiveNow) return 'Aktif';
    if (isExpired) return 'Berakhir';
    return 'Nonaktif';
  }

  String get shiftDisplay =>
      '${shift.name} (${shift.startTime ?? '--:--'} - ${shift.endTime ?? '--:--'})';
  String get officeDisplay => office.name;
  String get userDisplay => '${user.name} (${user.position ?? 'Staff'})';

    String get dateRangeDisplay {
    if (dateRange != null && dateRange!.isNotEmpty) return dateRange!;
    if (endDate == null) return '$startDate - Sekarang';
    return '$startDate - $endDate';
  }
}

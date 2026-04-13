import 'package:freezed_annotation/freezed_annotation.dart';
// Pastikan path import ini benar mengarah ke file user.dart di atas
import 'package:ibm_presensi_app/app/module/entity/user.dart';

part 'schedule.g.dart';
part 'schedule.freezed.dart';

@freezed
class ScheduleEntity with _$ScheduleEntity {
  const factory ScheduleEntity({
    @JsonKey(name: 'is_wfa') @Default(false) bool isWfa,
    @JsonKey(name: 'is_banned')
    @Default(false)
    bool isBanned, // Tambahkan ini untuk proteksi banned

    UserEntity? user,
    required OfficeEntity office,
    required ShiftEntity shift,
  }) = _ScheduleEntity;

  factory ScheduleEntity.fromJson(Map<String, dynamic> json) =>
      _$ScheduleEntityFromJson(json);
}

@freezed
class OfficeEntity with _$OfficeEntity {
  const factory OfficeEntity({
    @Default("Kantor IBM") String name,
    required double latitude,
    required double longitude,
    @Default(100.0) double radius,
  }) = _OfficeEntity;

  factory OfficeEntity.fromJson(Map<String, dynamic> json) =>
      _$OfficeEntityFromJson(json);
}

@freezed
class ShiftEntity with _$ShiftEntity {
  const factory ShiftEntity({
    @Default("Shift Normal") String name,
    @JsonKey(name: 'start_time') @Default("08:30") String startTime,
    @JsonKey(name: 'end_time') @Default("17:30") String endTime,
  }) = _ShiftEntity;

  factory ShiftEntity.fromJson(Map<String, dynamic> json) =>
      _$ShiftEntityFromJson(json);
}

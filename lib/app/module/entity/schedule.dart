import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule.g.dart';
part 'schedule.freezed.dart';

@freezed
class ScheduleEntity with _$ScheduleEntity {
  const factory ScheduleEntity({
    // Tambahkan field lain yang ada di database Laravel jika diperlukan (misal: id, user_id)
    @JsonKey(name: 'is_wfa') required bool isWfa,
    required OfficeEntity office,
    required ShiftEntity shift,
  }) = _ScheduleEntity;

  factory ScheduleEntity.fromJson(Map<String, dynamic> json) =>
      _$ScheduleEntityFromJson(json);
}

@freezed
class OfficeEntity with _$OfficeEntity {
  const factory OfficeEntity({
    // Tambahkan id jika diperlukan
    required String name,
    required double latitude,
    required double longitude,
    required double radius,
  }) = _OfficeEntity;

  factory OfficeEntity.fromJson(Map<String, dynamic> json) => 
      _$OfficeEntityFromJson(json);
}

@freezed
class ShiftEntity with _$ShiftEntity {
  const factory ShiftEntity({
    // Tambahkan id jika diperlukan
    required String name,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
  }) = _ShiftEntity;

  factory ShiftEntity.fromJson(Map<String, dynamic> json) => 
      _$ShiftEntityFromJson(json);
}
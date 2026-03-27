import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance.g.dart';
part 'attendance.freezed.dart';

// TAMBAHKAN @Freezed(unionKey: 'type', fallbackUnion: 'entity')
@Freezed(unionKey: 'runtimeType', fallbackUnion: 'entity')
sealed class Attendance with _$Attendance {
  // Pastikan factory entity adalah yang utama
  factory Attendance.entity({
    int? id,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    String? date,
    @JsonKey(name: 'is_late') bool? isLate,
    @JsonKey(name: 'lunch_money') int? lunchMoney,
    @JsonKey(name: 'lunch_money_label') String? lunchMoneyLabel,
    @JsonKey(name: 'schedule_start') String? scheduleStart,
    @JsonKey(name: 'schedule_end') String? scheduleEnd,
  }) = AttendanceEntity;

  factory Attendance.paramEntity({
    required double latitude,
    required double longitude,
    String? address,
    String? photo,
  }) = AttendanceParamEntity;

  factory Attendance.paramGetEntity({
    required int month,
    required int year,
  }) = AttendanceParamGetEntity;

  factory Attendance.fromJson(Map<String, Object?> json) =>
      _$AttendanceFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance.g.dart';
part 'attendance.freezed.dart';

@Freezed(unionKey: 'runtimeType', fallbackUnion: 'entity')
sealed class Attendance with _$Attendance {
  // Entity untuk menerima data dari Laravel (History & Today)
  const factory Attendance.entity({
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

  // Param untuk kirim data Check-in / Check-out (Hanya Koordinat)
  const factory Attendance.paramEntity({
    required double latitude,
    required double longitude,
    String? address,
    // Hapus photo dari sini jika tidak dikirim saat Store Absensi
  }) = AttendanceParamEntity;

  // Param untuk filter History Bulanan
  const factory Attendance.paramGetEntity({
    required int month,
    required int year,
  }) = AttendanceParamGetEntity;

  factory Attendance.fromJson(Map<String, Object?> json) =>
      _$AttendanceFromJson(json);
}

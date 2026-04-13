import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance.g.dart';
part 'attendance.freezed.dart';

@freezed
class Attendance with _$Attendance {
  // 1. DATA ENTITY (Hasil parsing dari Laravel)
  const factory Attendance.entity({
    int? id,
    // REVISI: Tambahkan tanda tanya (?) agar boleh null jika belum absen
    @JsonKey(name: 'start_time') String? startTime, 
    @JsonKey(name: 'end_time') String? endTime,
    String? date,
    @JsonKey(name: 'is_late') @Default(false) bool isLate,
    @JsonKey(name: 'lunch_money') @Default(0) int lunchMoney,
    @JsonKey(name: 'lunch_money_label') @Default('Rp 0') String lunchMoneyLabel,

    // Jam kerja seharusnya
    @JsonKey(name: 'schedule_start') String? scheduleStart,
    @JsonKey(name: 'schedule_end') String? scheduleEnd,
  }) = AttendanceEntity;

  // 2. PARAM ENTITY (Untuk kirim Absensi/Store)
  const factory Attendance.paramEntity({
    required double latitude,
    required double longitude,
    @Default('') String address,
    @Default('') String image, 
  }) = AttendanceParamEntity;

  // 3. PARAM GET ENTITY (Untuk filter riwayat)
  const factory Attendance.paramGetEntity({
    required int month,
    required int year,
  }) = AttendanceParamGetEntity;

  factory Attendance.fromJson(Map<String, Object?> json) =>
      _$AttendanceFromJson(json);
}
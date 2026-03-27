import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';

part 'attendance.g.dart';
part 'attendance.freezed.dart';

@freezed
sealed class Attendance with _$Attendance {
  // Factory model untuk memetakan JSON dari API
  factory Attendance.model({
    AttendanceEntity? today, // Boleh null jika user belum absen hari ini
    
    @JsonKey(name: 'this_month') // Mapping snake_case dari Laravel ke camelCase Dart
    required List<AttendanceEntity> thisMonth,
  }) = AttendanceModel;

  // Boilerplate untuk konversi JSON
  factory Attendance.fromJson(Map<String, Object?> json) =>
      _$AttendanceFromJson(json);
}
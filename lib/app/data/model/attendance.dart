import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';

part 'attendance.g.dart';
part 'attendance.freezed.dart';

@freezed
class AttendanceModel with _$AttendanceModel {
  const factory AttendanceModel({
    /// Data absen hari ini (Bisa null jika karyawan belum absen sama sekali)
    AttendanceEntity? today,

    /// Riwayat absen bulan berjalan (Gunakan List kosong [] sebagai default)
    @JsonKey(name: 'this_month') @Default([]) List<AttendanceEntity> thisMonth,

    /// Tips: Tambahkan status server jika diperlukan untuk debugging
    String? message,
  }) = _AttendanceModel;

  /// Bridge dari JSON Laravel ke Model Dart
  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceModelFromJson(json);
}

import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

abstract class AttendanceRepository {
  /// Mengambil data presensi hari ini (Check-in & Check-out)
  /// Mengembalikan null jika karyawan belum melakukan aksi presensi hari ini.
  Future<DataState<AttendanceEntity?>> getToday();

  /// Mengambil daftar riwayat presensi khusus untuk bulan berjalan.
  Future<DataState<List<AttendanceEntity>>> getThisMonth();

  /// Mengirim data presensi baru (Store).
  /// [param] berisi koordinat, alamat, dan foto wajah (base64/file).
  Future<DataState<bool>> sendAttendance(AttendanceParamEntity param);

  /// Mengambil data riwayat berdasarkan filter bulan dan tahun tertentu.
  /// Digunakan pada fitur rekap absen bulanan.
  Future<DataState<List<AttendanceEntity>>> getByMonthYear(
      AttendanceParamGetEntity param);
}

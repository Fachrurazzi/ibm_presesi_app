import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

abstract class AttendanceRepository {
  // 1. Ambil absen hari ini (Bisa null jika belum absen)
  Future<DataState<AttendanceEntity?>> getToday();

  // 2. Ambil riwayat bulan ini
  Future<DataState<List<AttendanceEntity>>> getThisMonth();

  // 3. Kirim data absen (Check-in/Check-out)
  // TIPS: Tambahkan tipe kembalian (misal bool) agar Notifier tahu sukses/tidaknya dengan jelas
  Future<DataState<bool>> sendAttendance(AttendanceParamEntity param);

  // 4. Filter riwayat berdasarkan bulan dan tahun
  Future<DataState<List<AttendanceEntity>>> getByMonthYear(
      AttendanceParamGetEntity param);
}

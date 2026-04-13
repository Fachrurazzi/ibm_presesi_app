import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/repository/attendance_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

/// Use Case untuk mengambil riwayat absensi berdasarkan filter Bulan & Tahun.
/// Digunakan pada fitur rekapitulasi kehadiran karyawan.
class AttendanceGetByMonthYear extends AppUseCase<
    DataState<List<AttendanceEntity>>, AttendanceParamGetEntity> {
  final AttendanceRepository _attendanceRepository;

  AttendanceGetByMonthYear(this._attendanceRepository);

  @override
  Future<DataState<List<AttendanceEntity>>> call({
    required AttendanceParamGetEntity param,
  }) {
    // Meminta repository mengambil data spesifik bulan/tahun dari API/Local
    return _attendanceRepository.getByMonthYear(param);
  }
}

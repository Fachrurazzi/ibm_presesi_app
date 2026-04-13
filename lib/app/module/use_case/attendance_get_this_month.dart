import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/repository/attendance_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

/// Use Case untuk mengambil riwayat absensi pada bulan berjalan.
/// Digunakan untuk menampilkan list rekap singkat di Dashboard Home.
class AttendanceGetMonthUseCase
    extends AppUseCase<DataState<List<AttendanceEntity>>, void> {
  final AttendanceRepository _attendanceRepository;

  AttendanceGetMonthUseCase(this._attendanceRepository);

  @override
  Future<DataState<List<AttendanceEntity>>> call({void param}) {
    // Memanggil repository untuk mengambil list riwayat bulan ini
    return _attendanceRepository.getThisMonth();
  }
}

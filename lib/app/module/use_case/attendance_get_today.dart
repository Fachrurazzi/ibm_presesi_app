import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/repository/attendance_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

/// Use Case untuk mengambil status kehadiran karyawan hari ini.
/// Hasilnya digunakan untuk menentukan apakah user harus Check-in atau Check-out.
class AttendanceGetTodayUseCase
    extends AppUseCase<DataState<AttendanceEntity?>, void> {
  final AttendanceRepository _attendanceRepository;

  AttendanceGetTodayUseCase(this._attendanceRepository);

  @override
  Future<DataState<AttendanceEntity?>> call({void param}) {
    // Meminta repository mengecek apakah sudah ada record absen hari ini
    return _attendanceRepository.getToday();
  }
}

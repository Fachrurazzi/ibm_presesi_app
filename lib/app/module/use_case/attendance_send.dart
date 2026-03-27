import 'dart:async';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/repository/attendance_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

// PERBAIKAN: Hilangkan Future di dalam kurung siku < >.
// Dan tambahkan tipe data kembalian (misal bool) agar Notifier lebih mudah memprosesnya.
class AttendanceSendUseCase
    extends AppUseCase<DataState<bool>, AttendanceParamEntity> {
  final AttendanceRepository _attendanceRepository;

  AttendanceSendUseCase(this._attendanceRepository);

  @override
  Future<DataState<bool>> call({required AttendanceParamEntity param}) {
    // Menghilangkan '!' dengan menggunakan 'required' pada parameter
    return _attendanceRepository.sendAttendance(param);
  }
}

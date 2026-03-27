import 'dart:async';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/repository/attendance_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

// PERBAIKAN: Hilangkan Future di dalam kurung siku < >
// agar tidak terjadi Future<Future<DataState>>.
class AttendanceGetTodayUseCase
    extends AppUseCase<DataState<AttendanceEntity?>, void> {
  final AttendanceRepository _attendanceRepository;

  AttendanceGetTodayUseCase(this._attendanceRepository);

  @override
  Future<DataState<AttendanceEntity?>> call({void param}) {
    return _attendanceRepository.getToday();
  }
}

import 'dart:async';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/repository/attendance_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

// PERBAIKAN: Tipe T (Return) cukup DataState<List<AttendanceEntity>> saja,
// karena AppUseCase sudah membungkusnya dalam Future.
class AttendanceGetByMonthYear extends AppUseCase<
    DataState<List<AttendanceEntity>>, AttendanceParamGetEntity> {
  final AttendanceRepository _attendanceRepository;

  AttendanceGetByMonthYear(this._attendanceRepository);

  @override
  Future<DataState<List<AttendanceEntity>>> call(
      {required AttendanceParamGetEntity param}) {
    // Gunakan required agar lebih aman
    return _attendanceRepository.getByMonthYear(param);
  }
}

import 'dart:async';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/repository/attendance_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

// PERBAIKAN: Tipe T (Return) cukup DataState<List<AttendanceEntity>>
// Karena kontrak AppUseCase sudah membungkusnya dalam Future secara otomatis.
class AttendanceGetMonthUseCase
    extends AppUseCase<DataState<List<AttendanceEntity>>, void> {
  final AttendanceRepository _attendanceRepository;

  AttendanceGetMonthUseCase(this._attendanceRepository);

  @override
  Future<DataState<List<AttendanceEntity>>> call({void param}) {
    return _attendanceRepository.getThisMonth();
  }
}

import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/repository/attendance_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class AttendanceGetTodayUseCase
    extends AppUseCase<DataState<AttendanceEntity?>, NoParams> {
  final AttendanceRepository _repository;

  AttendanceGetTodayUseCase(this._repository);

  @override
  Future<DataState<AttendanceEntity?>> call(NoParams params) {
    return _repository.getToday();
  }
}

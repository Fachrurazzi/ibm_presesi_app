import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/repository/attendance_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class AttendanceGetThisMonthUseCase
    extends AppUseCase<DataState<AttendanceSummary>, NoParams> {
  final AttendanceRepository _repository;

  AttendanceGetThisMonthUseCase(this._repository);

  @override
  Future<DataState<AttendanceSummary>> call(NoParams params) {
    final now = DateTime.now();
    return _repository.getSummary(
      AttendanceSummaryParams(month: now.month, year: now.year),
    );
  }
}

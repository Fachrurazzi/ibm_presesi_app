import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/repository/attendance_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class AttendanceGetSummaryUseCase
    extends AppUseCase<DataState<AttendanceSummary>, AttendanceSummaryParams> {
  final AttendanceRepository _repository;

  AttendanceGetSummaryUseCase(this._repository);

  @override
  Future<DataState<AttendanceSummary>> call(AttendanceSummaryParams param) {
    if (param.month < 1 || param.month > 12) {
      return Future.value(
        const ErrorState(message: "Bulan tidak valid (1-12)"),
      );
    }
    return _repository.getSummary(param);
  }
}

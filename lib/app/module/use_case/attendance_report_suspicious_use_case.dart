import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/repository/attendance_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class AttendanceReportSuspiciousUseCase
    extends AppUseCase<DataState<bool>, ReportSuspiciousParams> {
  final AttendanceRepository _repository;

  AttendanceReportSuspiciousUseCase(this._repository);

  @override
  Future<DataState<bool>> call(ReportSuspiciousParams param) {
    return _repository.reportSuspicious(param);
  }
}

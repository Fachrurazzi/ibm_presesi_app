import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/repository/attendance_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class AttendanceGetHistoryUseCase extends AppUseCase<
    DataState<PaginatedAttendance>, AttendanceHistoryParams> {
  final AttendanceRepository _repository;

  AttendanceGetHistoryUseCase(this._repository);

  @override
  Future<DataState<PaginatedAttendance>> call(AttendanceHistoryParams param) {
    if (param.month < 1 || param.month > 12) {
      return Future.value(
        const ErrorState(message: "Bulan tidak valid (1-12)"),
      );
    }
    if (param.year < 2020 || param.year > 2100) {
      return Future.value(
        const ErrorState(message: "Tahun tidak valid"),
      );
    }
    return _repository.getHistory(param);
  }
}

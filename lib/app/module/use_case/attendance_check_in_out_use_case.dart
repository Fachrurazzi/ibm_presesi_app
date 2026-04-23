import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/repository/attendance_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class AttendanceCheckInOutUseCase
    extends AppUseCase<DataState<AttendanceEntity>, AttendanceSendParams> {
  final AttendanceRepository _repository;

  AttendanceCheckInOutUseCase(this._repository);

  @override
  Future<DataState<AttendanceEntity>> call(AttendanceSendParams param) {
    // Validasi koordinat
    if (param.latitude < -90 || param.latitude > 90) {
      return Future.value(
        const ErrorState(message: "Latitude tidak valid (-90 sampai 90)"),
      );
    }
    if (param.longitude < -180 || param.longitude > 180) {
      return Future.value(
        const ErrorState(message: "Longitude tidak valid (-180 sampai 180)"),
      );
    }
    return _repository.sendAttendance(param);
  }
}

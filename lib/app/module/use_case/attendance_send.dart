import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/repository/attendance_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

/// Use Case untuk mengirim data presensi (Check-in atau Check-out).
/// Mengirimkan parameter lokasi (lat/long), alamat, dan foto wajah.
class AttendanceSendUseCase
    extends AppUseCase<DataState<bool>, AttendanceParamEntity> {
  final AttendanceRepository _attendanceRepository;

  AttendanceSendUseCase(this._attendanceRepository);

  @override
  Future<DataState<bool>> call({required AttendanceParamEntity param}) {
    // Meminta repository untuk melakukan POST data ke server
    return _attendanceRepository.sendAttendance(param);
  }
}

import 'package:ibm_presensi_app/app/data/model/attendance.dart';
import 'package:ibm_presensi_app/app/data/source/attendance_api_service.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/repository/attendance_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

class AttendanceRepositoryImpl extends AttendanceRepository {
  final AttendanceApiService _attendanceApiService;

  AttendanceRepositoryImpl(this._attendanceApiService);

  @override
  Future<DataState<List<AttendanceEntity>>> getThisMonth() {
    return handleResponse(
      () => _attendanceApiService.getAttendanceToday(),
      (json) {
        final attendanceModel = AttendanceModel.fromJson(json);

        return attendanceModel.thisMonth;
      },
    );
  }

  @override
  Future<DataState<AttendanceEntity?>> getToday() {
    return handleResponse(
      () => _attendanceApiService.getAttendanceToday(),
      (json) {
        final attendanceModel = AttendanceModel.fromJson(json);

        return attendanceModel.today;
      },
    );
  }

  @override
  Future<DataState<dynamic>> sendAttendance(AttendanceParamEntity param) {
    return handleResponse(
      () => _attendanceApiService.sendAttendance(body: param.toJson()),
      (p0) {
        return null;
      },
    );
  }

  @override
  Future<DataState<List<AttendanceEntity>>> getByMonthYear(
      AttendanceParamGetEntity param) {
    return handleResponse(
      () => _attendanceApiService.getAttendanceByMonthYear(
          month: param.month.toString(), year: param.year.toString()),
      (json) => List<AttendanceEntity>.from(
          json.map((item) => AttendanceEntity.fromJson(item))),
    );
  }
}

import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/repository/attendance_repository.dart';
import 'package:ibm_presensi_app/app/data/source/attendance_api_service.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

class AttendanceRepositoryImpl extends AttendanceRepository {
  final AttendanceApiService _attendanceApiService;

  AttendanceRepositoryImpl(this._attendanceApiService);

  @override
  Future<DataState<List<AttendanceEntity>>> getThisMonth() {
    return handleResponse(
      () => _attendanceApiService.getAttendanceToday(),
      (json) {
        // Cek apakah json['data'] ada, jika tidak gunakan json langsung
        final dataContainer =
            json is Map && json.containsKey('data') ? json['data'] : json;
        final List rawData = dataContainer['this_month'] ?? [];

        return rawData
            .map((item) => Attendance.fromJson(item) as AttendanceEntity)
            .toList();
      },
    );
  }

  @override
  Future<DataState<AttendanceEntity?>> getToday() {
    return handleResponse(
      () => _attendanceApiService.getAttendanceToday(),
      (json) {
        final dataContainer =
            json is Map && json.containsKey('data') ? json['data'] : json;
        if (dataContainer['today'] == null) return null;

        return Attendance.fromJson(dataContainer['today']) as AttendanceEntity;
      },
    );
  }

  @override
  Future<DataState<List<AttendanceEntity>>> getByMonthYear(
      AttendanceParamGetEntity param) {
    return handleResponse(
      () => _attendanceApiService.getAttendanceByMonthYear(
          month: param.month.toString(), year: param.year.toString()),
      (json) {
        // PERBAIKAN DI SINI:
        // Jika API langsung mengembalikan List di dalam 'data' atau langsung List
        dynamic rawData;
        if (json is List) {
          rawData = json;
        } else if (json is Map && json.containsKey('data')) {
          rawData = json['data'];
        } else {
          rawData = [];
        }

        return (rawData as List)
            .map((item) => Attendance.fromJson(item) as AttendanceEntity)
            .toList();
      },
    );
  }

  @override
  Future<DataState<bool>> sendAttendance(AttendanceParamEntity param) {
    return handleResponse(
      () => _attendanceApiService.sendAttendance(body: param.toJson()),
      (json) => true,
    );
  }
}

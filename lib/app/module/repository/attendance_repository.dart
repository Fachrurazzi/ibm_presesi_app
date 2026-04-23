import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

abstract class AttendanceRepository {
  /// GET /attendance/today - Get today's attendance
  Future<DataState<AttendanceEntity?>> getToday();

  /// GET /attendance/history - Get attendance history with pagination
  Future<DataState<PaginatedAttendance>> getHistory(
      AttendanceHistoryParams param);

  /// GET /attendance/schedule - Get today's schedule for attendance
  Future<DataState<AttendanceSchedule>> getSchedule();

  /// GET /attendance/summary - Get monthly attendance summary
  Future<DataState<AttendanceSummary>> getSummary(
      AttendanceSummaryParams param);

  /// POST /attendance - Check-in or Check-out
  Future<DataState<AttendanceEntity>> sendAttendance(
      AttendanceSendParams param);

  /// POST /attendance/report-suspicious - Report fake GPS/emulator
  Future<DataState<bool>> reportSuspicious(ReportSuspiciousParams param);
}

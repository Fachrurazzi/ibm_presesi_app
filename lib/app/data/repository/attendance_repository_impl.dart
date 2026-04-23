import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:ibm_presensi_app/app/data/source/attendance_api_service.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/repository/attendance_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final AttendanceApiService _apiService;

  AttendanceRepositoryImpl(this._apiService);

  @override
  Future<DataState<AttendanceEntity?>> getToday() {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getToday();
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        if (json == null) return null;
        final data = json['data'];
        if (data == null) return null;
        debugPrint('✅ Today attendance loaded');
        return AttendanceEntity.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<PaginatedAttendance>> getHistory(
      AttendanceHistoryParams param) {
    // 🆕 Batasi perPage max 50
    final limitedPerPage = param.perPage > 50 ? 50 : param.perPage;

    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getHistory(
          month: param.month,
          year: param.year,
          perPage: limitedPerPage,
          page: param.page,
        );
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        debugPrint('✅ History loaded: ${param.month}/${param.year}');
        return PaginatedAttendance.fromJson(json as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<AttendanceSchedule>> getSchedule() {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getSchedule();
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        debugPrint('✅ Schedule loaded');
        return AttendanceSchedule.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<AttendanceSummary>> getSummary(
      AttendanceSummaryParams param) {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getSummary(
          month: param.month,
          year: param.year,
        );
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        debugPrint('✅ Summary loaded: ${param.month}/${param.year}');
        return AttendanceSummary.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<AttendanceEntity>> sendAttendance(
      AttendanceSendParams param) {
    return handleResponse(
      apiCall: () async {
        final jsonString =
            await _apiService.sendAttendance(body: param.toJson());
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        debugPrint(
            '✅ Attendance recorded: ${param.latitude}, ${param.longitude}');
        return AttendanceEntity.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<bool>> reportSuspicious(ReportSuspiciousParams param) {
    return handleResponse(
      apiCall: () async {
        final jsonString =
            await _apiService.reportSuspicious(body: param.toJson());
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (_) {
        debugPrint('⚠️ Suspicious activity reported: ${param.reason}');
        return true;
      },
    );
  }
}

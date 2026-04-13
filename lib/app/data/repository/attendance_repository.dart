import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/repository/attendance_repository.dart';
import 'package:ibm_presensi_app/app/data/source/attendance_api_service.dart';
import 'package:ibm_presensi_app/app/data/model/attendance.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

class AttendanceRepositoryImpl extends AttendanceRepository {
  final AttendanceApiService _attendanceApiService;

  AttendanceRepositoryImpl(this._attendanceApiService);

  @override
  Future<DataState<AttendanceEntity?>> getToday() {
    return handleResponse(
      apiCall: () => _attendanceApiService.getAttendanceToday(),
      mapDataSuccess: (json) {
        // REVISI: Laravel mengirim null jika belum absen.
        // Jangan langsung panggil AttendanceEntity.fromJson(json)
        if (json == null) return null;

        try {
          // Pastikan json adalah Map, bukan String atau lainnya
          if (json is Map<String, dynamic>) {
            return AttendanceEntity.fromJson(json);
          }
          return null;
        } catch (e) {
          debugPrint("🚨 REPO_ERROR (getToday): $e");
          return null;
        }
      },
    );
  }

  @override
  Future<DataState<List<AttendanceEntity>>> getThisMonth() {
    // Kita tetap panggil getByMonthYear dengan parameter bulan/tahun saat ini
    // agar data history benar-benar sinkron dengan backend
    final now = DateTime.now();
    return getByMonthYear(AttendanceParamGetEntity(
      month: now.month,
      year: now.year,
    ));
  }

  @override
  Future<DataState<List<AttendanceEntity>>> getByMonthYear(
      AttendanceParamGetEntity param) {
    return handleResponse(
      apiCall: () => _attendanceApiService.getAttendanceByMonthYear(
          month: param.month.toString(), year: param.year.toString()),
      mapDataSuccess: (json) {
        // REVISI: Laravel mengembalikan List<AttendanceEntity> langsung di field 'data'
        if (json == null) return [];
        final List rawData = json is List ? json : [];
        return rawData.map((item) => AttendanceEntity.fromJson(item)).toList();
      },
    );
  }

  @override
  Future<DataState<bool>> sendAttendance(AttendanceParamEntity param) {
    return handleResponse(
      apiCall: () => _attendanceApiService.sendAttendance(body: param.toJson()),
      mapDataSuccess: (json) => true,
    );
  }
}

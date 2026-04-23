import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_check_in_out_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_today_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_schedule_use_case.dart';
import 'package:ibm_presensi_app/app/presentation/common/dashboard/dashboard_notifier.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class CheckInOutNotifier extends AppProvider {
  final AttendanceGetTodayUseCase _getTodayUseCase;
  final AttendanceGetScheduleUseCase _getScheduleUseCase;
  final AttendanceCheckInOutUseCase _checkInOutUseCase;

  CheckInOutNotifier(
    this._getTodayUseCase,
    this._getScheduleUseCase,
    this._checkInOutUseCase,
  ) {
    init();
  }

  AttendanceEntity? _attendanceToday;
  AttendanceSchedule? _schedule;
  bool _isLoadingData = false;
  String _actionMessage = "";

  AttendanceEntity? get attendanceToday => _attendanceToday;
  AttendanceSchedule? get schedule => _schedule;
  bool get isLoadingData => _isLoadingData;
  String get actionMessage => _actionMessage;

  bool get isCheckedIn =>
      _attendanceToday != null && _attendanceToday!.isCheckedIn;
  bool get isCheckedOut => _attendanceToday?.isCheckedOut ?? false;
  bool get isOnLeave => _schedule?.isOnLeave ?? false;
  bool get isBanned => _schedule?.isBanned ?? false;

  bool get canCheckIn {
    if (isOnLeave) return false;
    if (isBanned) return false;
    return _schedule?.canCheckIn ?? false;
  }

  bool get canCheckOut =>
      isCheckedIn && !isCheckedOut && !isOnLeave && !isBanned;

  String get officeName => _schedule?.office.name ?? 'Kantor';
  String get shiftTime => _schedule?.shiftTimeDisplay ?? '--:-- - --:--';

  String get buttonText {
    if (isOnLeave) return "SEDANG CUTI 🏖️";
    if (isBanned) return "AKUN DITANGGUHKAN 🚫";
    if (isCheckedOut) return "ABSENSI SELESAI ✅";
    if (isCheckedIn) return "CHECK-OUT";
    return "CHECK-IN";
  }

  @override
  Future<void> init() async {
    await loadData();
  }

  Future<void> loadData() async {
    _isLoadingData = true;
    notifyListeners();

    await Future.wait([
      _loadTodayAttendance(),
      _loadSchedule(),
    ]);

    _isLoadingData = false;
    notifyListeners();
  }

  Future<void> _loadTodayAttendance() async {
    final result = await _getTodayUseCase(const NoParams());
    if (result is SuccessState<AttendanceEntity?>) {
      _attendanceToday = result.data;
    }
  }

  Future<void> _loadSchedule() async {
    final result = await _getScheduleUseCase(const NoParams());
    if (result is SuccessState<AttendanceSchedule>) {
      _schedule = result.data;
    }
  }

  Future<bool> submitAttendance(double latitude, double longitude) async {
    // Validasi sebelum submit
    if (isOnLeave) {
      _actionMessage =
          "Anda sedang dalam masa cuti, tidak dapat melakukan absen.";
      notifyListeners();
      return false;
    }

    if (isBanned) {
      _actionMessage = "Akun Anda ditangguhkan, tidak dapat melakukan absen.";
      notifyListeners();
      return false;
    }

    if (!canCheckIn && !canCheckOut) {
      _actionMessage = "Tidak dapat melakukan absen saat ini.";
      notifyListeners();
      return false;
    }

    showLoading();
    _actionMessage = "";

    final params = AttendanceSendParams(
      latitude: latitude,
      longitude: longitude,
    );

    final result = await _checkInOutUseCase(params);

    if (result is SuccessState<AttendanceEntity>) {
      _attendanceToday = result.data;

      if (sl.isRegistered<DashboardNotifier>()) {
        await sl<DashboardNotifier>().refreshAll();
      }

      _actionMessage =
          isCheckedIn ? "Check-in berhasil ✅" : "Check-out berhasil ✅";
      hideLoading();
      notifyListeners();
      return true;
    } else {
      _actionMessage = result.message;
      hideLoading();
      notifyListeners();
      return false;
    }
  }

  @override
  void clearError() {
    _actionMessage = "";
    notifyListeners();
  }
}

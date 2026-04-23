import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/entity/dashboard.dart';
import 'package:ibm_presensi_app/app/module/entity/user.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_today_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/dashboard_get_monthly_summary_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/dashboard_get_recent_activities_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/dashboard_get_stats_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/user_get_photo_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/user_get_today_schedule_use_case.dart';
import 'package:ibm_presensi_app/app/presentation/common/profile/profile_notifier.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/date_time_helper.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class DashboardNotifier extends AppProvider {
  final DashboardGetStatsUseCase _getStatsUseCase;
  final DashboardGetMonthlySummaryUseCase _getMonthlySummaryUseCase;
  final DashboardGetRecentActivitiesUseCase _getRecentActivitiesUseCase;
  final AttendanceGetTodayUseCase _getTodayAttendanceUseCase;
  final UserGetTodayScheduleUseCase _getTodayScheduleUseCase;
  final UserGetPhotoUseCase _getPhotoUseCase;

  DashboardNotifier(
    this._getStatsUseCase,
    this._getMonthlySummaryUseCase,
    this._getRecentActivitiesUseCase,
    this._getTodayAttendanceUseCase,
    this._getTodayScheduleUseCase,
    this._getPhotoUseCase,
  ) {
    init();
  }

  // ========== STATE VARIABLES ==========
  DashboardStats? _stats;
  MonthlySummary? _monthlySummary;
  List<RecentActivity> _recentActivities = [];
  AttendanceEntity? _attendanceToday;
  TodaySchedule? _todaySchedule;

  String _userName = 'Karyawan IBM';
  String _userPosition = 'Staff';
  String? _userAvatar;
  int _leaveQuota = 12;
  int _remainingLeave = 12;

  String _workingDuration = "0j 0m";
  String _errorMessage = "";
  bool _isRefreshing = false;

  Timer? _workTimer;

  // ========== GETTERS ==========
  DashboardStats? get stats => _stats;
  MonthlySummary? get monthlySummary => _monthlySummary;
  List<RecentActivity> get recentActivities => _recentActivities;
  AttendanceEntity? get attendanceToday => _attendanceToday;
  TodaySchedule? get todaySchedule => _todaySchedule;

  String get userName => _userName;
  String get userPosition => _userPosition;
  String? get userAvatar => _userAvatar;
  int get leaveQuota => _leaveQuota;
  int get remainingLeave => _remainingLeave;
  String get workingDuration => _workingDuration;
  @override
  String get errorMessage => _errorMessage;
  bool get isRefreshing => _isRefreshing;

  bool get isCheckedIn =>
      _attendanceToday != null && _attendanceToday!.isCheckedIn;
  bool get isCheckedOut => _attendanceToday?.isCheckedOut ?? false;
  bool get isOnLeave => _todaySchedule?.isOnLeave ?? false;
  bool get isBanned => _todaySchedule?.isBanned ?? false;
  bool get isWfa => _todaySchedule?.isWfa ?? false;

  bool get canCheckIn {
    if (isOnLeave) return false;
    if (isBanned) return false;
    return _todaySchedule?.canCheckIn ?? false;
  }

  bool get canCheckOut =>
      isCheckedIn && !isCheckedOut && !isOnLeave && !isBanned;

  String get officeName => _todaySchedule?.office.name ?? 'PT Intiboga Mandiri';
  String get shiftTime => _todaySchedule?.shiftTimeDisplay ?? '--:-- - --:--';

  // ========== INIT ==========
  @override
  Future<void> init() async {
    await loadLocalData();
    await refreshAll();
    _startWorkTimer();
  }

  // ========== LOAD LOCAL DATA ==========
  Future<void> loadLocalData() async {
    final session = SharedPreferencesHelper.getUserSession();
    if (session != null) {
      _userName = session.displayName;
      _userPosition = session.positionDisplay;
      _userAvatar = session.avatarUrl;
      _leaveQuota = session.leaveQuota;
      _remainingLeave = session.remainingLeave;
    }
    notifyListeners();
  }

  // ========== REFRESH ALL ==========
  Future<void> refreshAll() async {
    if (_isRefreshing) return;

    _isRefreshing = true;
    _errorMessage = "";
    notifyListeners();

    try {
      await Future.wait([
        _loadStats(),
        _loadTodaySchedule(),
        _loadTodayAttendance(),
        _loadRecentActivities(),
        _loadUserPhoto(),
      ]);

      await _loadMonthlySummary();
    } catch (e) {
      _errorMessage = "Gagal memuat data: $e";
      debugPrint("🚨 DASHBOARD_REFRESH_ERROR: $e");
    } finally {
      _isRefreshing = false;
      notifyListeners();
    }
  }

  Future<void> _loadStats() async {
    final result = await _getStatsUseCase(const NoParams());
    if (result is SuccessState<DashboardStats>) {
      _stats = result.data;
      if (_stats != null) {
        _userName = _stats!.user.name;
        _userPosition = _stats!.user.position ?? _userPosition;
        _userAvatar = _stats!.user.avatarUrl ?? _userAvatar;
        _leaveQuota = _stats!.stats.totalCuti;
        _remainingLeave = _stats!.stats.sisaCuti;
      }
    }
  }

  Future<void> _loadMonthlySummary() async {
    final now = DateTime.now();
    final result = await _getMonthlySummaryUseCase(
      MonthlySummaryParams(month: now.month, year: now.year),
    );
    if (result is SuccessState<MonthlySummary>) {
      _monthlySummary = result.data;
    }
  }

  Future<void> _loadRecentActivities() async {
    final result = await _getRecentActivitiesUseCase(const NoParams());
    if (result is SuccessState<List<RecentActivity>>) {
      _recentActivities = result.data ?? [];
    }
  }

  Future<void> _loadTodayAttendance() async {
    final result = await _getTodayAttendanceUseCase(const NoParams());
    if (result is SuccessState<AttendanceEntity?>) {
      _attendanceToday = result.data;
      _updateWorkingDuration();
    }
  }

  Future<void> _loadTodaySchedule() async {
    final result = await _getTodayScheduleUseCase(const NoParams());
    if (result is SuccessState<TodaySchedule>) {
      _todaySchedule = result.data;
    }
  }

  Future<void> _loadUserPhoto() async {
    final result = await _getPhotoUseCase(const NoParams());
    if (result is SuccessState<String>) {
      _userAvatar = result.data;
    }
  }

  // ========== WORKING DURATION TIMER ==========
  void _startWorkTimer() {
    _workTimer?.cancel();
    _workTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      _updateWorkingDuration();
    });
  }

  void _updateWorkingDuration() {
    if (_attendanceToday?.startTime != null && _attendanceToday!.isCheckedIn) {
      _workingDuration = _attendanceToday!.workDuration ?? "0j 0m";
    } else {
      _workingDuration = "0j 0m";
    }
    notifyListeners();
  }

  // ========== UPDATE USER INFO ==========
  void updateUserInfo({String? name, String? position, String? avatar}) {
    if (name != null) _userName = name;
    if (position != null) _userPosition = position;
    if (avatar != null) _userAvatar = avatar;
    notifyListeners();
  }

  // ========== CLEAR ERROR ==========
  @override
  void clearError() {
    _errorMessage = "";
    notifyListeners();
  }

  // ========== LOGOUT ==========
  Future<void> logout(BuildContext context) async {
    _workTimer?.cancel();
    showLoading();
    await SharedPreferencesHelper.logout();

    if (sl.isRegistered<DashboardNotifier>()) {
      sl.resetLazySingleton<DashboardNotifier>();
    }
    if (sl.isRegistered<ProfileNotifier>()) {
      sl.resetLazySingleton<ProfileNotifier>();
    }

    hideLoading();
    if (context.mounted) {
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }
  }

  // ========== DISPOSE ==========
  @override
  void dispose() {
    _workTimer?.cancel();
    super.dispose();
  }
}

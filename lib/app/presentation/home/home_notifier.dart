import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/entity/schedule.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_this_month.dart';
import 'package:ibm_presensi_app/app/module/use_case/photo_get_url.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_banned.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_get.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/helper/date_time_helper.dart';
import 'package:ibm_presensi_app/core/helper/notification_helper.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_today.dart';

class HomeNotifier extends AppProvider {
  final AttendanceGetTodayUseCase _attendanceGetTodayUseCase;
  final AttendanceGetMonthUseCase _attendanceGetMonthUseCase;
  final ScheduleGetUseCase _scheduleGetUseCase;
  final ScheduleBannedUseCase _scheduleBannedUseCase;
  final PhotoGetUrlUseCase _photoGetUrlUseCase;

  HomeNotifier(
    this._attendanceGetTodayUseCase,
    this._attendanceGetMonthUseCase,
    this._scheduleGetUseCase,
    this._scheduleBannedUseCase,
    this._photoGetUrlUseCase,
  ) {
    init();
  }

  // State Variables
  String _name = '';
  String? _photoUrl;
  String _joinDate = '';
  String _positionName = '';
  int _leaveQuota = 0;
  int _cashableLeave = 0;
  bool _isLeaves = false;
  int _timeNotification = 5;
  AttendanceEntity? _attendanceToday;
  List<AttendanceEntity> _listAttendanceThisMonth = [];
  ScheduleEntity? _schedule;

  // Getters
  String get name => _name;
  String? get photoUrl => _photoUrl;
  String get joinDate => _joinDate;
  String get positionName => _positionName;
  int get leaveQuota => _leaveQuota;
  int get cashableLeave => _cashableLeave;
  bool get isLeaves => _isLeaves;
  int get timeNotification => _timeNotification;
  AttendanceEntity? get attendanceToday => _attendanceToday;
  List<AttendanceEntity> get listAttendanceThisMonth =>
      _listAttendanceThisMonth;
  ScheduleEntity? get schedule => _schedule;

  final List<DropdownMenuEntry<int>> listEditNotification = [
    const DropdownMenuEntry<int>(value: 5, label: '5 Menit'),
    const DropdownMenuEntry<int>(value: 15, label: '15 Menit'),
    const DropdownMenuEntry<int>(value: 30, label: '30 Menit'),
  ];

  @override
  Future<void> init() async {
    showLoading();

    // 1. Ambil data dasar dari SharedPreferences
    _name =
        await SharedPreferencesHelper.getString(AppPreferences.USER_NAME) ?? '';
    _timeNotification =
        await SharedPreferencesHelper.getInt(AppPreferences.NOTIF_SETTING) ?? 5;
    _leaveQuota =
        await SharedPreferencesHelper.getInt(AppPreferences.LEAVE_QUOTA) ?? 0;
    _cashableLeave =
        await SharedPreferencesHelper.getInt(AppPreferences.CASHABLE_LEAVE) ??
            0;
    _joinDate =
        await SharedPreferencesHelper.getString(AppPreferences.JOIN_DATE) ?? '';
    _positionName =
        await SharedPreferencesHelper.getString(AppPreferences.POSITION_NAME) ??
            'Karyawan';

    // 2. Jalankan API secara paralel
    await Future.wait([
      _getPhotoUrl(),
      _getAttendanceToday(),
      _getAttendanceThisMonth(),
      _getSchedule(),
      _getNotificationPermission(),
    ]);

    hideLoading();
    notifyListeners();
  }

  Future<void> _getPhotoUrl() async {
    final response = await _photoGetUrlUseCase();
    _photoUrl = response.success ? response.data : null;
  }

  Future<void> _getAttendanceToday() async {
    final response = await _attendanceGetTodayUseCase();
    if (response.success) {
      _attendanceToday = response.data;
    }
  }

  Future<void> _getAttendanceThisMonth() async {
    final response = await _attendanceGetMonthUseCase();
    if (response.success) {
      _listAttendanceThisMonth = response.data ?? [];
    }
  }

  Future<void> _getSchedule() async {
    _isLeaves = false;
    final response = await _scheduleGetUseCase();

    if (response.success && response.data != null) {
      _schedule = response.data;

      if (_schedule?.shift != null) {
        await SharedPreferencesHelper.setString(
            AppPreferences.START_SHIFT, _schedule!.shift.startTime);
        await SharedPreferencesHelper.setString(
            AppPreferences.END_SHIFT, _schedule!.shift.endTime);
      }
      setNotification();
    } else if (response.message.toLowerCase().contains('cuti')) {
      _isLeaves = true;
    }
  }

  Future<void> _getNotificationPermission() async {
    bool granted = await NotificationHelper.isPermissionGranted();
    if (!granted) await NotificationHelper.requestPermission();
  }

  Future<void> setNotification() async {
    await NotificationHelper.cancelAll();
    final startShift =
        await SharedPreferencesHelper.getString(AppPreferences.START_SHIFT) ??
            '';
    final endShift =
        await SharedPreferencesHelper.getString(AppPreferences.END_SHIFT) ?? '';

    if (startShift.isEmpty || endShift.isEmpty) return;

    DateTime startDt = DateTimeHelper.parseDateTime(
            dateTimeString: startShift, format: 'HH:mm')
        .subtract(Duration(minutes: _timeNotification));
    DateTime endDt =
        DateTimeHelper.parseDateTime(dateTimeString: endShift, format: 'HH:mm')
            .subtract(Duration(minutes: _timeNotification));

    await NotificationHelper.scheduleNotification(
      id: 'start'.hashCode,
      title: 'Pengingat Masuk',
      body: 'Waktunya presensi masuk PT Intiboga Mandiri',
      hour: startDt.hour,
      minutes: startDt.minute,
    );

    await NotificationHelper.scheduleNotification(
      id: 'end'.hashCode,
      title: 'Pengingat Pulang',
      body: 'Jangan lupa presensi keluar ya!',
      hour: endDt.hour,
      minutes: endDt.minute,
    );
  }

  Future<void> saveNotificationSetting(int param) async {
    showLoading();
    await SharedPreferencesHelper.setInt(AppPreferences.NOTIF_SETTING, param);
    _timeNotification = param;
    await setNotification();
    hideLoading();
    notifyListeners();
  }
}

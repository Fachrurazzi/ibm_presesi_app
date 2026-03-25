import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
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
      this._photoGetUrlUseCase) {
    init();
  }

  bool _isGrantedNotificationPermission = false;
  int _timeNotification = 5;
  final List<DropdownMenuEntry<int>> _listEditNotification = [
    const DropdownMenuEntry<int>(value: 5, label: '5 menit'),
    const DropdownMenuEntry<int>(value: 15, label: '15 menit'),
    const DropdownMenuEntry<int>(value: 30, label: '30 menit')
  ];
  String _name = '';
  bool _isPhysicDevice = true; // default false
  AttendanceEntity? _attendanceToday;
  List<AttendanceEntity> _listAttendanceThisMonth = [];
  ScheduleEntity? _schedule;
  bool _isLeaves = false;

  bool get isGrantedNotification => _isGrantedNotificationPermission;
  List<DropdownMenuEntry<int>> get listEditNotification =>
      _listEditNotification;
  int get timeNotification => _timeNotification;
  String? _photoUrl;
  String? get photoUrl => _photoUrl;

  String get name => _name;

  bool get isPhysicDevice => _isPhysicDevice;

  AttendanceEntity? get attendanceToday => _attendanceToday;

  List<AttendanceEntity> get listAttendanceThisMonth =>
      _listAttendanceThisMonth;

  ScheduleEntity? get schedule => _schedule;

  bool get isLeaves => _isLeaves;

  @override
  void init() async {
    await _getUserDetail();
    // await _getDeviceInfo();
    await _getNotificationPermission();
    if (errorMessage.isEmpty) await _getPhotoUrl();

    if (errorMessage.isEmpty) await _getAttendanceToday();
    if (errorMessage.isEmpty) await _getAttendanceThisMonth();
    if (errorMessage.isEmpty) await _getSchedule();
  }

  _getUserDetail() async {
    showLoading();
    _name = await SharedPreferencesHelper.getString(PREF_NAME);
    _timeNotification =
        await SharedPreferencesHelper.getInt(PREF_NOTIF_SETTING) ?? 5;
    hideLoading();
  }

  _getPhotoUrl() async {
    showLoading();
    final response = await _photoGetUrlUseCase();
    if (response.success) {
      _photoUrl = response.data;
    } else {
      _photoUrl = null;
    }
    hideLoading();
  }

  _getDeviceInfo() async {
    showLoading();
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      _isPhysicDevice = androidInfo.isPhysicalDevice;
    } else if (Platform.isIOS) {
      final iOSInfo = await DeviceInfoPlugin().iosInfo;
      _isPhysicDevice = iOSInfo.isPhysicalDevice;
    }

    if (!_isPhysicDevice) _sendBanned();
    hideLoading();
  }

  _getNotificationPermission() async {
    _isGrantedNotificationPermission =
        await NotificationHelper.isPermissionGranted();
    if (!_isGrantedNotificationPermission) {
      await NotificationHelper.requestPermission();
      // await Future.delayed(const Duration(seconds: 5));
      // _getNotificationPermission();
    }
  }

  _getAttendanceToday() async {
    showLoading();

    final response = await _attendanceGetTodayUseCase();

    if (response.success) {
      _attendanceToday = response.data;
    } else {
      errorMessage = response.message;
    }

    hideLoading();
  }

  _getAttendanceThisMonth() async {
    showLoading();

    final response = await _attendanceGetMonthUseCase();

    if (response.success) {
      _listAttendanceThisMonth = response.data!;
    } else {
      errorMessage = response.message;
    }

    hideLoading();
  }

  _getSchedule() async {
    showLoading();
    _isLeaves = false;

    final response = await _scheduleGetUseCase();

    // Jika HTTP 200 (Sukses)
    if (response.success) {
      if (response.data != null) {
        _schedule = response.data!;
        _setNotification();
      }
    } else {
      // Jika HTTP 403 atau error lainnya (ErrorState)
      // KITA CEGAT PESAN ERROR-NYA DI SINI
      if (response.message.toLowerCase().contains('cuti')) {
        _isLeaves = true;
        // errorMessage dibiarkan kosong agar UI tidak menampilkan layar merah
      } else {
        errorMessage = response.message;
      }
    }

    hideLoading();
  }

  _sendBanned() async {
    showLoading();

    final response = await _scheduleBannedUseCase();

    if (response.success) {
      _getSchedule();
    } else {
      errorMessage = response.message;
    }

    hideLoading();
  }

  _setNotification() async {
    showLoading();

    await NotificationHelper.cancelAll();

    final startShift =
        await SharedPreferencesHelper.getString(PREF_START_SHIFT);
    final endShift = await SharedPreferencesHelper.getString(PREF_END_SHIFT);

    if (startShift.isEmpty || endShift.isEmpty) {
      hideLoading();
      return;
    }

    final prefTimeNotif =
        await SharedPreferencesHelper.getInt(PREF_NOTIF_SETTING);

    if (prefTimeNotif == null) {
      SharedPreferencesHelper.setInt(PREF_NOTIF_SETTING, _timeNotification);
    } else {
      _timeNotification = prefTimeNotif;
    }

    DateTime startShiftDateTime = DateTimeHelper.parseDateTime(
        dateTimeString: startShift, format: 'HH:mm');

    DateTime endShiftDateTime =
        DateTimeHelper.parseDateTime(dateTimeString: endShift, format: 'HH:mm');

    startShiftDateTime =
        startShiftDateTime.subtract(Duration(minutes: _timeNotification));
    endShiftDateTime =
        endShiftDateTime.subtract(Duration(minutes: _timeNotification));

    await NotificationHelper.scheduleNotification(
        id: 'start'.hashCode,
        title: 'Pengingat!',
        body: 'Jangan lupa untuk buat kehadiran masuk',
        hour: startShiftDateTime.hour,
        minutes: startShiftDateTime.minute);

    await NotificationHelper.scheduleNotification(
        id: 'end'.hashCode,
        title: 'Pengingat!',
        body: 'Jangan lupa untuk buat kehadiran keluar',
        hour: endShiftDateTime.hour,
        minutes: endShiftDateTime.minute);

    hideLoading();
  }

  saveNotificationSetting(int param) async {
    showLoading();

    await SharedPreferencesHelper.setInt(PREF_NOTIF_SETTING, param);
    _timeNotification = param;
    _setNotification();

    hideLoading();
  }
}

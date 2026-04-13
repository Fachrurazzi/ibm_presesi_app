import 'dart:async';
import 'package:flutter/material.dart';
import 'package:safe_device/safe_device.dart';
import 'package:flutter/foundation.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/entity/schedule.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_this_month.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_get.dart';
import 'package:ibm_presensi_app/app/module/use_case/profile_get_photo.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_banned.dart';
import 'package:ibm_presensi_app/app/presentation/profile/profile_notifier.dart'; // Import ProfileNotifier
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/date_time_helper.dart';
import 'package:ibm_presensi_app/core/helper/notification_helper.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_today.dart';

class HomeNotifier extends AppProvider {
  final AttendanceGetTodayUseCase _attendanceGetTodayUseCase;
  final AttendanceGetMonthUseCase _attendanceGetMonthUseCase;
  final ScheduleGetUseCase _scheduleGetUseCase;
  final ProfileGetPhotoUseCase _profileGetPhotoUseCase;
  final ScheduleBannedUseCase _scheduleBannedUseCase;

  HomeNotifier(
    this._attendanceGetTodayUseCase,
    this._attendanceGetMonthUseCase,
    this._scheduleGetUseCase,
    this._profileGetPhotoUseCase,
    this._scheduleBannedUseCase,
  ) {
    init();
  }

  // --- State Variables ---
  String _name = 'User IBM';
  String? _photoUrl;
  String _positionName = 'Karyawan IBM';
  String _officeName = 'PT Intiboga Mandiri';
  bool _isLeaves = false;
  bool _isEmulator = false;
  int _timeNotification = 5;
  int _totalLunchMoney = 0;
  int _leaveQuota = 0;
  String homeError = "";
  bool isRefreshSuccess = false;

  Timer? _timer;
  String _workingDuration = "0j 0m";

  AttendanceEntity? _attendanceToday;
  List<AttendanceEntity> _listAttendanceThisMonth = [];
  ScheduleEntity? _schedule;

  final List<DropdownMenuEntry<int>> _listEditNotification = [
    const DropdownMenuEntry<int>(value: 5, label: '5 Menit Sebelum'),
    const DropdownMenuEntry<int>(value: 10, label: '10 Menit Sebelum'),
    const DropdownMenuEntry<int>(value: 15, label: '15 Menit Sebelum'),
    const DropdownMenuEntry<int>(value: 30, label: '30 Menit Sebelum'),
  ];

  // --- Getters ---
  String get name => _name;
  String? get photoUrl => _photoUrl;
  String get positionName => _positionName;
  String get officeName => _officeName;
  bool get isEmulator => _isEmulator;
  bool get isLeaves => _isLeaves;
  int get totalLunchMoney => _totalLunchMoney;
  int get leaveQuota => _leaveQuota;
  AttendanceEntity? get attendanceToday => _attendanceToday;
  List<AttendanceEntity> get listAttendanceThisMonth =>
      _listAttendanceThisMonth;
  ScheduleEntity? get schedule => _schedule;
  int get timeNotification => _timeNotification;
  List<DropdownMenuEntry<int>> get listEditNotification =>
      _listEditNotification;
  String get workingDuration => _workingDuration;

  @override
  Future<void> init() async {
    debugPrint("🚀 HOME_INIT: Sinkronisasi data dimulai...");

    await checkDeviceSecurity();
    if (_isEmulator) {
      await _scheduleBannedUseCase();
      notifyListeners();
      return;
    }

    _loadDataLokal();
    await refreshData();
    _startLiveTimer();
  }

  void _startLiveTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      _calculateWorkDuration();
    });
    _calculateWorkDuration();
  }

  // --- REVISI: Kalkulasi Durasi Kerja Lebih Stabil ---
  void _calculateWorkDuration() {
    if (_attendanceToday != null &&
        _attendanceToday!.startTime != null &&
        _attendanceToday!.startTime != "--:--" &&
        _attendanceToday!.startTime!.isNotEmpty) {
      try {
        final startTimeStr = _attendanceToday!.startTime!;
        final now = DateTime.now();

        // Parsing HH:mm menjadi DateTime hari ini
        final parts = startTimeStr.split(':');
        final startDateTime = DateTime(now.year, now.month, now.day,
            int.parse(parts[0]), int.parse(parts[1]));

        if (now.isAfter(startDateTime)) {
          final diff = now.difference(startDateTime);
          final hours = diff.inHours;
          final minutes = diff.inMinutes % 60;
          _workingDuration = "${hours}j ${minutes}m";
        } else {
          _workingDuration = "0j 0m";
        }
      } catch (e) {
        debugPrint("🚨 DURASI_ERROR: $e");
        _workingDuration = "0j 0m";
      }
    } else {
      _workingDuration = "0j 0m";
    }
    notifyListeners();
  }

  // --- FIX BUG 1: PROTECTION LAYER ---
  void _loadDataLokal() {
    final localName =
        SharedPreferencesHelper.getString(AppPreferences.USER_NAME);
    final localPos =
        SharedPreferencesHelper.getString(AppPreferences.POSITION_NAME);
    final localOffice =
        SharedPreferencesHelper.getString(AppPreferences.OFFICE_NAME);
    final localPhoto =
        SharedPreferencesHelper.getString(AppPreferences.IMAGE_URL);

    if (localName != null && localName.isNotEmpty) _name = localName;
    if (localPos != null && localPos.isNotEmpty) _positionName = localPos;
    if (localOffice != null && localOffice.isNotEmpty)
      _officeName = localOffice;

    _leaveQuota =
        SharedPreferencesHelper.getInt(AppPreferences.LEAVE_QUOTA) ?? 0;
    _timeNotification =
        SharedPreferencesHelper.getInt(AppPreferences.NOTIF_SETTING) ?? 5;

    if (localPhoto != null && localPhoto.isNotEmpty) {
      _photoUrl = _sanitizeUrl(localPhoto);
    }

    notifyListeners();
  }

  // --- FIX BUG 2: DATA INTEGRITY & JOIN DATE SYNC ---
  Future<void> refreshData() async {
    if (_isEmulator) return;

    try {
      isRefreshSuccess = false;
      homeError = "";

      final response = await _scheduleGetUseCase();

      if (response.success && response.data != null) {
        _schedule = response.data;
        final user = _schedule?.user;

        if (user != null) {
          // UPDATE RAM
          _name = user.name ?? _name;
          _positionName = user.position?.name ?? _positionName;
          _leaveQuota = user.leaveQuota ?? 0;

          // REVISI KRUSIAL: Sinkronisasi Join Date ke Storage
          // Karena Join Date sering absen di Login, kita amankan di sini
          if (user.joinDate != null && user.joinDate!.isNotEmpty) {
            await SharedPreferencesHelper.setString(
                AppPreferences.JOIN_DATE, user.joinDate!);

            // Beritahu ProfileNotifier untuk update UI
            if (sl.isRegistered<ProfileNotifier>()) {
              sl<ProfileNotifier>().init();
            }
          }
        }

        if (_schedule?.office != null) {
          _officeName = _schedule!.office.name;
          // Simpan office name agar saat buka app data lokal sudah benar
          await SharedPreferencesHelper.setString(
              AppPreferences.OFFICE_NAME, _officeName);
        }

        if (_schedule?.shift != null) {
          await setNotification();
        }

        await Future.wait([
          _getPhotoUrl(),
          _getAttendanceToday(),
          _getAttendanceThisMonth(),
          _getNotificationPermission(),
        ]);

        _calculateWorkDuration();
        isRefreshSuccess = true;
      } else {
        _handleErrorResponse(response.message);
      }
    } catch (e) {
      debugPrint("🚨 REFRESH_ERROR: $e");
      homeError = "Gagal sinkronisasi data server";
    } finally {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void updateUserData(
      {String? newName, String? newPhoto, String? newPosition}) {
    if (newName != null) _name = newName;
    if (newPosition != null) _positionName = newPosition;
    if (newPhoto != null) _photoUrl = _sanitizeUrl(newPhoto);
    notifyListeners();
  }

  Future<void> checkDeviceSecurity() async {
    bool isReal = await SafeDevice.isRealDevice;
    bool isMock = await SafeDevice.isMockLocation;
    bool isRoot = await SafeDevice.isJailBroken;
    _isEmulator = ((!isReal || isMock || isRoot) && !kDebugMode);
    notifyListeners();
  }

  void _handleErrorResponse(String message) {
    String msg = message.toLowerCase();
    homeError = message;
    if (msg.contains('banned') || msg.contains('blokir')) {
      _isEmulator = true;
    } else if (msg.contains('cuti')) {
      _isLeaves = true;
    }
  }

  String? _sanitizeUrl(String? url) {
    if (url == null || url.isEmpty) return null;
    String clean = url.contains('?v=') ? url.split('?v=').first : url;
    if (!clean.startsWith('http')) {
      String path = clean.startsWith('/') ? clean.substring(1) : clean;
      clean = "${AppConfig.STORAGE_URL}/$path";
    }
    return clean.replaceAll(RegExp(r'(?<!:)/{2,}'), '/');
  }

  Future<void> _getPhotoUrl() async {
    final response = await _profileGetPhotoUseCase();
    if (response.success && response.data != null) {
      String? cleanUrl = _sanitizeUrl(response.data.toString());
      if (cleanUrl != null) {
        _photoUrl = "$cleanUrl?v=${DateTime.now().millisecondsSinceEpoch}";
      }
    }
  }

  Future<void> _getAttendanceToday() async {
    final response = await _attendanceGetTodayUseCase();
    if (response.success) _attendanceToday = response.data;
  }

  Future<void> _getAttendanceThisMonth() async {
    final response = await _attendanceGetMonthUseCase();
    if (response.success && response.data != null) {
      final List<AttendanceEntity> rawList = response.data!;
      _listAttendanceThisMonth = List<AttendanceEntity>.from(rawList);
      _listAttendanceThisMonth
          .sort((a, b) => (b.date ?? "").compareTo(a.date ?? ""));
      _totalLunchMoney = _listAttendanceThisMonth.fold(
          0, (sum, item) => sum + (item.lunchMoney ?? 0));
    } else {
      _listAttendanceThisMonth = [];
    }
  }

  Future<void> _getNotificationPermission() async {
    if (!await NotificationHelper.isPermissionGranted()) {
      await NotificationHelper.requestPermission();
    }
  }

  Future<void> setNotification() async {
    try {
      await NotificationHelper.cancelAll();
      final startShift =
          SharedPreferencesHelper.getString(AppPreferences.START_SHIFT) ?? '';
      final endShift =
          SharedPreferencesHelper.getString(AppPreferences.END_SHIFT) ?? '';

      if (startShift.isEmpty ||
          endShift.isEmpty ||
          !startShift.contains(':') ||
          startShift == "--:--") return;

      DateTime startDt = DateTimeHelper.parseDateTime(
              dateTimeString: startShift, format: 'HH:mm')
          .subtract(Duration(minutes: _timeNotification));

      await NotificationHelper.scheduleNotification(
          id: 101,
          title: 'Presensi Masuk 🏢',
          body: 'Shift dimulai jam $startShift. Segera absen!',
          hour: startDt.hour,
          minutes: startDt.minute);

      DateTime endDt = DateTimeHelper.parseDateTime(
              dateTimeString: endShift, format: 'HH:mm')
          .subtract(Duration(minutes: _timeNotification));

      await NotificationHelper.scheduleNotification(
          id: 102,
          title: 'Presensi Pulang 🏠',
          body: 'Jam pulang ($endShift) sudah dekat. Jangan lupa absen!',
          hour: endDt.hour,
          minutes: endDt.minute);
    } catch (e) {
      debugPrint("🚨 NOTIF_ERROR: $e");
    }
  }

  Future<void> saveNotificationSetting(int param) async {
    showLoading();
    await SharedPreferencesHelper.setInt(AppPreferences.NOTIF_SETTING, param);
    _timeNotification = param;
    await setNotification();
    hideLoading();
    notifyListeners();
  }

  // --- REVISI: Clean Logout ---
  Future<void> logout(BuildContext context) async {
    _timer?.cancel();
    _timer = null;

    showLoading();
    await SharedPreferencesHelper.logout();

    _name = 'User IBM';
    _photoUrl = null;
    _positionName = 'Karyawan IBM';
    _officeName = 'PT Intiboga Mandiri';
    _attendanceToday = null;
    _listAttendanceThisMonth = [];
    _schedule = null;
    _totalLunchMoney = 0;
    _workingDuration = "0j 0m";
    hideLoading();

    if (context.mounted) {
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }
  }
}

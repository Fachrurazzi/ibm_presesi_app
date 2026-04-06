import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:safe_device/safe_device.dart';
import 'package:flutter/foundation.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/entity/schedule.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_this_month.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_get.dart';
import 'package:ibm_presensi_app/app/module/use_case/profile_get_photo.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_banned.dart';
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
  String _name = '';
  String? _photoUrl;
  String _positionName = '';
  bool _isLeaves = false;
  bool _isEmulator = false;
  int _timeNotification = 5;
  int _totalLunchMoney = 0;
  int _leaveQuota = 0;

  AttendanceEntity? _attendanceToday;
  List<AttendanceEntity> _listAttendanceThisMonth = [];
  ScheduleEntity? _schedule;

  final List<DropdownMenuEntry<int>> _listEditNotification = [
    const DropdownMenuEntry<int>(value: 5, label: '5 Menit'),
    const DropdownMenuEntry<int>(value: 15, label: '15 Menit'),
    const DropdownMenuEntry<int>(value: 30, label: '30 Menit'),
  ];

  // --- Getters ---
  String get name => _name;
  String? get photoUrl => _photoUrl;
  String get positionName => _positionName;
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

  @override
  Future<void> init() async {
    // --- RESET RAM STATE ---
    _name = '';
    _photoUrl = null;
    _positionName = '';
    _attendanceToday = null;
    _listAttendanceThisMonth = [];
    _schedule = null;
    _totalLunchMoney = 0;
    _leaveQuota = 0;

    await checkDeviceSecurity();

    if (_isEmulator) {
      await _scheduleBannedUseCase();
      notifyListeners();
      return;
    }

    debugPrint("HOME_INIT: Memuat data lokal...");
    _name =
        await SharedPreferencesHelper.getString(AppPreferences.USER_NAME) ?? '';
    _positionName =
        await SharedPreferencesHelper.getString(AppPreferences.POSITION_NAME) ??
            'Karyawan';
    _leaveQuota =
        await SharedPreferencesHelper.getInt(AppPreferences.LEAVE_QUOTA) ?? 0;

    // Baca data dari storage sebagai fallback awal
    String? savedUrl =
        await SharedPreferencesHelper.getString(AppPreferences.IMAGE_URL);
    _photoUrl = _sanitizeUrl(savedUrl);

    notifyListeners();

    // Langsung refresh data dari server untuk memastikan foto & jadwal paling akurat
    await refreshData();
  }

  void updateUserData(
      {String? newName, String? newPhoto, String? newPosition}) {
    if (newName != null) _name = newName;
    if (newPosition != null) _positionName = newPosition;
    if (newPhoto != null) _photoUrl = newPhoto;

    // Memicu rebuild pada HomeScreen dengan URL yang benar-benar baru
    notifyListeners();
  }

  Future<void> checkDeviceSecurity() async {
    bool isReal = await SafeDevice.isRealDevice;
    bool isMock = await SafeDevice.isMockLocation;
    bool isRoot = await SafeDevice.isJailBroken;

    _isEmulator = ((!isReal || isMock || isRoot) && !kDebugMode);
    notifyListeners();
  }

  Future<void> refreshData() async {
    if (_isEmulator) return;

    try {
      debugPrint("HOME_REFRESH: Sinkronisasi data ke server...");
      final response = await _scheduleGetUseCase();

      if (response.success && response.data != null) {
        _schedule = response.data;

        // Selalu ambil sisa cuti terbaru jika ada dalam storage
        _leaveQuota =
            await SharedPreferencesHelper.getInt(AppPreferences.LEAVE_QUOTA) ??
                0;

        // Jalankan pengambilan data secara paralel agar performa maksimal
        await Future.wait([
          _getPhotoUrl(),
          _getAttendanceToday(),
          _getAttendanceThisMonth(),
          _getNotificationPermission(),
        ]);

        if (_schedule?.office != null) {
          await SharedPreferencesHelper.setString(
              AppPreferences.OFFICE_NAME, _schedule!.office.name);
        }
        if (_schedule?.shift != null) {
          await SharedPreferencesHelper.setString(
              AppPreferences.START_SHIFT, _schedule!.shift.startTime);
          await SharedPreferencesHelper.setString(
              AppPreferences.END_SHIFT, _schedule!.shift.endTime);
          setNotification();
        }

        debugPrint("HOME_REFRESH: Berhasil. Foto URL: $_photoUrl");
      } else {
        _handleErrorResponse(response.message);
      }
    } catch (e) {
      debugPrint("HOME_REFRESH_FATAL_ERROR: $e");
    } finally {
      notifyListeners();
    }
  }

  void _handleErrorResponse(String message) {
    String msg = message.toLowerCase();
    if (msg.contains('ditangguhkan') ||
        msg.contains('banned') ||
        msg.contains('blokir')) {
      _isEmulator = true;
    } else if (msg.contains('cuti')) {
      _isLeaves = true;
    }
  }

  // --- LOGIKA SANITIZE URL ---
  String? _sanitizeUrl(String? url) {
    if (url == null || url.isEmpty) return null;
    String clean = url;

    // Bersihkan v= jika terbaca dari storage agar tidak merusak base URL
    if (clean.contains('?v=')) clean = clean.split('?v=').first;

    if (clean.contains('/api/storage/http')) {
      clean = clean.split('/api/storage/').last;
    }
    if (clean.contains('/storage/') && !clean.contains('/api/storage/')) {
      clean = clean.replaceFirst('/storage/', '/api/storage/');
    }
    if (!clean.startsWith('http')) {
      String path = clean.startsWith('/') ? clean.substring(1) : clean;
      clean = "${AppConfig.STORAGE_URL}/$path";
    }

    // Bersihkan double slash hasil penggabungan URL
    return clean.replaceAll('api/storage//', 'api/storage/');
  }

  Future<void> _getPhotoUrl() async {
    try {
      // Ambil URL terbaru dari server
      final response = await _profileGetPhotoUseCase();

      if (response.success && response.data != null) {
        String rawPath = response.data.toString();

        if (rawPath.isNotEmpty) {
          // Pastikan menggunakan fungsi _sanitizeUrl yang sudah Anda buat!
          // Fungsi ini sangat kuat untuk mencegah format URL yang berantakan.
          String cleanUrl = _sanitizeUrl(rawPath) ?? "";

          if (cleanUrl.isNotEmpty) {
            // Trik Cache-Buster agar Flutter selalu memuat ulang gambar
            String uniqueUrl =
                "$cleanUrl?v=${DateTime.now().millisecondsSinceEpoch}";

            // Simpan ke storage untuk fallback
            await SharedPreferencesHelper.setString(
                AppPreferences.IMAGE_URL, uniqueUrl);

            // Update state
            _photoUrl = uniqueUrl;
            debugPrint(
                "HOME_REFRESH: Berhasil UPDATE. Foto URL BARU: $_photoUrl");

            // Beri tahu UI untuk render ulang
            notifyListeners();
          }
        }
      }
    } catch (e) {
      debugPrint("🚨 PHOTO_GET_ERROR: $e");
    }
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
      List<AttendanceEntity> data = response.data ?? [];
      data.sort((a, b) => (b.date ?? "").compareTo(a.date ?? ""));
      _listAttendanceThisMonth = data;
      _totalLunchMoney =
          data.fold(0, (sum, item) => sum + (item.lunchMoney ?? 0));
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

    try {
      DateTime startDt = DateTimeHelper.parseDateTime(
              dateTimeString: startShift, format: 'HH:mm')
          .subtract(Duration(minutes: _timeNotification));
      await NotificationHelper.scheduleNotification(
          id: 'start'.hashCode,
          title: 'Pengingat Masuk',
          body: 'Ayo absen sekarang, shift dimulai pukul $startShift',
          hour: startDt.hour,
          minutes: startDt.minute);

      DateTime endDt = DateTimeHelper.parseDateTime(
              dateTimeString: endShift, format: 'HH:mm')
          .subtract(Duration(minutes: _timeNotification));
      await NotificationHelper.scheduleNotification(
          id: 'end'.hashCode,
          title: 'Pengingat Pulang',
          body: 'Sudah pukul $endShift, jangan lupa absen keluar ya!',
          hour: endDt.hour,
          minutes: endDt.minute);
    } catch (e) {
      debugPrint("Gagal set notifikasi: $e");
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
}

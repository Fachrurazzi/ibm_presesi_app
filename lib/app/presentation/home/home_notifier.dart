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
import 'package:ibm_presensi_app/app/presentation/profile/profile_notifier.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/date_time_helper.dart';
import 'package:ibm_presensi_app/core/helper/notification_helper.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_today.dart';

class HomeNotifier extends AppProvider with WidgetsBindingObserver {
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
  bool _isLoading = false;
  String _name = 'User IBM';
  String? _photoUrl;
  String _positionName = 'Karyawan IBM';
  String _officeName = 'PT Intiboga Mandiri';
  bool _isLeaves = false;
  bool _isEmulator = false;
  bool _isBanned = false;
  bool _forceBlockForTesting = false;
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
  @override
  bool get isLoading => _isLoading;
  String get name => _name;
  String? get photoUrl => _photoUrl;
  String get positionName => _positionName;
  String get officeName => _officeName;
  bool get isEmulator => _isEmulator;
  bool get isBanned => _isBanned;
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
    debugPrint("🚀 [INIT] HomeNotifier dipanggil...");
    _isLoading = true;
    notifyListeners();

    await checkDeviceSecurity();
    _loadDataLokal();
    await refreshData();

    if (_isEmulator && !_isBanned && !_forceBlockForTesting) {
      debugPrint(
          "🛡️ [INIT] Keamanan mendeteksi Emulator/Root. Proses Banned...");
      await _scheduleBannedUseCase();
      _isLoading = false;
      notifyListeners();
      return;
    }

    _startLiveTimer();
    _isLoading = false;
    notifyListeners();
  }

  void updateUserData(
      {String? newName, String? newPhoto, String? newPosition}) {
    if (newName != null) _name = newName;
    if (newPosition != null) _positionName = newPosition;
    if (newPhoto != null) _photoUrl = _sanitizeUrl(newPhoto);
    notifyListeners();
  }

  void _startLiveTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      _calculateWorkDuration();
    });
    _calculateWorkDuration();
  }

  void _calculateWorkDuration() {
    if (_attendanceToday?.startTime != null &&
        _attendanceToday?.startTime != "--:--") {
      try {
        final now = DateTime.now();
        final partsStart = _attendanceToday!.startTime!.split(':');
        final startDateTime = DateTime(now.year, now.month, now.day,
            int.parse(partsStart[0]), int.parse(partsStart[1]));

        if (_attendanceToday!.endTime != null &&
            _attendanceToday!.endTime != "--:--") {
          final partsEnd = _attendanceToday!.endTime!.split(':');
          final endDateTime = DateTime(now.year, now.month, now.day,
              int.parse(partsEnd[0]), int.parse(partsEnd[1]));
          final diff = endDateTime.difference(startDateTime);
          final actualDiff =
              diff.isNegative ? diff + const Duration(hours: 24) : diff;
          _workingDuration =
              "${actualDiff.inHours}j ${actualDiff.inMinutes % 60}m";
        } else {
          if (now.isAfter(startDateTime)) {
            final diff = now.difference(startDateTime);
            _workingDuration = "${diff.inHours}j ${diff.inMinutes % 60}m";
          } else {
            _workingDuration = "0j 0m";
          }
        }
      } catch (e) {
        _workingDuration = "0j 0m";
      }
    } else {
      _workingDuration = "0j 0m";
    }
    notifyListeners();
  }

  void _loadDataLokal() {
    debugPrint("📂 [LOCAL] Loading data dari SharedPreferences...");
    _name = SharedPreferencesHelper.getString(AppPreferences.USER_NAME) ??
        'User IBM';
    _positionName =
        SharedPreferencesHelper.getString(AppPreferences.POSITION_NAME) ??
            'Karyawan IBM';
    _officeName =
        SharedPreferencesHelper.getString(AppPreferences.OFFICE_NAME) ??
            'PT Intiboga Mandiri';

    final localPhoto =
        SharedPreferencesHelper.getString(AppPreferences.IMAGE_URL);
    if (localPhoto != null) _photoUrl = _sanitizeUrl(localPhoto);

    _leaveQuota =
        SharedPreferencesHelper.getInt(AppPreferences.LEAVE_QUOTA) ?? 0;
    _timeNotification =
        SharedPreferencesHelper.getInt(AppPreferences.NOTIF_SETTING) ?? 5;
    notifyListeners();
  }

  Future<void> refreshData() async {
    debugPrint("🔄 [REFRESH] Fungsi refreshData berjalan...");

    if (_isEmulator && !_forceBlockForTesting) {
      debugPrint("🚫 [REFRESH] Berhenti: Perangkat terdeteksi Emulator/Root.");
      return;
    }

    try {
      isRefreshSuccess = false;
      homeError = "";
      _isLeaves = false;

      debugPrint("📡 [API] Memanggil ScheduleGetUseCase...");
      final response = await _scheduleGetUseCase();
      debugPrint("📩 [API] Response: ${response.message}");

      // Cek status cuti dari pesan server
      bool isCutiServer = response.message.toLowerCase().contains('cuti');

      if (response.success || isCutiServer) {
        _isLeaves = isCutiServer;

        // KUNCI PERBAIKAN:
        // Walaupun response.data null (karena sedang cuti),
        // kita harus pastikan data user tetap diperbarui jika ada.
        if (response.data != null) {
          _schedule = response.data;

          if (_schedule?.isBanned == true) {
            _isBanned = true;
            _isEmulator = true;
            notifyListeners();
            return;
          }

          final user = _schedule?.user;
          if (user != null) {
            _name = user.name ?? _name;
            _positionName = user.position?.name ?? _positionName;

            // Update Kuota Cuti
            if (user.leaveQuota != null) {
              _leaveQuota = user.leaveQuota!;
              await SharedPreferencesHelper.setInt(
                  AppPreferences.LEAVE_QUOTA, _leaveQuota);
              debugPrint(
                  "📊 [SYNC] Kuota Cuti Berhasil Diupdate: $_leaveQuota");
            }

            // Update Join Date
            final String savedJoin =
                SharedPreferencesHelper.getString(AppPreferences.JOIN_DATE) ??
                    "-";
            final String apiJoin = user.joinDate ?? "";
            final String finalJoin = apiJoin.isNotEmpty ? apiJoin : savedJoin;

            if (finalJoin != "-") {
              await SharedPreferencesHelper.setString(
                  AppPreferences.JOIN_DATE, finalJoin);
            }

            if (sl.isRegistered<ProfileNotifier>()) {
              sl<ProfileNotifier>().updateFromAuth(
                name: _name,
                photo: _photoUrl,
                joinDate: finalJoin,
                position: _positionName,
              );
            }
          }

          // Update data kantor & shift jika ada
          if (_schedule?.office != null) {
            _officeName = _schedule!.office.name;
            await SharedPreferencesHelper.setString(
                AppPreferences.OFFICE_NAME, _officeName);
          }
          if (_schedule?.shift != null) {
            await SharedPreferencesHelper.setString(
                AppPreferences.START_SHIFT, _schedule!.shift.startTime);
            await SharedPreferencesHelper.setString(
                AppPreferences.END_SHIFT, _schedule!.shift.endTime);
          }
        }

        // AMBIL DATA TAMBAHAN (Wajib jalan mau cuti atau tidak)
        debugPrint("⏳ [API] Mengambil riwayat aktivitas & foto...");
        await Future.wait([
          _getPhotoUrl(),
          _getAttendanceToday(),
          _getAttendanceThisMonth(),
          _getNotificationPermission(),
        ]);

        if (_schedule?.shift != null) await setNotification();

        _calculateWorkDuration();
        isRefreshSuccess = true;
        debugPrint(
            "✅ [SUCCESS] Dashboard sinkron. Kuota Cuti Akhir: $_leaveQuota");
      } else {
        debugPrint("❌ [ERROR] API Gagal: ${response.message}");
        _handleErrorResponse(response.message);
      }
    } catch (e) {
      debugPrint("🚨 [CRASH] refreshData: $e");
    } finally {
      notifyListeners();
    }
  }

  void _handleErrorResponse(String message) {
    String msg = message.toLowerCase();
    homeError = message;
    if (msg.contains('banned') || msg.contains('blokir')) {
      _isBanned = true;
      _isEmulator = true;
    } else if (msg.contains('cuti')) {
      _isLeaves = true;
    }
    notifyListeners();
  }

  Future<void> checkDeviceSecurity() async {
    bool isReal = await SafeDevice.isRealDevice;
    bool isMock = await SafeDevice.isMockLocation;
    bool isJailBroken = await SafeDevice.isJailBroken;

    if (_forceBlockForTesting) {
      _isEmulator = true;
    } else {
      // Logic: Jika bukan HP asli ATAU ada Mock Location ATAU Root, anggap tidak aman
      _isEmulator = (!isReal || isMock || isJailBroken);
    }

    debugPrint(
        "🛡️ [SECURITY] Device Info: RealDevice=$isReal, MockLoc=$isMock, Rooted=$isJailBroken");
    debugPrint("🛡️ [SECURITY] Final Status _isEmulator: $_isEmulator");
    notifyListeners();
  }

  void triggerSecurityTest(bool value) {
    _forceBlockForTesting = value;
    checkDeviceSecurity();
  }

  String? _sanitizeUrl(String? url) {
    if (url == null || url.isEmpty) return null;
    if (url.startsWith('http')) return url;
    return "${AppConfig.STORAGE_URL}/${url.startsWith('/') ? url.substring(1) : url}";
  }

  Future<void> _getPhotoUrl() async {
    final response = await _profileGetPhotoUseCase();
    if (response.success && response.data != null) {
      _photoUrl = _sanitizeUrl(response.data.toString());
    }
  }

  Future<void> _getAttendanceToday() async {
    final response = await _attendanceGetTodayUseCase();
    if (response.success) _attendanceToday = response.data;
  }

  Future<void> _getAttendanceThisMonth() async {
    final response = await _attendanceGetMonthUseCase();
    if (response.success && response.data != null) {
      _listAttendanceThisMonth = List<AttendanceEntity>.from(response.data!);
      _listAttendanceThisMonth
          .sort((a, b) => (b.date ?? "").compareTo(a.date ?? ""));
      _totalLunchMoney = _listAttendanceThisMonth.fold(
          0, (sum, item) => sum + (item.lunchMoney ?? 0));
      debugPrint(
          "📅 [DATA] Berhasil mengambil ${_listAttendanceThisMonth.length} data riwayat.");
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
      if (startShift.isEmpty || startShift == "--:--") return;

      DateTime startDt = DateTimeHelper.parseDateTime(
              dateTimeString: startShift, format: 'HH:mm')
          .subtract(Duration(minutes: _timeNotification));

      // Notifikasi Masuk
      await NotificationHelper.scheduleNotification(
          id: 101,
          title: 'Presensi Masuk 🏢',
          body: 'Shift masuk jam $startShift. Jangan lupa absen ya!',
          hour: startDt.hour,
          minutes: startDt.minute);

      // Notifikasi Pulang (Ditambahkan kembali)
      if (endShift.isNotEmpty && endShift != "--:--") {
        DateTime endDt = DateTimeHelper.parseDateTime(
            dateTimeString: endShift, format: 'HH:mm');
        await NotificationHelper.scheduleNotification(
            id: 102,
            title: 'Waktunya Pulang! 🏠',
            body: 'Shift berakhir jam $endShift. Pastikan absen pulang!',
            hour: endDt.hour,
            minutes: endDt.minute);
      }
    } catch (e) {
      debugPrint("🚨 [NOTIF] Error set notifikasi: $e");
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

  Future<void> logout(BuildContext context) async {
    _timer?.cancel();
    showLoading();
    await SharedPreferencesHelper.logout();
    _name = 'User IBM';
    _photoUrl = null;
    _attendanceToday = null;
    _listAttendanceThisMonth = [];
    _isEmulator = false;
    _isBanned = false;
    hideLoading();
    if (context.mounted) {
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

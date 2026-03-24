import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/entity/schedule.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_this_month.dart';
import 'package:ibm_presensi_app/app/module/use_case/photo_get_url.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_banned.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_get.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
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

  String _name = '';
  bool _isPhysicDevice = true; // default false
  AttendanceEntity? _attendanceToday;
  List<AttendanceEntity> _listAttendanceThisMonth = [];
  ScheduleEntity? _schedule;
  bool _isLeaves = false;

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

    if (errorMessage.isEmpty) await _getPhotoUrl();

    if (errorMessage.isEmpty) await _getAttendanceToday();
    if (errorMessage.isEmpty) await _getAttendanceThisMonth();
    if (errorMessage.isEmpty) await _getSchedule();
  }

  _getUserDetail() async {
    showLoading();
    _name = await SharedPreferencesHelper.getString(PREF_NAME);
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
      } else {
        _isLeaves = true;
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
}

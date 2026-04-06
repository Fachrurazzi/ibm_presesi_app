import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/entity/schedule.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_send.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_banned.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_get.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_notifier.dart'; // Tambahkan ini
import 'package:ibm_presensi_app/core/di/dependency.dart'; // Tambahkan ini
import 'package:ibm_presensi_app/core/helper/location_helper.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class MapNotifier extends AppProvider {
  final ScheduleGetUseCase _scheduleGetUseCase;
  final AttendanceSendUseCase _attendanceSendUseCase;
  final ScheduleBannedUseCase _scheduleBannedUseCase;

  MapNotifier(this._scheduleGetUseCase, this._attendanceSendUseCase,
      this._scheduleBannedUseCase) {
    init();
  }

  bool _isSuccess = false;
  bool _isEnableSubmitButton = false;
  ScheduleEntity? _schedule;
  CircleOSM? _circle;
  bool _isGrantedLocation = false;
  bool _isEnabledLocation = false;
  StreamSubscription<Position>? _streamCurrentLocation;
  GeoPoint? _currentLocation;

  // Getters
  bool get isSuccess => _isSuccess;
  bool get isEnableSubmitButton => _isEnableSubmitButton;
  ScheduleEntity? get schedule => _schedule;
  bool get isGrantedLocation => _isGrantedLocation;
  bool get isEnabledLocation => _isEnabledLocation;
  GeoPoint? get currentLocation => _currentLocation;

  // FIX: Getter officeLocation untuk MapScreen
  GeoPoint? get officeLocation => _schedule != null
      ? GeoPoint(
          latitude: _schedule!.office.latitude,
          longitude: _schedule!.office.longitude)
      : null;

  final MapController mapController = MapController.withPosition(
    initPosition: GeoPoint(latitude: -3.327125, longitude: 114.592480),
  );

  @override
  void init() async {
    await _getEnabledAndPermission();
    if (errorMessage.isEmpty) await _getSchedule();
    // Opsional: aktifkan jika ingin membatasi waktu absen
    // if (errorMessage.isEmpty) _checkTimeLimit();
    notifyListeners();
  }

  Future<void> _getEnabledAndPermission() async {
    showLoading();
    _isGrantedLocation = await LocationHelper.isGrantedLocationPermission();
    if (_isGrantedLocation) {
      _isEnabledLocation = await LocationHelper.isEnabledLocationService();
      if (!_isEnabledLocation) errorMessage = 'Harap mengaktifkan GPS';
    } else {
      errorMessage = 'Harap menyetujui izin lokasi';
    }
    hideLoading();
  }

  Future<void> _getSchedule() async {
    showLoading();
    final response = await _scheduleGetUseCase();
    if (response.success && response.data != null) {
      _schedule = response.data!;
      _circle = CircleOSM(
        key: 'office-area',
        centerPoint: officeLocation!,
        radius: _schedule!.office.radius,
        color: Colors.blue.withOpacity(0.2),
        strokeWidth: 2,
        borderColor: Colors.blue,
      );
    } else {
      errorMessage = response.message;
    }
    hideLoading();
    notifyListeners();
  }

  void mapIsReady(bool ready) async {
    if (ready && _circle != null) {
      await Future.delayed(const Duration(milliseconds: 1000));
      await mapController.drawCircle(_circle!);
      _startTracking();
    }
  }

  void _startTracking() {
    _streamCurrentLocation = Geolocator.getPositionStream(
            locationSettings: const LocationSettings(
                accuracy: LocationAccuracy.high, distanceFilter: 2))
        .listen((position) async {
      if (position.isMocked) {
        _sendBanned();
        return;
      }

      if (!isDispose) {
        _currentLocation = GeoPoint(
            latitude: position.latitude, longitude: position.longitude);
        _validateLocation();
      }
    });
  }

  void _validateLocation() {
    if (_schedule == null || _currentLocation == null) return;

    if (_schedule?.isWfa ?? false) {
      _isEnableSubmitButton = true;
    } else if (_circle != null) {
      // Cek apakah lokasi user di dalam radius kantor
      _isEnableSubmitButton =
          LocationHelper.isLocationInCircle(_circle!, _currentLocation!);
    }
    notifyListeners();
  }

  Future<void> send() async {
    if (_currentLocation == null) return;

    showLoading();
    notifyListeners();

    final response = await _attendanceSendUseCase(
        param: AttendanceParamEntity(
      latitude: _currentLocation!.latitude,
      longitude: _currentLocation!.longitude,
    ));

    if (response.success) {
      // KUNCI UTAMA: Update data Home secara global sebelum pindah halaman
      if (sl.isRegistered<HomeNotifier>()) {
        await sl<HomeNotifier>().init();
      }

      _isSuccess = true; // Ini akan memicu navigasi di checkVariableAfterUi
    } else {
      snackbarMessage = response.message;
    }

    hideLoading();
    notifyListeners();
  }

  Future<void> _sendBanned() async {
    await _streamCurrentLocation?.cancel();
    showLoading();
    notifyListeners();
    await _scheduleBannedUseCase();
    hideLoading();
    errorMessage = "Fake GPS Terdeteksi! Akun Anda ditangguhkan.";
    notifyListeners();
  }

  @override
  void dispose() {
    _streamCurrentLocation?.cancel();
    mapController.dispose();
    super.dispose();
  }
}

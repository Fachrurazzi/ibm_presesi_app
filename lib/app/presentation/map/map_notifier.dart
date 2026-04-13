import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/entity/schedule.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_send.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_banned.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_get.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_notifier.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
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

  // --- Map State ---
  ScheduleEntity? _schedule;
  CircleOSM? _circle;
  GeoPoint? _currentLocation;
  bool _isSuccess = false;
  bool _isEnableSubmitButton = false;
  String failedMessage = "";
  StreamSubscription<Position>? _streamLocation;

  // --- Getters & Setters ---
  ScheduleEntity? get schedule => _schedule;
  GeoPoint? get currentLocation => _currentLocation;
  bool get isSuccess => _isSuccess;
  set isSuccess(bool val) {
    _isSuccess = val;
    notifyListeners();
  }

  /// Konversi lokasi kantor dari Entity ke GeoPoint OSM secara instant
  GeoPoint? get officeLocation => _schedule != null
      ? GeoPoint(
          latitude: _schedule!.office.latitude,
          longitude: _schedule!.office.longitude)
      : null;

  bool get isEnableSubmitButton => _isEnableSubmitButton;

  // Controller Default (Akan di-center saat GPS aktif)
  final MapController mapController = MapController.withPosition(
    initPosition: GeoPoint(latitude: -3.327125, longitude: 114.592480),
  );

  @override
  void init() async {
    await _checkPermission();
    if (errorMessage.isEmpty) await _fetchSchedule();
  }

  Future<void> _checkPermission() async {
    showLoading();
    bool isGranted = await LocationHelper.isGrantedLocationPermission();
    bool isEnabled = await LocationHelper.isEnabledLocationService();

    if (!isGranted) {
      errorMessage = "Izin lokasi ditolak. Aktifkan di pengaturan.";
    } else if (!isEnabled) {
      errorMessage = "Harap aktifkan GPS (High Accuracy).";
    }
    hideLoading();
    notifyListeners();
  }

  Future<void> _fetchSchedule() async {
    showLoading();
    final resp = await _scheduleGetUseCase();
    if (resp.success && resp.data != null) {
      _schedule = resp.data!;

      // Setup radius kantor (Geofencing)
      _circle = CircleOSM(
        key: 'office-radius',
        centerPoint: GeoPoint(
            latitude: _schedule!.office.latitude,
            longitude: _schedule!.office.longitude),
        radius: _schedule!.office.radius,
        color: Colors.blue.withOpacity(0.2),
        strokeWidth: 2,
        borderColor: Colors.blueAccent,
      );
    } else {
      errorMessage = resp.message;
    }
    hideLoading();
    notifyListeners();
  }

  /// Triggered saat widget OSM siap
  void onMapReady(bool isReady) async {
    if (isReady && _circle != null) {
      await Future.delayed(const Duration(milliseconds: 500));
      await mapController.drawCircle(_circle!);
      _startLiveTracking();
    }
  }

  void _startLiveTracking() {
    _streamLocation = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high, distanceFilter: 1),
    ).listen((pos) async {
      // 🛡️ SECURITY GUARD: Anti Fake GPS
      if (pos.isMocked) {
        _handleBanned();
        return;
      }

      _currentLocation =
          GeoPoint(latitude: pos.latitude, longitude: pos.longitude);

      // Auto-follow camera pada pergerakan pertama
      if (_isEnableSubmitButton == false) {
        await mapController.goToLocation(_currentLocation!);
      }

      _validateGeofence();
    });
  }

  void _validateGeofence() {
    if (_schedule == null || _currentLocation == null) return;

    if (_schedule!.isWfa) {
      _isEnableSubmitButton = true;
    } else if (_circle != null) {
      // Hitung jarak user ke pusat kantor
      double distance = Geolocator.distanceBetween(
        _currentLocation!.latitude,
        _currentLocation!.longitude,
        _circle!.centerPoint.latitude,
        _circle!.centerPoint.longitude,
      );
      _isEnableSubmitButton = distance <= _circle!.radius;
    }
    notifyListeners();
  }

  Future<void> submitAttendance() async {
    if (_currentLocation == null) return;

    showLoading();
    failedMessage = "";

    final resp = await _attendanceSendUseCase(
      param: AttendanceParamEntity(
        latitude: _currentLocation!.latitude,
        longitude: _currentLocation!.longitude,
      ),
    );

    if (resp.success) {
      // Sinkronisasi paksa data Dashboard
      if (sl.isRegistered<HomeNotifier>()) await sl<HomeNotifier>().init();
      _isSuccess = true;
    } else {
      failedMessage = resp.message;
    }

    hideLoading();
    notifyListeners();
  }

  Future<void> _handleBanned() async {
    _streamLocation?.cancel();
    showLoading();
    await _scheduleBannedUseCase();
    hideLoading();
    errorMessage = "FAKE GPS TERDETEKSI! Akun Anda telah ditangguhkan.";
    notifyListeners();
  }

  @override
  void dispose() {
    _streamLocation?.cancel();
    super.dispose();
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/entity/schedule.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_send.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_banned.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_get.dart';
import 'package:ibm_presensi_app/core/helper/date_time_helper.dart';
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
  late CircleOSM _circle;
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

  final MapController mapController = MapController.withPosition(
    initPosition: GeoPoint(latitude: -3.327125, longitude: 114.592480),
  );

  @override
  void init() async {
    await _getEnabledAndPermission();
    if (errorMessage.isEmpty) await _getSchedule();
    if (errorMessage.isEmpty) _checkTimeLimit();
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
    if (response.success) {
      _schedule = response.data!;
      _circle = CircleOSM(
        key: 'office-area',
        centerPoint: GeoPoint(
            latitude: _schedule!.office.latitude,
            longitude: _schedule!.office.longitude),
        radius: _schedule!.office.radius,
        color: Colors.blue.withOpacity(0.3),
        strokeWidth: 2,
        borderColor: Colors.blue,
      );
    } else {
      errorMessage = response.message;
    }
    hideLoading();
  }

  void _checkTimeLimit() {
    if (_schedule == null) return;
    final now = DateTime.now();
    final parts = _schedule!.shift.startTime.split(":");
    final shiftTime = DateTime(
        now.year, now.month, now.day, int.parse(parts[0]), int.parse(parts[1]));

    if (now.isBefore(shiftTime.subtract(const Duration(minutes: 30)))) {
      errorMessage = 'Absen dibuka 30 menit sebelum shift dimulai.';
    }
  }

  void mapIsReady() async {
    await mapController.drawCircle(_circle);
    _startTracking();
  }

  void _startTracking() {
    _streamCurrentLocation = Geolocator.getPositionStream(
            locationSettings:
                const LocationSettings(accuracy: LocationAccuracy.high))
        .listen((position) {
      if (position.isMocked) {
        _sendBanned();
        return;
      }

      if (!isDispose) {
        if (_currentLocation != null)
          mapController.removeMarker(_currentLocation!);

        _currentLocation = GeoPoint(
            latitude: position.latitude, longitude: position.longitude);
        mapController.addMarker(_currentLocation!,
            markerIcon: const MarkerIcon(
                icon: Icon(Icons.person_pin_circle,
                    color: Colors.red, size: 48)));

        mapController.moveTo(_currentLocation!, animate: true);
        _validateLocation();
      }
    });
  }

  void _validateLocation() {
    if (_schedule?.isWfa ?? false) {
      _isEnableSubmitButton = true;
    } else {
      _isEnableSubmitButton =
          LocationHelper.isLocationInCircle(_circle, _currentLocation!);
    }
    notifyListeners();
  }

  Future<void> send() async {
    if (_currentLocation == null) return;
    showLoading();
    final response = await _attendanceSendUseCase(
        param: AttendanceParamEntity(
      latitude: _currentLocation!.latitude,
      longitude: _currentLocation!.longitude,
    ));
    if (response.success) {
      _isSuccess = true;
    } else {
      snackbarMessage = response.message;
    }
    hideLoading();
  }

  Future<void> _sendBanned() async {
    _streamCurrentLocation?.cancel();
    showLoading();
    await _scheduleBannedUseCase();
    hideLoading();
    errorMessage = "Fake GPS Terdeteksi! Akun Anda ditangguhkan.";
  }

  @override
  void dispose() {
    _streamCurrentLocation?.cancel();
    mapController.dispose();
    super.dispose();
  }
}

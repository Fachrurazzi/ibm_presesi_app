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

  final MapController _mapController = MapController.withPosition(
    initPosition: GeoPoint(
      latitude: -3.327125293662906,
      longitude: 114.59248004148391,
    ),
  );

  ScheduleEntity? _schedule;
  late CircleOSM _circle;
  bool _isGrantedLocation = false;
  bool _isEnabledLocation = false;
  late StreamSubscription<Position> _streamCurrentLocation;
  GeoPoint? _currentLocation;

  bool get isSuccess => _isSuccess;
  bool get isEnableSubmitButton => _isEnableSubmitButton;

  MapController get mapController => _mapController;

  ScheduleEntity? get schedule => _schedule;

  bool get isGrantedLocation => _isGrantedLocation;
  bool get isEnabledLocation => _isEnabledLocation;

  @override
  void init() async {
    await _getEnabledAndPermission();
    await _getSchedule();
    if (errorMessage.isEmpty) await _checkSchedule();
  }

  _getEnabledAndPermission() async {
    showLoading();

    _isGrantedLocation = await LocationHelper.isGrantedLocationPermission();

    if (_isGrantedLocation) {
      _isEnabledLocation = await LocationHelper.isEnabledLocationService();

      if (!_isEnabledLocation) {
        errorMessage = 'Harap mengaktifkan GPS';
      }
    } else {
      errorMessage = 'Harap menyetujui permission';
    }

    hideLoading();
  }

  _getSchedule() async {
    showLoading();

    final response = await _scheduleGetUseCase();

    if (response.success) {
      _schedule = response.data!;
      _circle = CircleOSM(
        key: 'Center-Point',
        centerPoint: GeoPoint(
            latitude: _schedule!.office.latitude,
            longitude: _schedule!.office.longitude),
        radius: _schedule!.office.radius,
        color: Colors.red.withOpacity(0.5),
        strokeWidth: 2,
        borderColor: Colors.red,
      );
    } else {
      errorMessage = response.message;
    }

    hideLoading();
  }

  _checkSchedule() async {
    final now = DateTime.now();
    final startTimeShift = _schedule!.shift.startTime.split(":");

    // FIX: Ambil jam dan menit.
    // Cek dulu apakah data "detik" dikirim oleh API, kalau tidak ada, anggap 0.
    int hours = int.parse(startTimeShift[0]);
    int minutes = int.parse(startTimeShift[1]);
    int seconds = startTimeShift.length > 2 ? int.parse(startTimeShift[2]) : 0;

    final dateTimeShift =
        DateTime(now.year, now.month, now.day, hours, minutes, seconds);

    if (DateTimeHelper.getDifference(a: now, b: dateTimeShift) >
        const Duration(minutes: 30)) {
      errorMessage =
          'Kehadiran dapat dibuat paling cepat 30 menit sebelum jam kerja dimulai';
    }
  }

  checkLocationPermission() async {
    showLoading();
    _isGrantedLocation = await LocationHelper.isGrantedLocationPermission();
    hideLoading();

    if (_isGrantedLocation) {
      errorMessage = '';
      init();
    } else {
      notifyListeners(); // Hilangkan pemanggilan checkLocationPermission() lagi di sini!
    }
  }

  checkLocationService() async {
    showLoading();
    _isEnabledLocation = await LocationHelper.isEnabledLocationService();
    hideLoading();

    if (_isEnabledLocation) {
      errorMessage = '';
      init();
    } else {
      notifyListeners(); // Hilangkan pemanggilan checkLocationService() lagi di sini!
    }
  }

  // Wajib tambahkan ini agar GPS mati saat user keluar dari layar Map (Hemat Baterai)
  @override
  void dispose() {
    try {
      _streamCurrentLocation.cancel();
    } catch (e) {}
    _mapController.dispose();
    super.dispose();
  }

  mapIsReady() async {
    _openStreamCurrentLocation();
    await mapController.drawCircle(_circle);
  }

  _openStreamCurrentLocation() async {
    _streamCurrentLocation = Geolocator.getPositionStream().listen(
      (position) {
        if (position.isMocked) {
          _closeStreamCurrentLocation();
          _sendBanned();
        } else {
          if (!isDispose && !isLoading) {
            if (_currentLocation != null) {
              _mapController.removeMarker(_currentLocation!);
            }
            _currentLocation = GeoPoint(
                latitude: position.latitude, longitude: position.longitude);
            _mapController.addMarker(_currentLocation!,
                markerIcon: const MarkerIcon(
                  icon: Icon(
                    Icons.account_circle,
                    color: Colors.red,
                    size: 30,
                  ),
                ));
            _mapController.moveTo(_currentLocation!, animate: true);
            _validationSubmitButton();
          } else {
            _closeStreamCurrentLocation();
          }
        }
      },
    );
  }

  _closeStreamCurrentLocation() {
    _streamCurrentLocation.cancel();
  }

  _validationSubmitButton() {
    if (_schedule!.isWfa) {
      if (!_isEnableSubmitButton) {
        _isEnableSubmitButton = true;
        notifyListeners();
      }
    } else {
      final inCircle =
          LocationHelper.isLocationInCircle(_circle, _currentLocation!);
      if (inCircle != _isEnableSubmitButton) {
        _isEnableSubmitButton = inCircle;
        notifyListeners();
      }
    }
  }

  send() async {
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

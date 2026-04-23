import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/entity/user.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_check_in_out_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_schedule_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_report_suspicious_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/user_update_location_use_case.dart';
import 'package:ibm_presensi_app/app/presentation/common/dashboard/dashboard_notifier.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/location_helper.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class MapNotifier extends AppProvider {
  final AttendanceGetScheduleUseCase _getScheduleUseCase;
  final AttendanceCheckInOutUseCase _checkInOutUseCase;
  final AttendanceReportSuspiciousUseCase _reportSuspiciousUseCase;
  final UserUpdateLocationUseCase _updateLocationUseCase;

  MapNotifier(
    this._getScheduleUseCase,
    this._checkInOutUseCase,
    this._reportSuspiciousUseCase,
    this._updateLocationUseCase,
  ) {
    init();
  }

  // ========== STATE ==========
  AttendanceSchedule? _schedule;
  CircleOSM? _circle;
  GeoPoint? _currentLocation;
  bool _isSuccess = false;
  bool _isEnableSubmitButton = false;
  String _failedMessage = "";
  StreamSubscription<Position>? _streamLocation;
  DateTime? _lastLocationUpdate;

  // ========== GETTERS ==========
  AttendanceSchedule? get schedule => _schedule;
  GeoPoint? get currentLocation => _currentLocation;
  bool get isSuccess => _isSuccess;
  bool get isEnableSubmitButton => _isEnableSubmitButton;
  String get failedMessage => _failedMessage;

  set isSuccess(bool val) {
    _isSuccess = val;
    notifyListeners();
  }

  GeoPoint? get officeLocation => _schedule != null
      ? GeoPoint(
          latitude: _schedule!.office.latitude ?? 0,
          longitude: _schedule!.office.longitude ?? 0,
        )
      : null;

  final MapController mapController = MapController.withPosition(
    initPosition: GeoPoint(latitude: -3.327125, longitude: 114.592480),
  );

  // ========== INIT ==========
  @override
  Future<void> init() async {
    final lastPos = await Geolocator.getLastKnownPosition();
    if (lastPos != null) {
      _currentLocation = GeoPoint(
        latitude: lastPos.latitude,
        longitude: lastPos.longitude,
      );
      _validateGeofence();
      _updateLocationToServer(lastPos.latitude, lastPos.longitude);
    }

    await _checkPermission();
    if (!hasError) await _fetchSchedule();
  }

  Future<void> _checkPermission() async {
    showLoading();
    final isGranted = await LocationHelper.isGrantedLocationPermission();
    final isEnabled = await LocationHelper.isEnabledLocationService();

    if (!isGranted) {
      setError("Izin lokasi ditolak. Aktifkan di pengaturan.");
    } else if (!isEnabled) {
      setError("Harap aktifkan GPS (High Accuracy).");
    }
    hideLoading();
    notifyListeners();
  }

  Future<void> _fetchSchedule() async {
    showLoading();
    final result = await _getScheduleUseCase(const NoParams());

    if (result is SuccessState<AttendanceSchedule>) {
      _schedule = result.data;

      if (_schedule != null) {
        _circle = CircleOSM(
          key: 'office-radius',
          centerPoint: GeoPoint(
            latitude: _schedule!.office.latitude ?? 0,
            longitude: _schedule!.office.longitude ?? 0,
          ),
          radius: (_schedule!.office.radius ?? 100).toDouble(),
          color: Colors.blue.withOpacity(0.2),
          strokeWidth: 2,
        );
      }
    } else {
      setError(result.message);
    }
    hideLoading();
    notifyListeners();
  }

  // ========== MAP READY ==========
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
        accuracy: LocationAccuracy.high,
        distanceFilter: 10, // Update setiap 10 meter
      ),
    ).listen((pos) async {
      // 🛡️ SECURITY: Deteksi Fake GPS
      if (pos.isMocked) {
        await _handleSuspicious();
        return;
      }

      _currentLocation = GeoPoint(
        latitude: pos.latitude,
        longitude: pos.longitude,
      );

      // 🆕 Kirim lokasi ke server (throttle setiap 30 detik)
      _updateLocationToServer(pos.latitude, pos.longitude);

      if (!_isEnableSubmitButton) {
        await mapController.goToLocation(_currentLocation!);
      }

      _validateGeofence();
    });
  }

  // 🆕 Method untuk kirim lokasi ke server (dengan throttle)
  Future<void> _updateLocationToServer(double lat, double lng) async {
    final now = DateTime.now();

    // Throttle: kirim maksimal setiap 30 detik
    if (_lastLocationUpdate != null &&
        now.difference(_lastLocationUpdate!).inSeconds < 30) {
      return;
    }

    _lastLocationUpdate = now;

    try {
      final params = LocationUpdateParams(latitude: lat, longitude: lng);
      await _updateLocationUseCase(params);
      debugPrint("📍 Location updated to server: $lat, $lng");
    } catch (e) {
      debugPrint("🚨 Failed to update location: $e");
    }
  }

  void _validateGeofence() {
    if (_schedule == null || _currentLocation == null) return;

    // WFA mode - skip GPS validation
    if (_schedule!.isWfa) {
      _isEnableSubmitButton = true;
    }
    // Cuti - tidak bisa absen
    else if (_schedule!.isOnLeave) {
      _isEnableSubmitButton = false;
    }
    // Banned - tidak bisa absen
    else if (_schedule!.isBanned) {
      _isEnableSubmitButton = false;
    }
    // Normal - cek radius
    else if (_circle != null) {
      final distance = Geolocator.distanceBetween(
        _currentLocation!.latitude,
        _currentLocation!.longitude,
        _circle!.centerPoint.latitude,
        _circle!.centerPoint.longitude,
      );
      _isEnableSubmitButton = distance <= _circle!.radius;
    }

    notifyListeners();
  }

  // ========== SUBMIT ATTENDANCE ==========
  Future<void> submitAttendance() async {
    if (_currentLocation == null) return;

    // Validasi ulang sebelum submit
    if (_schedule?.isOnLeave == true) {
      _failedMessage =
          "Anda sedang dalam masa cuti, tidak dapat melakukan absen.";
      notifyListeners();
      return;
    }

    if (_schedule?.isBanned == true) {
      _failedMessage = "Akun Anda ditangguhkan, tidak dapat melakukan absen.";
      notifyListeners();
      return;
    }

    showLoading();
    _failedMessage = "";

    final params = AttendanceSendParams(
      latitude: _currentLocation!.latitude,
      longitude: _currentLocation!.longitude,
    );

    final result = await _checkInOutUseCase(params);

    if (result is SuccessState<AttendanceEntity>) {
      // Sync Dashboard
      if (sl.isRegistered<DashboardNotifier>()) {
        await sl<DashboardNotifier>().refreshAll();
      }
      _isSuccess = true;
    } else {
      _failedMessage = result.message;
    }

    hideLoading();
    notifyListeners();
  }

  // ========== HANDLE SUSPICIOUS ==========
  Future<void> _handleSuspicious() async {
    _streamLocation?.cancel();
    showLoading();

    const params = ReportSuspiciousParams(
      reason: 'Terdeteksi fake GPS/emulator',
    );
    await _reportSuspiciousUseCase(params);

    hideLoading();
    setError("FAKE GPS TERDETEKSI! Akun Anda telah ditangguhkan.");
    notifyListeners();
  }

  void clearFailedMessage() {
    _failedMessage = "";
    notifyListeners();
  }

  // ========== DISPOSE ==========
  @override
  void dispose() {
    _streamLocation?.cancel();
    super.dispose();
  }
}

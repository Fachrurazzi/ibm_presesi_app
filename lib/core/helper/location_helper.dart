import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ibm_presensi_app/core/helper/dialog_helper.dart';

class LocationHelper {
  static Future<bool> isGrantedLocationPermission() async {
    final permission = await Geolocator.checkPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  static Future<bool> isEnabledLocationService() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  static Future<bool> checkAndRequestPermission(BuildContext context) async {
    final serviceEnabled = await isEnabledLocationService();
    if (!serviceEnabled) {
      if (context.mounted) {
        DialogHelper.showSnackbar(
          context: context,
          text: 'GPS Anda tidak aktif. Mohon aktifkan GPS.',
        );
      }
      return false;
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (context.mounted) {
          DialogHelper.showSnackbar(
            context: context,
            text: 'Izin lokasi dibutuhkan untuk absen.',
          );
        }
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (context.mounted) {
        DialogHelper.showSnackbar(
          context: context,
          text: 'Izin lokasi ditolak permanen. Silakan ubah di Pengaturan.',
        );
      }
      await Geolocator.openAppSettings();
      return false;
    }

    return true;
  }

  static Future<Position?> getCurrentPosition() async {
    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      );
    } catch (e) {
      return null;
    }
  }

  static double calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    return Geolocator.distanceBetween(lat1, lon1, lat2, lon2);
  }

  static bool isLocationInCircle({
    required double centerLat,
    required double centerLng,
    required double currentLat,
    required double currentLng,
    required double radius,
    double tolerance = 5.0,
  }) {
    final distance = calculateDistance(
      centerLat,
      centerLng,
      currentLat,
      currentLng,
    );
    return distance <= (radius + tolerance);
  }

  static bool isLocationInCircleWithGeoPoint(
    CircleOSM circle,
    GeoPoint currentLocation, {
    double tolerance = 5.0,
  }) {
    return isLocationInCircle(
      centerLat: circle.centerPoint.latitude,
      centerLng: circle.centerPoint.longitude,
      currentLat: currentLocation.latitude,
      currentLng: currentLocation.longitude,
      radius: circle.radius,
      tolerance: tolerance,
    );
  }

  // Tambahkan method ini
  static Future<bool> openLocationSettings() async {
    return await Geolocator.openLocationSettings();
  }

  static Future<bool> openAppSettings() async {
    return await Geolocator.openAppSettings();
  }

  /// Get location with high accuracy and timeout
  static Future<Position?> getAccuratePosition(
      {Duration timeout = const Duration(seconds: 15)}) async {
    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        timeLimit: timeout,
      );
    } catch (e) {
      debugPrint("📍 LOCATION_ERROR: $e");
      return null;
    }
  }

  /// Get last known position (faster)
  static Future<Position?> getLastKnownPosition() async {
    try {
      return await Geolocator.getLastKnownPosition();
    } catch (e) {
      return null;
    }
  }
}

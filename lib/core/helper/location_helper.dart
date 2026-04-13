import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ibm_presensi_app/core/helper/dialog_helper.dart';

class LocationHelper {
  /// Mengecek apakah izin lokasi sudah diberikan
  static Future<bool> isGrantedLocationPermission() async {
    final permission = await Geolocator.checkPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  /// Mengecek apakah GPS di HP aktif
  static Future<bool> isEnabledLocationService() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  /// Meminta izin lokasi secara cerdas
  static Future<bool> showDialogLocationPermission(BuildContext context) async {
    bool serviceEnabled = await isEnabledLocationService();
    if (!serviceEnabled) {
      if (context.mounted) {
        DialogHelper.showSnackbar(
            context: context,
            text: 'GPS Anda tidak aktif. Mohon aktifkan GPS.');
      }
      return false;
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (context.mounted)
          DialogHelper.showSnackbar(
              context: context, text: 'Izin lokasi dibutuhkan untuk absen.');
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (context.mounted) {
        DialogHelper.showSnackbar(
            context: context,
            text: 'Izin lokasi ditolak permanen. Silakan ubah di Pengaturan.');
      }
      await Geolocator.openAppSettings();
      return false;
    }

    return true;
  }

  /// Mendapatkan lokasi saat ini dengan akurasi tinggi (PENTING untuk Absen)
  static Future<Position?> getCurrentPosition() async {
    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy
            .high, // Akurasi tinggi agar tidak meleset dari pagar Depo
        timeLimit:
            const Duration(seconds: 10), // Cegah aplikasi hang jika GPS lemot
      );
    } catch (e) {
      return null;
    }
  }

  /// Menghitung apakah user berada di dalam radius kantor
  static bool isLocationInCircle(CircleOSM circle, GeoPoint currentLocation) {
    double distance = Geolocator.distanceBetween(
      currentLocation.latitude,
      currentLocation.longitude,
      circle.centerPoint.latitude,
      circle.centerPoint.longitude,
    );

    // Memberikan toleransi 5-10 meter untuk akurasi GPS yang goyang
    const double tolerance = 5.0;
    return distance <= (circle.radius + tolerance);
  }
}

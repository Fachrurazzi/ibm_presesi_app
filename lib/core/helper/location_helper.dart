import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ibm_presensi_app/core/helper/dialog_helper.dart';

class LocationHelper {
  static Future<bool> isGrantedLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    // Gunakan pengecekan yang lebih aman untuk status denied
    return !(permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever);
  }

  static Future<bool> isEnabledLocationService() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  static Future<bool> openLocationSetting() async {
    return await Geolocator.openLocationSettings();
  }

  static Future<bool> showDialogLocationPermission(BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        // Gunakan context.mounted untuk keamanan jika proses request lama
        if (context.mounted) {
          DialogHelper.showSnackbar(
            context: context,
            text: 'Perizinan Lokasi Ditolak',
          );
        }
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (context.mounted) {
        DialogHelper.showSnackbar(
          context: context,
          text:
              'Perizinan lokasi ditolak permanen. Silakan aktifkan di pengaturan.',
        );
      }
      await Geolocator.openAppSettings();
      return false;
    }

    return true;
  }

  static bool isLocationInCircle(CircleOSM circle, GeoPoint currentLocation) {
    double distance = Geolocator.distanceBetween(
      currentLocation.latitude,
      currentLocation.longitude,
      circle.centerPoint.latitude,
      circle.centerPoint.longitude,
    );

    // Hasil distance adalah dalam satuan METER
    return distance <= circle.radius;
  }
}

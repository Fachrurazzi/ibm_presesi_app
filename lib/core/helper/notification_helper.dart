import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart';
import 'package:timezone/data/latest.dart';

class NotificationHelper {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initNotification() async {
    initializeTimeZones();
    try {
      final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
      setLocalLocation(getLocation(currentTimeZone));
    } catch (e) {
      // Fallback ke WITA (Banjarmasin)
      setLocalLocation(getLocation('Asia/Makassar'));
    }

    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    await _plugin.initialize(
      const InitializationSettings(android: androidSettings, iOS: iosSettings),
    );

    if (kDebugMode) debugPrint("NOTIF_HELPER: Engine Ready 🔔");
  }

  /// --- INI FUNGSI YANG TADI HILANG / BELUM ADA ---
  static Future<bool> isPermissionGranted() async {
    if (Platform.isAndroid) {
      final android = _plugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();
      return await android?.areNotificationsEnabled() ?? false;
    } else if (Platform.isIOS) {
      // Untuk iOS, status permission biasanya dicek saat request
      return true;
    }
    return false;
  }

  /// Menjadwalkan pengingat absen (Masuk/Pulang)
  static Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required int hour,
    required int minutes,
  }) async {
    final now = TZDateTime.now(local);
    var scheduledDate =
        TZDateTime(local, now.year, now.month, now.day, hour, minutes);

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    try {
      await _plugin.zonedSchedule(
        id,
        title,
        body,
        scheduledDate,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'ibm_presence_channel',
            'IBM Presensi Reminders',
            channelDescription: 'Notifikasi pengingat jadwal kerja PT IBM',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: true,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );
      if (kDebugMode)
        debugPrint("NOTIF_HELPER: Set notif ID $id jam $hour:$minutes");
    } catch (e) {
      debugPrint("🚨 NOTIF_HELPER_ERROR: $e");
    }
  }

  static Future<void> cancelAll() async => await _plugin.cancelAll();

  static Future<bool> requestPermission() async {
    if (Platform.isIOS) {
      return await _plugin
              .resolvePlatformSpecificImplementation<
                  IOSFlutterLocalNotificationsPlugin>()
              ?.requestPermissions(alert: true, sound: true, badge: true) ??
          false;
    }

    if (Platform.isAndroid) {
      final android = _plugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();
      // Request permission khusus Android 13+ (API 33)
      return await android?.requestNotificationsPermission() ?? false;
    }
    return true;
  }
}

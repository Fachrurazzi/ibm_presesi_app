import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart';
import 'package:timezone/data/latest.dart';

class NotificationHelper {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> configurateLocalTimeZone() async {
    initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    // Gunakan try-catch karena terkadang nama timezone di HP tidak match dengan database library
    try {
      setLocalLocation(getLocation(currentTimeZone));
    } catch (e) {
      setLocalLocation(
          getLocation('Asia/Jakarta')); // Fallback ke WIB jika gagal
    }
  }

  static Future<void> initNotification() async {
    await configurateLocalTimeZone();

    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    DarwinInitializationSettings darwinInitializationSettings =
        const DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    InitializationSettings settings = InitializationSettings(
        android: androidInitializationSettings,
        iOS: darwinInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(settings);
  }

  static scheduleNotification({
    required int id,
    required String title,
    required String body,
    required int hour,
    required int minutes,
  }) async {
    final now = TZDateTime.now(local);
    var scheduledDate =
        TZDateTime(local, now.year, now.month, now.day, hour, minutes);

    // LOGIKA KRUSIAL: Jika waktu yang dijadwalkan sudah lewat hari ini,
    // maka jadwalkan untuk BESOK agar tidak langsung muncul saat ini juga.
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      const NotificationDetails(
          android: AndroidNotificationDetails(
            'ibm_channel_id', // Gunakan ID channel yang unik
            'IBM Presensi Notifications',
            importance: Importance.max,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails()),
      androidScheduleMode: AndroidScheduleMode
          .exactAllowWhileIdle, // Pastikan muncul tepat waktu
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  static cancelAll() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  static Future<bool> requestPermission() async {
    if (Platform.isIOS) {
      return await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  IOSFlutterLocalNotificationsPlugin>()
              ?.requestPermissions(alert: true, sound: true, badge: true) ??
          false;
    } else if (Platform.isAndroid) {
      // Untuk Android 13 (API 33) ke atas wajib minta izin secara runtime
      final androidImplementation =
          flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      return await androidImplementation?.requestNotificationsPermission() ??
          false;
    }
    return false;
  }

  static Future<bool> isPermissionGranted() async {
    bool isGranted = false;

    if (Platform.isIOS) {
      final permission = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.checkPermissions();

      isGranted = permission?.isEnabled ?? false;
    } else if (Platform.isAndroid) {
      isGranted = await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.areNotificationsEnabled() ??
          false;
    }

    return isGranted;
  }
}

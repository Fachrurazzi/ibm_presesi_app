import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class DateTimeHelper {
  static String greeting() {
    final hour = DateTime.now().hour;
    if (hour < 11) {
      return 'Selamat Pagi 🌤️';
    } else if (hour < 15) {
      return 'Selamat Siang ☀️';
    } else if (hour < 18) {
      return 'Selamat Sore 🌇';
    } else {
      return 'Selamat Malam 🌙';
    }
  }

  /// Format string ISO 8601 dari API ke format tampilan (id)
  static String formatString({
    required String? dateTimeString,
    String format = 'd MMMM yyyy',
  }) {
    // ... isi method formatString ...
    if (dateTimeString == null ||
        dateTimeString.isEmpty ||
        dateTimeString == "-") return '-';
    try {
      DateTime dateTime = DateTime.parse(dateTimeString).toLocal();
      return DateFormat(format, 'id').format(dateTime);
    } catch (e) {
      debugPrint("🚨 DATE_HELPER_ERROR (formatString): $e");
      return '-';
    }
  }

  /// Format objek DateTime ke string
  static String formatObject({
    required DateTime? dateTime,
    String format = 'HH:mm',
  }) {
    if (dateTime == null) return '-';
    return DateFormat(format, 'id').format(dateTime);
  }

  /// Parsing string waktu (HH:mm) menjadi objek DateTime hari ini.
  static DateTime parseDateTime({
    required String? dateTimeString, // Dibuat nullable agar lebih aman
    String format = 'HH:mm',
  }) {
    // PROTEKSI 1: Cek null atau kosong
    if (dateTimeString == null ||
        dateTimeString.isEmpty ||
        dateTimeString == "--:--") {
      return DateTime.now();
    }

    try {
      final now = DateTime.now();
      final parsedTime = DateFormat(format).parse(dateTimeString);

      return DateTime(
        now.year,
        now.month,
        now.day,
        parsedTime.hour,
        parsedTime.minute,
      );
    } catch (e) {
      debugPrint(
          "🚨 DATE_HELPER_ERROR (parseDateTime): $e. Fallback to parseTimeOnly.");
      return parseTimeOnly(dateTimeString);
    }
  }

  /// Parsing string waktu (HH:mm) secara manual (Fallback) dengan proteksi Index
  static DateTime parseTimeOnly(String? timeString) {
    final now = DateTime.now();
    if (timeString == null || !timeString.contains(':')) return now;

    try {
      final parts = timeString.split(':');
      // PROTEKSI 2: Pastikan ada minimal 2 bagian (jam dan menit)
      if (parts.length < 2) return now;

      return DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(parts[0]),
        int.parse(parts[1]),
      );
    } catch (e) {
      debugPrint("🚨 DATE_HELPER_ERROR (parseTimeOnly): $e");
      return now;
    }
  }

  /// Mendapatkan selisih waktu dalam menit
  static int getDiffInMinutes(DateTime start, DateTime end) {
    return end.difference(start).inMinutes;
  }
}

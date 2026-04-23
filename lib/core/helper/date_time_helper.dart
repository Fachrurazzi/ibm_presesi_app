import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class DateTimeHelper {
  /// Indonesian locale
  static const String _locale = 'id_ID';

  /// Month names in Indonesian
  static const List<String> monthNames = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];

  /// Day names in Indonesian
  static const List<String> dayNames = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Minggu',
  ];

  /// Greeting based on current hour
  static String greeting() {
    final hour = DateTime.now().hour;
    if (hour < 11) return 'Selamat Pagi 🌤️';
    if (hour < 15) return 'Selamat Siang ☀️';
    if (hour < 18) return 'Selamat Sore 🌇';
    return 'Selamat Malam 🌙';
  }

  /// Get greeting with name
  static String greetingWithName(String name) {
    return '${greeting()}, $name!';
  }

  /// Format DateTime string to local date
  static String formatString({
    required String? dateTimeString,
    String format = 'd MMMM yyyy',
  }) {
    if (dateTimeString == null ||
        dateTimeString.isEmpty ||
        dateTimeString == "-") {
      return '-';
    }
    try {
      final dateTime = DateTime.parse(dateTimeString).toLocal();
      return DateFormat(format, _locale).format(dateTime);
    } catch (e) {
      debugPrint("🚨 DATE_HELPER_ERROR: $e");
      return '-';
    }
  }

  /// Format DateTime object
  static String formatObject({
    required DateTime? dateTime,
    String format = 'HH:mm',
  }) {
    if (dateTime == null) return '-';
    return DateFormat(format, _locale).format(dateTime);
  }

  /// Format date to Indonesian format (e.g., "Senin, 21 April 2026")
  static String formatDateIndonesian(DateTime? date) {
    if (date == null) return '-';
    final dayName = dayNames[date.weekday - 1];
    return '$dayName, ${date.day} ${monthNames[date.month - 1]} ${date.year}';
  }

  /// Format time range (e.g., "08:30 - 17:30")
  static String formatTimeRange(String? start, String? end) {
    if (start == null || end == null) return '-';
    return '$start - $end';
  }

  /// Get relative time (e.g., "2 jam yang lalu")
  static String relativeTime(DateTime? dateTime) {
    if (dateTime == null) return '-';

    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} tahun yang lalu';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} bulan yang lalu';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} hari yang lalu';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} jam yang lalu';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} menit yang lalu';
    } else {
      return 'Baru saja';
    }
  }

  /// Check if check-in time is late compared to schedule
  static bool checkIsLate(String checkInTime, String scheduleStartTime) {
    try {
      final actual = parseTimeString(checkInTime);
      final schedule = parseTimeString(scheduleStartTime);
      return actual.isAfter(schedule);
    } catch (e) {
      return false;
    }
  }

  /// Parse time string to DateTime (using today's date)
  static DateTime parseDateTime({
    required String? dateTimeString,
    String format = 'HH:mm',
  }) {
    if (dateTimeString == null ||
        dateTimeString.isEmpty ||
        dateTimeString == "--:--") {
      return DateTime.now();
    }
    try {
      final now = DateTime.now();
      final clean = dateTimeString.trim();
      final parsed = DateFormat(format).parse(clean);
      return DateTime(now.year, now.month, now.day, parsed.hour, parsed.minute);
    } catch (e) {
      return parseTimeString(dateTimeString);
    }
  }

  /// Parse time string "HH:mm" to DateTime
  static DateTime parseTimeString(String? timeString) {
    final now = DateTime.now();
    if (timeString == null || !timeString.contains(':')) return now;
    try {
      final parts = timeString.trim().split(':');
      if (parts.length < 2) return now;
      return DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(parts[0]),
        int.parse(parts[1]),
      );
    } catch (e) {
      return now;
    }
  }

  /// Check if given date is today
  static bool isToday(DateTime? date) {
    if (date == null) return false;
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  /// Check if date is tomorrow
  static bool isTomorrow(DateTime? date) {
    if (date == null) return false;
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return date.year == tomorrow.year &&
        date.month == tomorrow.month &&
        date.day == tomorrow.day;
  }

  /// Check if date is yesterday
  static bool isYesterday(DateTime? date) {
    if (date == null) return false;
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day;
  }

  /// Get start of day
  static DateTime startOfDay(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  /// Get end of day
  static DateTime endOfDay(DateTime date) =>
      DateTime(date.year, date.month, date.day, 23, 59, 59);

  /// Get days between two dates
  static int daysBetween(DateTime start, DateTime end) {
    return end.difference(start).inDays.abs();
  }

  /// Format duration in hours and minutes
  static String formatDuration({int hours = 0, int minutes = 0}) {
    if (hours == 0 && minutes == 0) return '0 jam';
    final parts = <String>[];
    if (hours > 0) parts.add('$hours jam');
    if (minutes > 0) parts.add('$minutes menit');
    return parts.join(' ');
  }

  /// Get month name in Indonesian
  static String getMonthName(int month) {
    if (month < 1 || month > 12) return '';
    return monthNames[month - 1];
  }

  /// Get day name in Indonesian
  static String getDayName(DateTime date) {
    return dayNames[date.weekday - 1];
  }
}

import 'package:intl/intl.dart';

class DateTimeHelper {
  static String formatDateTimeFromString({
    required String dateTimeString,
    required String format,
  }) {
    // Tips: Tambahkan try-catch atau gunakan parseStrict jika format string dari API tidak menentu
    DateTime dateTime = DateTime.parse(dateTimeString);
    return DateFormat(format, 'id').format(dateTime);
  }

  static String formatDateTime({
    required DateTime dateTime,
    required String format,
  }) {
    return DateFormat(format, 'id').format(dateTime);
  }

  static Duration getDifference({required DateTime a, required DateTime b}) {
    return b.difference(a);
  }

  static DateTime parseDateTime(
      {required String dateTimeString, String format = 'd MMM yyyy'}) {
    // BUG POTENSIAL: DateFormat parse butuh locale yang sama jika string mengandung nama bulan/hari Indo
    // Jika dateTimeString adalah "12 Feb 2026", maka butuh locale 'id'.
    return DateFormat(format, 'id').parse(dateTimeString);
  }
}

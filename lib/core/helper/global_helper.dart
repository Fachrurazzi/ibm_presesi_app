import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';

enum AppTextStyle {
  DISPLAY_LARGE,
  DISPLAY_MEDIUM,
  DISPLAY_SMALL,
  HEADLINE_LARGE,
  HEADLINE_MEDIUM,
  HEADLINE_SMALL,
  TITLE_LARGE,
  TITLE_MEDIUM,
  TITLE_SMALL,
  LABEL_LARGE,
  LABEL_MEDIUM,
  LABEL_SMALL,
  BODY_LARGE,
  BODY_MEDIUM,
  BODY_SMALL,
}

class GlobalHelper {
  static ElegantNotification? _currentNotification;

  static void showElegantNotification({
    required BuildContext context,
    required String title,
    required String message,
    bool isError = true,
    Duration? duration,
  }) {
    if (!context.mounted) return;

    _currentNotification?.dismiss();
    _currentNotification = null;

    final size = MediaQuery.of(context).size;
    final topPadding = MediaQuery.of(context).padding.top;

    _currentNotification = ElegantNotification(
      width: size.width * 0.85,
      notificationMargin: topPadding + 10,
      position: Alignment.topCenter,
      animation: AnimationType.fromTop,
      background: isError ? Colors.red.shade50 : Colors.green.shade50,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 13,
          color: Colors.black87,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      description: Text(
        message,
        style: const TextStyle(
          fontSize: 11,
          color: Colors.black54,
          height: 1.3,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      icon: Icon(
        isError ? Icons.error_rounded : Icons.check_circle_rounded,
        color: isError ? Colors.red : Colors.green,
        size: 24,
      ),
      showProgressIndicator: false,
      borderRadius: BorderRadius.circular(16),
      displayCloseButton: false,
      toastDuration: duration ?? const Duration(seconds: 4),
    )..show(context);
  }

  static void showSuccessNotification({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    if (!context.mounted) return;
    showElegantNotification(
      context: context,
      title: title,
      message: message,
      isError: false,
    );
  }

  static void showErrorNotification({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    if (!context.mounted) return;
    showElegantNotification(
      context: context,
      title: title,
      message: message,
      isError: true,
    );
  }

  static void showWarningNotification({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    if (!context.mounted) return;

    _currentNotification?.dismiss();
    final size = MediaQuery.of(context).size;
    final topPadding = MediaQuery.of(context).padding.top;

    _currentNotification = ElegantNotification(
      width: size.width * 0.85,
      notificationMargin: topPadding + 10,
      position: Alignment.topCenter,
      animation: AnimationType.fromTop,
      background: Colors.orange.shade50,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 13,
          color: Colors.black87,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      description: Text(
        message,
        style: const TextStyle(
          fontSize: 11,
          color: Colors.black54,
          height: 1.3,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      icon: const Icon(
        Icons.warning_rounded,
        color: Colors.orange,
        size: 24,
      ),
      showProgressIndicator: false,
      borderRadius: BorderRadius.circular(16),
      displayCloseButton: false,
      toastDuration: const Duration(seconds: 4),
    )..show(context);
  }

  static void showInfoNotification({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    if (!context.mounted) return;

    _currentNotification?.dismiss();
    final size = MediaQuery.of(context).size;
    final topPadding = MediaQuery.of(context).padding.top;

    _currentNotification = ElegantNotification(
      width: size.width * 0.85,
      notificationMargin: topPadding + 10,
      position: Alignment.topCenter,
      animation: AnimationType.fromTop,
      background: Colors.blue.shade50,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 13,
          color: Colors.black87,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      description: Text(
        message,
        style: const TextStyle(
          fontSize: 11,
          color: Colors.black54,
          height: 1.3,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      icon: const Icon(
        Icons.info_rounded,
        color: Colors.blue,
        size: 24,
      ),
      showProgressIndicator: false,
      borderRadius: BorderRadius.circular(16),
      displayCloseButton: false,
      toastDuration: const Duration(seconds: 4),
    )..show(context);
  }

  static void hideCurrentNotification() {
    _currentNotification?.dismiss();
    _currentNotification = null;
  }

  static TextStyle? getTextStyle({
    required BuildContext context,
    AppTextStyle appTextStyle = AppTextStyle.BODY_MEDIUM,
  }) {
    final textTheme = Theme.of(context).textTheme;
    switch (appTextStyle) {
      case AppTextStyle.DISPLAY_LARGE:
        return textTheme.displayLarge;
      case AppTextStyle.DISPLAY_MEDIUM:
        return textTheme.displayMedium;
      case AppTextStyle.DISPLAY_SMALL:
        return textTheme.displaySmall;
      case AppTextStyle.HEADLINE_LARGE:
        return textTheme.headlineLarge;
      case AppTextStyle.HEADLINE_MEDIUM:
        return textTheme.headlineMedium;
      case AppTextStyle.HEADLINE_SMALL:
        return textTheme.headlineSmall;
      case AppTextStyle.TITLE_LARGE:
        return textTheme.titleLarge;
      case AppTextStyle.TITLE_MEDIUM:
        return textTheme.titleMedium;
      case AppTextStyle.TITLE_SMALL:
        return textTheme.titleSmall;
      case AppTextStyle.LABEL_LARGE:
        return textTheme.labelLarge;
      case AppTextStyle.LABEL_MEDIUM:
        return textTheme.labelMedium;
      case AppTextStyle.LABEL_SMALL:
        return textTheme.labelSmall;
      case AppTextStyle.BODY_LARGE:
        return textTheme.bodyLarge;
      case AppTextStyle.BODY_MEDIUM:
        return textTheme.bodyMedium;
      case AppTextStyle.BODY_SMALL:
        return textTheme.bodySmall;
    }
  }

  static ColorScheme getColorScheme(BuildContext context) =>
      Theme.of(context).colorScheme;

  static bool isDarkMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static Size getScreenSize(BuildContext context) =>
      MediaQuery.of(context).size;

  static double getTopPadding(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  static double getBottomPadding(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;

  static bool isValidEmail(String email) {
    return RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(email);
  }

  static bool isValidPhone(String phone) {
    return RegExp(r'^(0|\+62)[0-9]{9,13}$').hasMatch(phone);
  }

  static String capitalizeWords(String text) {
    if (text.isEmpty) return text;
    return text.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  static String formatRupiah(int amount) {
    return 'Rp ${amount.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    )}';
  }

  static String getInitials(String name) {
    if (name.isEmpty) return '?';
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name.substring(0, 1).toUpperCase();
  }
}
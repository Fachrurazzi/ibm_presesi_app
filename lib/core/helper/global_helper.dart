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
  /// Mengambil TextStyle berdasarkan tema Material 3.
  /// Menggunakan [switch] agar lebih hemat memori dibandingkan Map.
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

  static ColorScheme getColorSchema(BuildContext context) {
    return Theme.of(context).colorScheme;
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  /// Helper untuk mendapatkan ukuran layar (Responsivitas)
  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  /// Helper untuk mendapatkan tinggi Safe Area (Penting untuk Notifikasi/Pill)
  static double getTopPadding(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }
}

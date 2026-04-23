import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';

class DialogHelper {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>?
      _currentSnackbar;

  /// Snackbar floating dengan animasi
  static void showSnackbar({
    required BuildContext context,
    required String text,
    Color? backgroundColor,
    String? actionLabel,
    VoidCallback? onAction,
    Duration duration = const Duration(seconds: 4),
    IconData? icon,
  }) {
    if (!context.mounted) return;

    _currentSnackbar?.close();

    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();

    _currentSnackbar = messenger.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: Colors.white, size: 20),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor ?? Colors.black87,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        duration: duration,
        elevation: 8,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        action: actionLabel != null
            ? SnackBarAction(
                label: actionLabel,
                textColor: Colors.white,
                onPressed: () {
                  _currentSnackbar = null;
                  onAction?.call();
                },
              )
            : null,
      ),
    );
  }

  static void showSuccessSnackbar(BuildContext context, String text) {
    showSnackbar(
      context: context,
      text: text,
      backgroundColor: Colors.green.shade600,
      icon: Icons.check_circle_rounded,
    );
  }

  static void showErrorSnackbar(BuildContext context, String text) {
    showSnackbar(
      context: context,
      text: text,
      backgroundColor: Colors.red.shade600,
      icon: Icons.error_rounded,
    );
  }

  static void showWarningSnackbar(BuildContext context, String text) {
    showSnackbar(
      context: context,
      text: text,
      backgroundColor: Colors.orange.shade600,
      icon: Icons.warning_rounded,
    );
  }

  static void showInfoSnackbar(BuildContext context, String text) {
    showSnackbar(
      context: context,
      text: text,
      backgroundColor: Colors.blue.shade600,
      icon: Icons.info_rounded,
    );
  }

  /// Bottom sheet modern dengan grab handle
  static Future<T?> showBottomDialog<T>({
    required BuildContext context,
    required String title,
    required Widget content,
    bool isDismissible = true,
    bool enableDrag = true,
    double? maxHeight,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      builder: (context) {
        final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
        Widget sheetContent = Padding(
          padding: EdgeInsets.only(bottom: bottomPadding),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Grab handle dengan animasi
                  Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GlobalHelper.getTextStyle(
                      context: context,
                      appTextStyle: AppTextStyle.TITLE_MEDIUM,
                    )?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Flexible(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: content,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        );

        if (maxHeight != null) {
          sheetContent = ConstrainedBox(
            constraints: BoxConstraints(maxHeight: maxHeight),
            child: sheetContent,
          );
        }

        return sheetContent;
      },
    );
  }

  /// Loading dialog dengan animasi pulse
  static void showLoadingDialog(
    BuildContext context, {
    String message = 'Memproses...',
    Color? barrierColor,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: barrierColor ?? Colors.black54,
      builder: (context) => PopScope(
        canPop: false,
        child: Center(
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.8, end: 1.0),
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            builder: (context, value, child) {
              return Transform.scale(
                scale: value,
                child: child,
              );
            },
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(strokeWidth: 3),
                  const SizedBox(height: 20),
                  Text(
                    message,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void hideLoadingDialog(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  /// Konfirmasi dialog dengan icon
  static Future<bool?> showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String message,
    String confirmText = 'Ya',
    String cancelText = 'Batal',
    Color confirmColor = Colors.red,
    bool isDangerous = true,
    IconData? icon,
  }) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: confirmColor, size: 24),
              const SizedBox(width: 12),
            ],
            Expanded(
                child: Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold))),
          ],
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(cancelText),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
              foregroundColor: isDangerous ? confirmColor : null,
            ),
            child: Text(
              confirmText,
              style:
                  TextStyle(fontWeight: isDangerous ? FontWeight.bold : null),
            ),
          ),
        ],
      ),
    );
  }

  static Future<T?> showCustomDialog<T>({
    required BuildContext context,
    required Widget child,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';

class DialogHelper {
  /// Menampilkan Snackbar yang melayang (Floating) dengan warna dinamis.
  static void showSnackbar({
    required BuildContext context,
    required String text,
    Color? backgroundColor,
  }) {
    // Pastikan tidak ada snackbar bertumpuk
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        ),
        backgroundColor: backgroundColor ?? Colors.black87,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16), // Memberi jarak dari pinggir layar
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 3),
        elevation: 4,
      ),
    );
  }

  /// Menampilkan Bottom Sheet modern yang responsif terhadap keyboard.
  static void showBottomDialog({
    required BuildContext context,
    required String title,
    required Widget content,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.white,
      elevation: 0, // Kita gunakan shadow custom dari shape jika perlu
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      builder: (context) {
        return Padding(
          // Responsif terhadap keyboard (PENTING untuk input field)
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Indikator Drag (Material 3 Style)
                  Container(
                    width: 36,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Title Dialog
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GlobalHelper.getTextStyle(
                      context: context,
                      appTextStyle: AppTextStyle.TITLE_MEDIUM,
                    )?.copyWith(
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Content Area
                  Flexible(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: content,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

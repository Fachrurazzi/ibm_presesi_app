import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';

class DialogHelper {
  static void showSnackbar(
      {required BuildContext context, required String text}) {
    // Menghapus snackbar yang sedang tampil sebelum menampilkan yang baru
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        behavior:
            SnackBarBehavior.floating, // Membuat snackbar melayang (Modern)
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 3),
      ),
    );
  }

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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (context) {
        return Padding(
          // Padding dinamis agar dialog naik saat keyboard muncul
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Sesuai ukuran konten
                children: [
                  // Handle bar kecil di atas (Indikator Material 3)
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    title,
                    style: GlobalHelper.getTextStyle(
                      context: context,
                      appTextStyle: AppTextStyle.TITLE_MEDIUM,
                    )?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  content,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/presentation/login/login_screen.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';

class ErrorAppWidget extends StatelessWidget {
  final String description;
  final void Function() onPressDefaultButton;
  final FilledButton? alternatifButton;

  const ErrorAppWidget({
    super.key,
    required this.description,
    required this.onPressDefaultButton,
    this.alternatifButton, // Dibuat opsional (tanpa required) agar lebih fleksibel
  });

  @override
  Widget build(BuildContext context) {
    // Mengecek apakah error disebabkan oleh masalah autentikasi
    final bool isUnauthenticated = description.contains('401') ||
        description.toLowerCase().contains('unauthenticated');

    return Padding(
      padding: const EdgeInsets.all(
          24.0), // Beri padding agar teks tidak mepet layar
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              CrossAxisAlignment.center, // Pastikan semua di tengah
          children: [
            Icon(
              isUnauthenticated ? Icons.lock_person : Icons.error_outline,
              size: 100,
              color: Theme.of(context)
                  .colorScheme
                  .error, // Gunakan warna error dari tema
            ),
            const SizedBox(height: 24),
            Text(
              isUnauthenticated ? "Sesi Berakhir" : "Terjadi Kesalahan",
              style: GlobalHelper.getTextStyle(
                context: context,
                appTextStyle: AppTextStyle.HEADLINE_SMALL,
              )?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: GlobalHelper.getTextStyle(
                context: context,
                appTextStyle: AppTextStyle.BODY_MEDIUM,
              ),
              textAlign: TextAlign.center, // Teks deskripsi rata tengah
            ),
            const SizedBox(height: 32),

            // LOGIKA TOMBOL
            alternatifButton ??
                (isUnauthenticated
                    ? FilledButton.icon(
                        onPressed: () async {
                          await SharedPreferencesHelper.logout();
                          if (context.mounted) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (route) => false,
                            );
                          }
                        },
                        icon: const Icon(Icons.login),
                        label: const Text('Login Kembali'),
                      )
                    : FilledButton.icon(
                        onPressed: onPressDefaultButton,
                        icon: const Icon(Icons.refresh),
                        label: const Text("Coba Lagi"),
                      )),
          ],
        ),
      ),
    );
  }
}

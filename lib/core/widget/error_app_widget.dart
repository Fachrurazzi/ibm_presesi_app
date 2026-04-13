import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/presentation/login/login_screen.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';

class ErrorAppWidget extends StatelessWidget {
  final String description;
  final void Function() onPressDefaultButton;
  final Widget? alternatifButton; // Menggunakan Widget agar lebih fleksibel

  const ErrorAppWidget({
    super.key,
    required this.description,
    required this.onPressDefaultButton,
    this.alternatifButton,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Mengecek kondisi Auth secara case-insensitive
    final bool isUnauthenticated = description.contains('401') ||
        description.toLowerCase().contains('unauthenticated') ||
        description.toLowerCase().contains('token');

    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ilustrasi Icon dengan efek lingkaran halus di belakangnya
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: (isUnauthenticated
                          ? Colors.orange
                          : theme.colorScheme.error)
                      .withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isUnauthenticated
                      ? Icons.lock_clock_rounded
                      : Icons.cloud_off_rounded,
                  size: 80,
                  color: isUnauthenticated
                      ? Colors.orange
                      : theme.colorScheme.error,
                ),
              ),
              const SizedBox(height: 32),

              // Judul Error
              Text(
                isUnauthenticated ? "Sesi Berakhir" : "Koneksi Terputus",
                style: GlobalHelper.getTextStyle(
                  context: context,
                  appTextStyle: AppTextStyle.HEADLINE_SMALL,
                )?.copyWith(fontWeight: FontWeight.w900, letterSpacing: -0.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),

              // Deskripsi Error (Dibatasi agar tidak merusak UI jika terlalu panjang)
              Text(
                description,
                style: GlobalHelper.getTextStyle(
                  context: context,
                  appTextStyle: AppTextStyle.BODY_MEDIUM,
                )?.copyWith(color: Colors.black54, height: 1.5),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 40),

              // LOGIKA TOMBOL AKSI
              SizedBox(
                width: double.infinity,
                height: 52,
                child: alternatifButton ??
                    (isUnauthenticated
                        ? OutlinedButton.icon(
                            onPressed: () => _handleLogout(context),
                            style: OutlinedButton.styleFrom(
                              side:
                                  BorderSide(color: theme.colorScheme.primary),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            icon: const Icon(Icons.logout_rounded, size: 20),
                            label: const Text('LOGIN KEMBALI',
                                style: TextStyle(fontWeight: FontWeight.w900)),
                          )
                        : FilledButton.icon(
                            onPressed: onPressDefaultButton,
                            style: FilledButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            icon: const Icon(Icons.refresh_rounded, size: 20),
                            label: const Text("COBA LAGI",
                                style: TextStyle(fontWeight: FontWeight.w900)),
                          )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Helper untuk membersihkan sesi dan navigasi ke Login
  Future<void> _handleLogout(BuildContext context) async {
    await SharedPreferencesHelper.logout();
    if (context.mounted) {
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }
  }
}

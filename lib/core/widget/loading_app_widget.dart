import 'package:flutter/material.dart';

class LoadingAppWidget extends StatelessWidget {
  final String? message; // Tambahkan parameter pesan agar fleksibel

  const LoadingAppWidget({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Gunakan Container dengan sedikit bayangan untuk menampung Loading
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.primary.withOpacity(0.1),
                  blurRadius: 20,
                  spreadRadius: 5,
                )
              ],
            ),
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                // Gunakan warna gradasi atau flat primary
                valueColor:
                    AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
                backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Teks Loading yang lebih halus
          Text(
            message ?? "Memuat data...",
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),

          const SizedBox(height: 4),

          // Tambahkan teks sub-caption opsional
          Text(
            "Mohon tunggu sebentar",
            style: theme.textTheme.labelSmall?.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

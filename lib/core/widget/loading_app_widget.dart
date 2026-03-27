import 'package:flutter/material.dart';

class LoadingAppWidget extends StatelessWidget {
  final String? message;

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
                  color: theme.colorScheme.primary.withOpacity(0.08),
                  blurRadius: 30, // Ditingkatkan agar lebih halus
                  spreadRadius: 2,
                  offset: const Offset(0, 10), // Memberikan kesan melayang
                )
              ],
            ),
            child: SizedBox(
              width: 48, // Sedikit diperbesar agar lebih proporsional
              height: 48,
              child: CircularProgressIndicator(
                strokeWidth: 4, // Sedikit lebih tebal agar jelas
                valueColor:
                    AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
                backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
                // Tips: Tambahkan strokeCap agar ujung loading tidak kaku
                strokeCap: StrokeCap.round,
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Teks Loading Utama
          Text(
            message ?? "Memuat data...",
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.2,
            ),
          ),

          const SizedBox(height: 8),

          // Teks sub-caption
          Text(
            "Mohon tunggu sebentar",
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}

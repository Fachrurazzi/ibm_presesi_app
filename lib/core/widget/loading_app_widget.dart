import 'package:flutter/material.dart';

class LoadingAppWidget extends StatelessWidget {
  final String? message;
  final Color? color;

  const LoadingAppWidget({
    super.key,
    this.message,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = color ?? theme.colorScheme.primary;

    return Center(
      // Memberikan efek FadeIn sederhana saat widget muncul
      child: TweenAnimationBuilder<double>(
        // Perbaikan: Bungkus 0.0 dan 1.0 ke dalam Tween<double>
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 500),
        builder: (context, value, child) {
          return Opacity(
            opacity: value, // Gunakan 'value' dari tween untuk efek fade-in
            child: child,
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize
              .min, // Agar tidak memakan semua ruang vertikal jika di dalam Stack
          children: [
            // Container Loading dengan desain Floating (IBM Style)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.12),
                    blurRadius: 30,
                    spreadRadius: 5,
                    offset: const Offset(0, 10),
                  )
                ],
              ),
              child: SizedBox(
                width: 44,
                height: 44,
                child: CircularProgressIndicator(
                  strokeWidth: 4,
                  valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                  backgroundColor: primaryColor.withOpacity(0.1),
                  strokeCap: StrokeCap.round,
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Teks Status
            Text(
              message ?? "Menyiapkan Data...",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w900, // Lebih bold untuk IBM look
                letterSpacing: -0.2,
              ),
            ),
            const SizedBox(height: 8),

            // Sub-teks (Caption)
            Text(
              "PT Intiboga Mandiri",
              textAlign: TextAlign.center,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant.withOpacity(0.6),
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

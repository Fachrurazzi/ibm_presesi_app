import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class ErrorAppWidget extends StatelessWidget {
  final String description;
  final VoidCallback onPressDefaultButton;
  final Widget? alternatifButton;
  final ErrorType errorType;

  const ErrorAppWidget({
    super.key,
    required this.description,
    required this.onPressDefaultButton,
    this.alternatifButton,
    this.errorType = ErrorType.unknown,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final descLower = description.toLowerCase();

    final isUnauthenticated = errorType == ErrorType.unauthenticated ||
        description.contains('401') ||
        descLower.contains('unauthenticated') ||
        descLower.contains('token') ||
        descLower.contains('sesi berakhir');

    final isBanned = errorType == ErrorType.banned ||
        descLower.contains('banned') ||
        descLower.contains('ditangguhkan') ||
        descLower.contains('blokir') ||
        description.contains('403') ||
        descLower.contains('akses ditangguhkan');

    final isNetworkError = errorType == ErrorType.network ||
        errorType == ErrorType.timeout ||
        descLower.contains('koneksi') ||
        descLower.contains('internet') ||
        descLower.contains('timeout') ||
        descLower.contains('network');

    return Center(
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
        builder: (context, value, child) {
          return Opacity(
            opacity: value,
            child: Transform.translate(
              offset: Offset(0, 20 * (1 - value)),
              child: child,
            ),
          );
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAnimatedIcon(
                  theme, isUnauthenticated, isBanned, isNetworkError),
              const SizedBox(height: 32),
              Text(
                _getTitle(isUnauthenticated, isBanned, isNetworkError),
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.5,
                  color: theme.colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  _getDisplayMessage(
                      description, isUnauthenticated, isBanned, isNetworkError),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: alternatifButton ??
                    _buildActionButton(
                      context,
                      theme,
                      isUnauthenticated,
                      isBanned,
                      isNetworkError,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedIcon(
      ThemeData theme, bool isUnauth, bool isBanned, bool isNetwork) {
    Color color = theme.colorScheme.error;
    IconData icon = Icons.error_outline_rounded;
    String emoji = '😕';

    if (isBanned) {
      color = const Color(0xFFB71C1C);
      icon = Icons.gavel_rounded;
      emoji = '🚫';
    } else if (isUnauth) {
      color = const Color(0xFFE65100);
      icon = Icons.lock_clock_rounded;
      emoji = '🔒';
    } else if (isNetwork) {
      color = const Color(0xFF455A64);
      icon = Icons.wifi_off_rounded;
      emoji = '📡';
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.15),
                color.withOpacity(0.05),
              ],
            ),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 80, color: color),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              emoji,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }

  String _getTitle(bool isUnauth, bool isBanned, bool isNetwork) {
    if (isBanned) return "Akun Ditangguhkan";
    if (isUnauth) return "Sesi Berakhir";
    if (isNetwork) return "Koneksi Terputus";
    return "Terjadi Kesalahan";
  }

  String _getDisplayMessage(
      String original, bool isUnauth, bool isBanned, bool isNetwork) {
    if (isBanned) {
      return "Akun Anda telah ditangguhkan. Silakan hubungi HRD PT Intiboga Mandiri untuk informasi lebih lanjut.";
    }
    if (isUnauth) {
      return "Sesi login Anda telah berakhir. Silakan login kembali untuk melanjutkan.";
    }
    if (isNetwork) {
      return "Tidak dapat terhubung ke server. Periksa koneksi internet Anda dan coba lagi.";
    }
    return original;
  }

  Widget _buildActionButton(
    BuildContext context,
    ThemeData theme,
    bool isUnauth,
    bool isBanned,
    bool isNetwork,
  ) {
    if (isUnauth || isBanned) {
      return OutlinedButton.icon(
        onPressed: () => _handleLogout(context),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: theme.colorScheme.primary),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        icon: const Icon(Icons.logout_rounded, size: 20),
        label: Text(
          isBanned ? 'KEMBALI KE LOGIN' : 'LOGIN KEMBALI',
          style: const TextStyle(fontWeight: FontWeight.w900),
        ),
      );
    }

    return FilledButton.icon(
      onPressed: onPressDefaultButton,
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      icon: const Icon(Icons.refresh_rounded, size: 20),
      label: const Text(
        "COBA LAGI",
        style: TextStyle(fontWeight: FontWeight.w900),
      ),
    );
  }

  Future<void> _handleLogout(BuildContext context) async {
    await SharedPreferencesHelper.logout();
    if (context.mounted) {
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }
  }
}

import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibm_presensi_app/app/presentation/onboarding/change_password_notifier.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen
    extends AppWidget<ChangePasswordNotifier, void, void> {
  ChangePasswordScreen({super.key});

  @override
  Widget bodyBuild(BuildContext context) {
    // Gunakan watch agar UI reaktif terhadap perubahan status loading atau visibility password
    final prov = context.watch<ChangePasswordNotifier>();
    final screenHeight = MediaQuery.of(context).size.height;
    final colorScheme = GlobalHelper.getColorSchema(context);

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        // Peringatan jika mencoba back via gesture/tombol fisik
        _showNotification(context, "Akses Terkunci",
            "Anda wajib mengganti password default untuk melanjutkan.",
            isError: false);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Keamanan Akun",
              style: GlobalHelper.getTextStyle(
                      context: context, appTextStyle: AppTextStyle.TITLE_LARGE)
                  ?.copyWith(fontWeight: FontWeight.w900)),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          automaticallyImplyLeading: false, // User tidak boleh kembali
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.04),
              // Icon Animasi atau Static yang representatif
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.lock_reset_rounded,
                    size: 80,
                    color: colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              _buildSectionHeader(context, "Buat Password Baru"),
              const SizedBox(height: 8),
              Text(
                "Demi keamanan data PT INTIBOGA MANDIRI, silakan ganti password bawaan sistem dengan password pribadi Anda.",
                style: GlobalHelper.getTextStyle(
                        context: context, appTextStyle: AppTextStyle.BODY_SMALL)
                    ?.copyWith(color: Colors.grey.shade600, height: 1.5),
              ),
              const SizedBox(height: 32),

              // Input Password Baru
              _buildCustomField(
                context: context,
                controller: prov.passwordController,
                label: "Password Baru",
                icon: Icons.vpn_key_rounded,
                isPass: true,
                obscure: !prov.isPasswordVisible,
                onToggle: () => prov.toggleVisibility(),
                hint: "Gunakan minimal 8 karakter",
              ),
              const SizedBox(height: 20),

              // Input Konfirmasi
              _buildCustomField(
                context: context,
                controller: prov.confirmPasswordController,
                label: "Konfirmasi Password Baru",
                icon: Icons.lock_outline_rounded,
                isPass: true,
                obscure: !prov.isPasswordVisible,
                onToggle: () => prov.toggleVisibility(),
                hint: "Ketik ulang password baru Anda",
              ),

              SizedBox(height: screenHeight * 0.06),

              // Tombol Simpan
              _buildSubmitButton(context, prov),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomField({
    required BuildContext context,
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isPass = false,
    bool obscure = false,
    VoidCallback? onToggle,
    String? hint,
  }) {
    final colorScheme = GlobalHelper.getColorSchema(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(label,
              style: GlobalHelper.getTextStyle(
                      context: context, appTextStyle: AppTextStyle.LABEL_SMALL)
                  ?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.blueGrey)),
        ),
        TextField(
          controller: controller,
          obscureText: isPass ? obscure : false,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
                fontWeight: FontWeight.normal),
            prefixIcon: Icon(icon, size: 20, color: colorScheme.primary),
            suffixIcon: isPass
                ? IconButton(
                    icon: Icon(
                        obscure
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                        size: 20,
                        color: Colors.grey),
                    onPressed: onToggle)
                : null,
            filled: true,
            fillColor: Colors.grey.shade50,
            contentPadding: const EdgeInsets.all(18),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey.shade100)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                    BorderSide(color: colorScheme.primary.withOpacity(0.3))),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(title,
          style: GlobalHelper.getTextStyle(
                  context: context, appTextStyle: AppTextStyle.TITLE_MEDIUM)
              ?.copyWith(fontWeight: FontWeight.w900, letterSpacing: -0.5)),
    );
  }

  Widget _buildSubmitButton(BuildContext context, ChangePasswordNotifier prov) {
    final colorScheme = GlobalHelper.getColorSchema(context);

    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: prov.isLoading ? null : () => prov.submit(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          elevation: 0,
        ),
        child: prov.isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                    color: Colors.white, strokeWidth: 3))
            : const Text("SIMPAN PASSWORD",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                    letterSpacing: 0.5)),
      ),
    );
  }

  // --- Helper Notifikasi ---
  void _showNotification(BuildContext context, String title, String message,
      {required bool isError}) {
    final double safeAreaTop = MediaQuery.of(context).padding.top;
    final screenWidth = MediaQuery.of(context).size.width;

    if (isError) {
      ElegantNotification.error(
        width: screenWidth * 0.9,
        notificationMargin: safeAreaTop + 10,
        position: Alignment.topCenter,
        animation: AnimationType.fromTop,
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
        description: Text(message, style: const TextStyle(fontSize: 12)),
        showProgressIndicator: false,
        borderRadius: BorderRadius.circular(20),
        displayCloseButton: false,
      ).show(context);
    } else {
      ElegantNotification.info(
        width: screenWidth * 0.9,
        notificationMargin: safeAreaTop + 10,
        position: Alignment.topCenter,
        animation: AnimationType.fromTop,
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
        description: Text(message, style: const TextStyle(fontSize: 12)),
        showProgressIndicator: false,
        borderRadius: BorderRadius.circular(20),
        displayCloseButton: false,
      ).show(context);
    }
  }

  @override
  void checkVariableAfterUi(BuildContext context) {
    final prov = context.read<ChangePasswordNotifier>();

    if (prov.errorMessage.isNotEmpty) {
      final errMsg = prov.errorMessage;
      // Gunakan Future.microtask atau Delay singkat agar tidak mengganggu render UI
      Future.delayed(Duration.zero, () {
        HapticFeedback.vibrate();
        _showNotification(context, "Validasi Gagal", errMsg, isError: true);
        // Penting: Reset error message di notifier agar tidak trigger berulang kali
        // prov.clearError(); // Pastikan kamu punya method clearError di Notifier
      });
    }
  }

  @override
  void checkVariableBeforeUi(BuildContext context) {}

  @override
  AppBar? appBarBuild(BuildContext context) => null;
}

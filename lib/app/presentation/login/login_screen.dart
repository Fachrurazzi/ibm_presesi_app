import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibm_presensi_app/app/presentation/login/login_notifier.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';

class LoginScreen extends AppWidget<LoginNotifier, void, void> {
  LoginScreen({super.key}) : super(param1: null, param2: null);

  @override
  void checkVariableAfterUi(BuildContext context) {
    // --- LOGIKA NAVIGASI OTOMATIS ---
    if (notifier.onboardingStep.isNotEmpty) {
      HapticFeedback.lightImpact();
      final String route = notifier.onboardingStep;
      notifier.clearOnboardingStep();
      Navigator.pushReplacementNamed(context, route);
    }

    // --- LOGIKA ERROR HANDLER ---
    if (notifier.loginError.isNotEmpty) {
      _showErrorNotification(context, notifier.loginError);
      notifier.loginError = "";
    }
  }

  void _showErrorNotification(BuildContext context, String message) {
    ElegantNotification.error(
      width: MediaQuery.of(context).size.width * 0.9,
      notificationMargin: MediaQuery.of(context).padding.top + 10,
      position: Alignment.topCenter,
      animation: AnimationType.fromTop,
      title: const Text("Akses Ditolak",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      description: Text(message,
          style: const TextStyle(fontSize: 12),
          maxLines: 2,
          overflow: TextOverflow.ellipsis),
      showProgressIndicator: false,
      borderRadius: BorderRadius.circular(15),
      displayCloseButton: false,
    ).show(context);
  }

  @override
  void checkVariableBeforeUi(BuildContext context) {}

  @override
  Widget bodyBuild(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFE),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Stack(
          children: [
            _buildBackgroundDecorator(size, theme),
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildHeader(),
                        const SizedBox(height: 48),
                        _buildInputField(
                          controller: notifier.emailController,
                          label: "Email Karyawan",
                          icon: Icons.alternate_email_rounded,
                          hint: "nama@intibogamandiri.com",
                          keyboardType: TextInputType.emailAddress,
                          textInputAction:
                              TextInputAction.next, // Pindah ke password
                        ),
                        const SizedBox(height: 20),
                        _buildInputField(
                          controller: notifier.passwordController,
                          label: "Kata Sandi",
                          icon: Icons.lock_outline_rounded,
                          hint: "••••••••",
                          isPassword: true,
                          obscureText: !notifier.isShowPassword,
                          onToggleVisible: () => notifier.isShowPassword =
                              !notifier.isShowPassword,
                          textInputAction:
                              TextInputAction.done, // Langsung login
                          onSubmitted: (_) {
                            FocusScope.of(context).unfocus();
                            notifier.login();
                          },
                        ),
                        const SizedBox(height: 48),
                        _buildLoginButton(context, theme),
                        const SizedBox(height: 32),
                        _buildFooter(theme),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundDecorator(Size size, ThemeData theme) {
    return Stack(
      children: [
        Positioned(
          top: -size.width * 0.4,
          right: -size.width * 0.2,
          child: Container(
            width: size.width * 0.8,
            height: size.width * 0.8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  theme.primaryColor.withOpacity(0.12),
                  theme.primaryColor.withOpacity(0.0),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -size.width * 0.3,
          left: -size.width * 0.3,
          child: Container(
            width: size.width * 0.7,
            height: size.width * 0.7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  theme.primaryColor.withOpacity(0.08),
                  theme.primaryColor.withOpacity(0.0),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Hero(
          tag: 'logo_ibm_main',
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.06),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                )
              ],
            ),
            child: Image.asset(
              'assets/images/logo_ibm.png',
              width: 75,
              errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.business_rounded,
                  size: 70,
                  color: Colors.blue),
            ),
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          "IBM Presensi",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 28, letterSpacing: -1),
        ),
        const SizedBox(height: 12),
        const Text(
          "Sistem Kehadiran Internal Karyawan\nPT Intiboga Mandiri",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 13,
              height: 1.6,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context, ThemeData theme) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [theme.primaryColor, theme.primaryColor.withBlue(220)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          if (!notifier.isLoading)
            BoxShadow(
              color: theme.primaryColor.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            )
        ],
      ),
      child: ElevatedButton(
        onPressed: notifier.isLoading
            ? null
            : () {
                FocusScope.of(context).unfocus();
                notifier.login();
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: notifier.isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                    color: Colors.white, strokeWidth: 2))
            : const Text(
                "MASUK KE SISTEM",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1),
              ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required String hint,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onToggleVisible,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    Function(String)? onSubmitted,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 10),
          child: Text(label,
              style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                  color: Colors.black87)),
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          onSubmitted: onSubmitted,
          textInputAction: textInputAction ?? TextInputAction.done,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 14,
                fontWeight: FontWeight.normal),
            prefixIcon: Icon(icon, size: 20, color: Colors.blueGrey.shade300),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                        obscureText
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                        color: Colors.blueGrey.shade300,
                        size: 20),
                    onPressed: onToggleVisible)
                : null,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(20),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(color: Colors.grey.shade100, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(color: Colors.blue, width: 2)),
          ),
        ),
      ],
    );
  }

  Widget _buildFooter(ThemeData theme) {
    return Text(
      "© ${DateTime.now().year} IT Support - PT Intiboga Mandiri",
      style: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 10,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5),
    );
  }

  @override
  AppBar? appBarBuild(BuildContext context) => null;
}

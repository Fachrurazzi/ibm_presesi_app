import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_screen.dart';
import 'package:ibm_presensi_app/app/presentation/login/login_notifier.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';

class LoginScreen extends AppWidget<LoginNotifier, void, void> {
  LoginScreen({super.key}) : super(param1: null, param2: null);

  @override
  void checkVariableAfterUi(BuildContext context) {
    if (notifier.isLoged) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  void checkVariableBeforeUi(BuildContext context) {
    if (notifier.errorMessage.isNotEmpty) {
      final msg = notifier.errorMessage;
      notifier.errorMessage = "";
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(msg),
              backgroundColor: Colors.redAccent,
              behavior: SnackBarBehavior.floating),
        );
      });
    }
  }

  @override
  Widget bodyBuild(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Decoration
          Positioned(
            top: -100,
            right: -50,
            child: CircleAvatar(
                radius: 150,
                backgroundColor: theme.colorScheme.primary.withOpacity(0.05)),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  // Logo Section
                  Hero(
                    tag: 'logo',
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 30,
                              offset: const Offset(0, 10))
                        ],
                      ),
                      child:
                          Image.asset('assets/images/logo_ibm.png', width: 100),
                    ),
                  ),
                  const SizedBox(height: 32),

                  Text("Selamat Datang",
                      style: theme.textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w900)),
                  const SizedBox(height: 8),
                  Text("Silakan login untuk mencatat kehadiran harian Anda",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: Colors.grey)),

                  const SizedBox(height: 48),

                  // Email Field
                  _buildInputField(
                    controller: notifier.emailController,
                    label: "Email Perusahaan",
                    icon: Icons.email_outlined,
                    hint: "user@intiboga.com",
                  ),
                  const SizedBox(height: 20),

                  // Password Field
                  _buildInputField(
                    controller: notifier.passwordController,
                    label: "Kata Sandi",
                    icon: Icons.lock_open_rounded,
                    hint: "••••••••",
                    isPassword: true,
                    obscureText: !notifier.isShowPassword,
                    onToggleVisible: () =>
                        notifier.isShowPassword = !notifier.isShowPassword,
                  ),

                  const SizedBox(height: 40),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 58,
                    child: FilledButton(
                      onPressed:
                          notifier.isLoading ? null : () => notifier.login(),
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        elevation: 0,
                      ),
                      child: notifier.isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                  color: Colors.white, strokeWidth: 3))
                          : const Text("MASUK SEKARANG",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1)),
                    ),
                  ),

                  const SizedBox(height: 40),
                  Text("© 2026 PT Intiboga Mandiri",
                      style: theme.textTheme.labelSmall
                          ?.copyWith(color: Colors.grey.shade400)),
                ],
              ),
            ),
          ),
        ],
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
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(label,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, size: 20),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        size: 20),
                    onPressed: onToggleVisible)
                : null,
            filled: true,
            fillColor: Colors.grey.shade50,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(color: Colors.grey.shade200)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(color: Colors.grey.shade200)),
            contentPadding: const EdgeInsets.all(20),
          ),
        ),
      ],
    );
  }

  @override
  AppBar? appBarBuild(BuildContext context) => null;
}

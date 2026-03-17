import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_screen.dart';
import 'package:ibm_presensi_app/app/presentation/login/login_notifier.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';

class LoginScreen extends AppWidget<LoginNotifier, void, void> {
  LoginScreen({super.key}) : super(param1: null, param2: null);

  @override
  void checkVariableAfterUi(BuildContext context) {
    if (notifier.isLoged) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }

  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        // Tambahkan ini agar tidak error saat keyboard muncul
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // --- BAGIAN LOGO ---
              Image.asset(
                'assets/images/logo_ibm.png',
                width: 250, // Atur ukuran lebar logo
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),

              // Nama Aplikasi di bawah logo
              Text(
                "Intiboga Presensi",
                style: GlobalHelper.getTextStyle(
                  context: context,
                  appTextStyle: AppTextStyle.HEADLINE_SMALL,
                )?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40), // Jarak ke Form
              // --- BAGIAN INPUT ---
              TextField(
                controller: notifier.emailController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),
                  label: const Text('Email Address'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      12,
                    ), // Membuat sudut lebih halus
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: notifier.passwordController,

                obscureText: !notifier.isShowPassword, // Sembunyikan password
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    label: const Text('Password'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    suffixIcon: IconButton(
                        onPressed: _showHidePassword,
                        icon: Icon((notifier.isShowPassword)
                            ? Icons.visibility_off
                            : Icons.visibility))),
              ),
              const SizedBox(height: 32),

              // --- TOMBOL LOGIN ---
              SizedBox(
                width: double.maxFinite,
                height: 50, // Memberi tinggi tombol agar nyaman ditekan
                child: FilledButton(
                  onPressed: () => _onPressLogin(context),
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Log In", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showHidePassword() {
    notifier.isShowPassword = !notifier.isShowPassword;
  }

  void _onPressLogin(BuildContext context) {
    notifier.login();
  }

  @override
  AppBar? appBarBuild(BuildContext context) {
    return null;
  }

  @override
  void checkVariableBeforeUi(BuildContext context) {
    // TODO: implement checkVariableBeforeUi
  }
}

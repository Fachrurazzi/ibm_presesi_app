import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/presentation/navbar/navbar_screen.dart';
import 'package:ibm_presensi_app/app/presentation/login/login_screen.dart';
import 'package:ibm_presensi_app/app/presentation/onboarding/change_password_screen.dart';
import 'package:ibm_presensi_app/app/presentation/face_recognition/face_recognition_screen.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ibm_presensi_app/core/helper/notification_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. INISIALISASI ENGINE (Dijalankan secara Paralel agar cepat)
  await Future.wait([
    initializeDateFormatting('id', null),
    SharedPreferencesHelper
        .init(), // <--- PENTING: Inisialisasi memori lokal di sini
    initDependency(),
    NotificationHelper.initNotification(),
  ]);

  // 2. AMBIL STATUS (Sekarang Instant, tidak butuh await lagi karena sudah di-init)
  final String? token =
      SharedPreferencesHelper.getString(AppPreferences.AUTH_TOKEN);
  final bool isDefaultPass =
      SharedPreferencesHelper.getBool(AppPreferences.IS_DEFAULT_PASSWORD) ??
          false;
  final bool isFaceReg =
      SharedPreferencesHelper.getBool(AppPreferences.IS_FACE_REGISTERED) ??
          false;

  final bool isLoggedIn = token != null && token.isNotEmpty;

  runApp(MyApp(
    isLoggedIn: isLoggedIn,
    isDefaultPass: isDefaultPass,
    isFaceReg: isFaceReg,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final bool isDefaultPass;
  final bool isFaceReg;

  const MyApp({
    super.key,
    required this.isLoggedIn,
    required this.isDefaultPass,
    required this.isFaceReg,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IBM Presensi',

      // KONFIGURASI TEMA PROFESIONAL IBM
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF1D4E89),
        brightness: Brightness.light,
        fontFamily: 'SF-Pro',
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          surfaceTintColor: Colors.transparent,
        ),
      ),

      // ENTRY POINT: Menentukan layar awal dengan logika Guard
      home: _getInitialScreen(),

      // NAMED ROUTES: Sinkronkan dengan tombol navigasi
      routes: {
        '/login': (context) => LoginScreen(),
        '/change-password': (context) => ChangePasswordScreen(),
        '/face-recognition': (context) => FaceRecognitionScreen(),
        '/main-navbar': (context) => const NavbarScreen(),
      },
    );
  }

  /// LOGIKA NAVIGASI BERJENJANG (Security & Onboarding Guard)
  Widget _getInitialScreen() {
    if (!isLoggedIn) return LoginScreen();
    if (isDefaultPass) return ChangePasswordScreen();
    if (!isFaceReg) return FaceRecognitionScreen();

    return const NavbarScreen();
  }
}

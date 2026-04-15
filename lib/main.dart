import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart'; // PENTING
import 'package:ibm_presensi_app/app/presentation/navbar/navbar_screen.dart';
import 'package:ibm_presensi_app/app/presentation/login/login_screen.dart';
import 'package:ibm_presensi_app/app/presentation/onboarding/change_password_screen.dart';
import 'package:ibm_presensi_app/app/presentation/face_recognition/face_recognition_screen.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/profile/profile_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/leave/leave_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/detail_attendance/detail_attendance_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/login/login_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/onboarding/change_password_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/map/map_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/face_recognition/face_recognition_notifier.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ibm_presensi_app/core/helper/notification_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  // 1. INISIALISASI ENGINE
  await Future.wait([
    initializeDateFormatting('id', null),
    SharedPreferencesHelper.init(),
    initDependency(),
    NotificationHelper.initNotification(),
  ]);

  // 2. AMBIL STATUS AUTH
  final String? token =
      SharedPreferencesHelper.getString(AppPreferences.AUTH_TOKEN);
  final bool isDefaultPass =
      SharedPreferencesHelper.getBool(AppPreferences.IS_DEFAULT_PASSWORD) ??
          false;
  final bool isFaceReg =
      SharedPreferencesHelper.getBool(AppPreferences.IS_FACE_REGISTERED) ??
          false;

  final bool isLoggedIn = token != null && token.isNotEmpty;

  // 3. JALANKAN APP DENGAN MULTIPROVIDER GLOBAL
  runApp(
    MultiProvider(
      providers: [
        // Gunakan .value untuk Singleton (Tetap hidup di background)
        ChangeNotifierProvider.value(value: sl<HomeNotifier>()),
        ChangeNotifierProvider.value(value: sl<ProfileNotifier>()),

        // Gunakan create untuk Factory (Reset setiap kali route dipanggil)
        ChangeNotifierProvider(create: (_) => sl<LoginNotifier>()),
        ChangeNotifierProvider(create: (_) => sl<ChangePasswordNotifier>()),
        ChangeNotifierProvider(create: (_) => sl<MapNotifier>()),
        ChangeNotifierProvider(create: (_) => sl<DetailAttendanceNotifier>()),
        ChangeNotifierProvider(create: (_) => sl<FaceRecognitionNotifier>()),
        ChangeNotifierProvider(create: (_) => sl<LeaveNotifier>()),
      ],
      child: MyApp(
        isLoggedIn: isLoggedIn,
        isDefaultPass: isDefaultPass,
        isFaceReg: isFaceReg,
      ),
    ),
  );
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
      home: _getInitialScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/change-password': (context) => ChangePasswordScreen(),
        '/face-recognition': (context) => FaceRecognitionScreen(),
        '/main-navbar': (context) => const NavbarScreen(),
      },
    );
  }

  Widget _getInitialScreen() {
    if (!isLoggedIn) return LoginScreen();
    if (isDefaultPass) return ChangePasswordScreen();
    if (!isFaceReg) return FaceRecognitionScreen();

    return const NavbarScreen();
  }
}

  import 'package:flutter/material.dart';
  import 'package:ibm_presensi_app/app/presentation/home/home_screen.dart';
  import 'package:ibm_presensi_app/app/presentation/login/login_screen.dart';
  import 'package:ibm_presensi_app/core/constant/constant.dart';
  import 'package:ibm_presensi_app/core/di/dependency.dart';
  import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
  import 'package:intl/date_symbol_data_local.dart';
  import 'package:ibm_presensi_app/core/helper/notification_helper.dart';

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initializeDateFormatting('id', null);
    await initDependency();
    await NotificationHelper.initNotification();

    // 1. Cek Token Auth dari SharedPreferences
    final String? token = await SharedPreferencesHelper.getString(PREF_AUTH);
    final bool isLoggedIn = token != null && token.isNotEmpty;

    // 2. Lempar status login ke MyApp
    runApp(MyApp(isLoggedIn: isLoggedIn));
  }

  class MyApp extends StatelessWidget {
    final bool isLoggedIn;
    const MyApp({super.key, required this.isLoggedIn});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.red,
        ),
        title: 'IBM Presensi',
        // 3. Pintasan Layar: Langsung ke Home jika sudah login!
        home: isLoggedIn ? HomeScreen() : LoginScreen(),
      );
    }
  }

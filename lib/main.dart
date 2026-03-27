import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_screen.dart';
import 'package:ibm_presensi_app/app/presentation/login/login_screen.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ibm_presensi_app/core/helper/notification_helper.dart';

void main() async {
  // Wajib dipanggil sebelum melakukan operasi async di main
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi format tanggal Indonesia (Penting untuk DateTimeHelper)
  await initializeDateFormatting('id', null);

  // Inisialisasi Service Locator (GetIt)
  await initDependency();

  // Inisialisasi Notifikasi Lokal
  await NotificationHelper.initNotification();

  // 1. Cek Token Auth dari SharedPreferences secara aman
  final String? token = await SharedPreferencesHelper.getString(AppPreferences.AUTH_TOKEN);
  final bool isLoggedIn = token != null && token.isNotEmpty;

  // 2. Jalankan aplikasi dengan membawa status login
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IBM Presensi',
      theme: ThemeData(
        useMaterial3: true,
        // PT INTIBOGA MANDIRI identik dengan warna Merah,
        // colorSchemeSeed akan otomatis membuat palet warna yang serasi.
        colorSchemeSeed: Colors.red,
        // Menambahkan font global jika perlu (misal: Poppins/Roboto)
        brightness: Brightness.light,
      ),
      // 3. Penentuan Halaman Utama:
      // Jika token ada, langsung ke Dashboard (HomeScreen)
      home: isLoggedIn ? HomeScreen() : LoginScreen(),
    );
  }
}

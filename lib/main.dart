import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibm_presensi_app/app/presentation/common/attendance/face_recognation/face_recognition_screen.dart';
import 'package:ibm_presensi_app/app/presentation/common/permission/create/permission_create_screen.dart';
import 'package:ibm_presensi_app/app/presentation/common/permission/detail/permission_detail_screen.dart';
import 'package:ibm_presensi_app/app/presentation/navbar/admin_navbar.dart';
import 'package:ibm_presensi_app/app/presentation/navbar/manager_navbar.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

// Core
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/helper/notification_helper.dart';
import 'package:ibm_presensi_app/core/network/app_interceptor.dart';
import 'package:ibm_presensi_app/core/router/navbar_router.dart';

// Presentation - Auth
import 'package:ibm_presensi_app/app/presentation/auth/login/login_screen.dart';
import 'package:ibm_presensi_app/app/presentation/auth/login/login_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/auth/change_password/change_password_screen.dart';
import 'package:ibm_presensi_app/app/presentation/auth/change_password/change_password_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/auth/forgot_password/forgot_password_screen.dart';
import 'package:ibm_presensi_app/app/presentation/auth/forgot_password/forgot_password_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/auth/register_face/register_face_screen.dart';
import 'package:ibm_presensi_app/app/presentation/auth/register_face/register_face_notifier.dart';

// Presentation - User
import 'package:ibm_presensi_app/app/presentation/common/dashboard/dashboard_screen.dart';
import 'package:ibm_presensi_app/app/presentation/common/dashboard/dashboard_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/navbar/user_navbar.dart';
import 'package:ibm_presensi_app/app/presentation/common/attendance/map/map_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/common/attendance/map/map_screen.dart';
import 'package:ibm_presensi_app/app/presentation/common/attendance/check_in_out/check_in_out_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/common/attendance/check_in_out/check_in_out_screen.dart';
import 'package:ibm_presensi_app/app/presentation/common/attendance/history/history_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/common/attendance/history/history_screen.dart';
import 'package:ibm_presensi_app/app/presentation/common/leave/list/leave_list_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/common/leave/list/leave_list_screen.dart';
import 'package:ibm_presensi_app/app/presentation/common/leave/create/leave_create_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/common/leave/create/leave_create_screen.dart';
import 'package:ibm_presensi_app/app/presentation/common/leave/detail/leave_detail_screen.dart';
import 'package:ibm_presensi_app/app/presentation/common/permission/list/permission_list_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/common/permission/list/permission_list_screen.dart';
import 'package:ibm_presensi_app/app/presentation/common/permission/create/permission_create_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/common/profile/profile_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/common/profile/profile_screen.dart';

// Presentation - Manager
import 'package:ibm_presensi_app/app/presentation/manager/team_dashboard/team_dashboard_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/manager/team_dashboard/team_dashboard_screen.dart';
import 'package:ibm_presensi_app/app/presentation/manager/team_attendance/team_attendance_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/manager/team_attendance/team_attendance_screen.dart';
import 'package:ibm_presensi_app/app/presentation/manager/approval/leave_approval/leave_approval_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/manager/approval/leave_approval/leave_approval_screen.dart';
import 'package:ibm_presensi_app/app/presentation/manager/approval/permission_approval/permission_approval_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/manager/approval/permission_approval/permission_approval_screen.dart';

// Presentation - Admin
import 'package:ibm_presensi_app/app/presentation/admin/dashboard/admin_dashboard_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/admin/dashboard/admin_dashboard_screen.dart';
import 'package:ibm_presensi_app/app/presentation/admin/user_management/user_management_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/admin/user_management/user_management_screen.dart';
import 'package:ibm_presensi_app/app/presentation/admin/office_management/office_management_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/admin/office_management/office_management_screen.dart';
import 'package:ibm_presensi_app/app/presentation/admin/position_management/position_management_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/admin/position_management/position_management_screen.dart';
import 'package:ibm_presensi_app/app/presentation/admin/shift_management/shift_management_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/admin/shift_management/shift_management_screen.dart';
import 'package:ibm_presensi_app/app/presentation/admin/schedule_management/schedule_management_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/admin/schedule_management/schedule_management_screen.dart';
import 'package:ibm_presensi_app/app/presentation/admin/report/report_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/admin/report/report_screen.dart';

// 🆕 Global navigator key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set system UI style
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  // Force portrait orientation only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // 1. INISIALISASI ENGINE
  await Future.wait([
    initializeDateFormatting('id_ID', null),
    SharedPreferencesHelper.init(),
    initDependency(),
    NotificationHelper.initNotification(),
  ]);

  // 🆕 Setup navigasi untuk 401/403
  AppInterceptor.onUnauthorized = () {
    navigatorKey.currentState
        ?.pushNamedAndRemoveUntil('/login', (route) => false);
  };

  // 2. AMBIL STATUS AUTH
  final token = SharedPreferencesHelper.getString(AppPreferences.AUTH_TOKEN);
  final isDefaultPass = SharedPreferencesHelper.getBoolOrDefault(
    AppPreferences.IS_DEFAULT_PASSWORD,
    defaultValue: false,
  );
  final isFaceRegistered = SharedPreferencesHelper.getBoolOrDefault(
    AppPreferences.IS_FACE_REGISTERED,
    defaultValue: false,
  );
  final isBanned = SharedPreferencesHelper.getBoolOrDefault(
    AppPreferences.IS_BANNED,
    defaultValue: false,
  );

  final isLoggedIn = token != null && token.isNotEmpty;

  // Jika user di-banned, force logout
  if (isBanned && isLoggedIn) {
    await SharedPreferencesHelper.logout();
  }

  // 3. JALANKAN APP DENGAN MULTIPROVIDER GLOBAL
  runApp(
    MultiProvider(
      providers: [
        // ===== SINGLETON PROVIDERS =====
        ChangeNotifierProvider.value(value: sl<DashboardNotifier>()),
        ChangeNotifierProvider.value(value: sl<ProfileNotifier>()),

        // ===== FACTORY PROVIDERS =====
        // Auth
        ChangeNotifierProvider(create: (_) => sl<LoginNotifier>()),
        ChangeNotifierProvider(create: (_) => sl<ChangePasswordNotifier>()),
        ChangeNotifierProvider(create: (_) => sl<ForgotPasswordNotifier>()),
        ChangeNotifierProvider(create: (_) => sl<RegisterFaceNotifier>()),

        // Attendance
        ChangeNotifierProvider(create: (_) => sl<CheckInOutNotifier>()),
        ChangeNotifierProvider(create: (_) => sl<MapNotifier>()),
        ChangeNotifierProvider(create: (_) => sl<HistoryNotifier>()),

        // Leave
        ChangeNotifierProvider(create: (_) => sl<LeaveListNotifier>()),
        ChangeNotifierProvider(create: (_) => sl<LeaveCreateNotifier>()),

        // Permission
        ChangeNotifierProvider(create: (_) => sl<PermissionListNotifier>()),
        ChangeNotifierProvider(create: (_) => sl<PermissionCreateNotifier>()),

        // Manager
        ChangeNotifierProvider(create: (_) => sl<TeamDashboardNotifier>()),
        ChangeNotifierProvider(create: (_) => sl<TeamAttendanceNotifier>()),
        ChangeNotifierProvider(create: (_) => sl<LeaveApprovalNotifier>()),
        ChangeNotifierProvider(create: (_) => sl<PermissionApprovalNotifier>()),

        // Admin
        ChangeNotifierProvider(create: (_) => sl<AdminDashboardNotifier>()),
        ChangeNotifierProvider(create: (_) => sl<UserManagementNotifier>()),
        ChangeNotifierProvider(create: (_) => sl<OfficeManagementNotifier>()),
        ChangeNotifierProvider(create: (_) => sl<PositionManagementNotifier>()),
        ChangeNotifierProvider(create: (_) => sl<ShiftManagementNotifier>()),
        ChangeNotifierProvider(create: (_) => sl<ScheduleManagementNotifier>()),
        ChangeNotifierProvider(create: (_) => sl<ReportNotifier>()),
      ],
      child: MyApp(
        isLoggedIn: isLoggedIn && !isBanned,
        isDefaultPass: isDefaultPass,
        isFaceRegistered: isFaceRegistered,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final bool isDefaultPass;
  final bool isFaceRegistered;

  const MyApp({
    super.key,
    required this.isLoggedIn,
    required this.isDefaultPass,
    required this.isFaceRegistered,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey, // 🆕
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
          foregroundColor: Colors.black87,
          surfaceTintColor: Colors.transparent,
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 52),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            textStyle:
                const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey.shade50,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF1D4E89), width: 2),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF1D4E89),
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
      initialRoute: _getInitialRoute(),
      routes: {
        // ========== AUTH ==========
        '/login': (context) => LoginScreen(),
        '/forgot-password': (context) => ForgotPasswordScreen(),
        '/change-password': (context) => ChangePasswordScreen(),
        '/register-face': (context) => RegisterFaceScreen(),

        // ========== USER ==========
        '/user-navbar': (context) => const UserNavbar(),
        '/dashboard': (context) => DashboardScreen(),
        '/profile': (context) => ProfileScreen(),
        '/map': (context) => MapScreen(),
        '/check-in-out': (context) => CheckInOutScreen(),
        '/history': (context) => HistoryScreen(),
        '/leave-list': (context) => LeaveListScreen(),
        '/leave-create': (context) => LeaveCreateScreen(),
        '/permission-list': (context) => PermissionListScreen(),
        '/permission-create': (context) => PermissionCreateScreen(),

        // ========== MANAGER ==========
        '/manager-navbar': (context) => const ManagerNavbar(),
        '/team-dashboard': (context) => TeamDashboardScreen(),
        '/team-attendance': (context) => TeamAttendanceScreen(),
        '/leave-approval': (context) => LeaveApprovalScreen(),
        '/permission-approval': (context) => PermissionApprovalScreen(),

        // ========== ADMIN ==========
        '/admin-navbar': (context) => const AdminNavbar(),
        '/admin-dashboard': (context) => AdminDashboardScreen(),
        '/user-management': (context) => UserManagementScreen(),
        '/office-management': (context) => OfficeManagementScreen(),
        '/position-management': (context) => PositionManagementScreen(),
        '/shift-management': (context) => ShiftManagementScreen(),
        '/schedule-management': (context) => ScheduleManagementScreen(),
        '/report': (context) => ReportScreen(),

        '/face-recognition': (context) => const FaceRecognitionScreen(),
      },
      onGenerateRoute: (settings) {
        // Dynamic routes with parameters
        if (settings.name == '/leave-detail') {
          final args = settings.arguments as Map<String, dynamic>?;
          final leaveId = args?['id'] as int? ?? 0;
          return MaterialPageRoute(
            builder: (context) => LeaveDetailScreen(leaveId: leaveId),
          );
        }
        if (settings.name == '/permission-detail') {
          final args = settings.arguments as Map<String, dynamic>?;
          final permissionId = args?['id'] as int? ?? 0;
          return MaterialPageRoute(
            builder: (context) =>
                PermissionDetailScreen(permissionId: permissionId),
          );
        }
        return null;
      },
    );
  }

  String _getInitialRoute() {
    if (!isLoggedIn) return '/login';
    if (isDefaultPass) return '/change-password';
    if (!isFaceRegistered) return '/register-face';

    // Cek role dari session untuk menentukan navbar
    final session = SharedPreferencesHelper.getUserSession();

    if (session != null) {
      if (session.isAdmin) return '/admin-navbar';
      if (session.isManager) return '/manager-navbar';
    }

    return '/user-navbar';
  }
}

import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:ibm_presensi_app/app/module/use_case/permission_check_use_case.dart';
import 'package:ibm_presensi_app/app/presentation/common/attendance/face_recognation/face_recognition_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// Core
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/network/app_interceptor.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';

// ==========================================
// API SERVICES (Data Sources)
// ==========================================
import 'package:ibm_presensi_app/app/data/source/auth_api_service.dart';
import 'package:ibm_presensi_app/app/data/source/attendance_api_service.dart';
import 'package:ibm_presensi_app/app/data/source/leave_api_service.dart';
import 'package:ibm_presensi_app/app/data/source/permission_api_service.dart';
import 'package:ibm_presensi_app/app/data/source/user_api_service.dart';
import 'package:ibm_presensi_app/app/data/source/schedule_api_service.dart';
import 'package:ibm_presensi_app/app/data/source/dashboard_api_service.dart';
import 'package:ibm_presensi_app/app/data/source/office_api_service.dart';
import 'package:ibm_presensi_app/app/data/source/position_api_service.dart';
import 'package:ibm_presensi_app/app/data/source/shift_api_service.dart';

// ==========================================
// REPOSITORY IMPLEMENTATIONS (Data Layer)
// ==========================================
import 'package:ibm_presensi_app/app/data/repository/auth_repository_impl.dart';
import 'package:ibm_presensi_app/app/data/repository/attendance_repository_impl.dart';
import 'package:ibm_presensi_app/app/data/repository/leave_repository_impl.dart';
import 'package:ibm_presensi_app/app/data/repository/permission_repository_impl.dart';
import 'package:ibm_presensi_app/app/data/repository/user_repository_impl.dart';
import 'package:ibm_presensi_app/app/data/repository/schedule_repository_impl.dart';
import 'package:ibm_presensi_app/app/data/repository/dashboard_repository_impl.dart';
import 'package:ibm_presensi_app/app/data/repository/office_repository_impl.dart';
import 'package:ibm_presensi_app/app/data/repository/position_repository_impl.dart';
import 'package:ibm_presensi_app/app/data/repository/shift_repository_impl.dart';

// ==========================================
// REPOSITORY INTERFACES (Domain Layer)
// ==========================================
import 'package:ibm_presensi_app/app/module/repository/auth_repository.dart';
import 'package:ibm_presensi_app/app/module/repository/attendance_repository.dart';
import 'package:ibm_presensi_app/app/module/repository/leave_repository.dart';
import 'package:ibm_presensi_app/app/module/repository/permission_repository.dart';
import 'package:ibm_presensi_app/app/module/repository/user_repository.dart';
import 'package:ibm_presensi_app/app/module/repository/schedule_repository.dart';
import 'package:ibm_presensi_app/app/module/repository/dashboard_repository.dart';
import 'package:ibm_presensi_app/app/module/repository/office_repository.dart';
import 'package:ibm_presensi_app/app/module/repository/position_repository.dart';
import 'package:ibm_presensi_app/app/module/repository/shift_repository.dart';

// ==========================================
// USE CASES - Auth
// ==========================================
import 'package:ibm_presensi_app/app/module/use_case/auth_login_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/auth_get_me_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/auth_logout_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/auth_logout_all_use_case.dart'; // 🆕
import 'package:ibm_presensi_app/app/module/use_case/auth_update_password_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/auth_register_face_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/auth_forgot_password_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/auth_reset_password_use_case.dart';

// ==========================================
// USE CASES - Attendance
// ==========================================
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_today_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_history_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_summary_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_this_month_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_check_in_out_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_schedule_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_report_suspicious_use_case.dart';

// ==========================================
// USE CASES - Leave
// ==========================================
import 'package:ibm_presensi_app/app/module/use_case/leave_get_list_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/leave_get_detail_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/leave_get_types_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/leave_get_quota_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/leave_create_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/leave_cancel_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/leave_update_status_use_case.dart';

// ==========================================
// USE CASES - Permission
// ==========================================
import 'package:ibm_presensi_app/app/module/use_case/permission_get_list_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/permission_get_detail_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/permission_get_types_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/permission000_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/permission_create_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/permission_cancel_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/permission_update_status_use_case.dart';

// ==========================================
// USE CASES - User
// ==========================================
import 'package:ibm_presensi_app/app/module/use_case/user_get_profile_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/user_update_profile_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/user_get_photo_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/user_delete_photo_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/user_get_schedule_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/user_get_today_schedule_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/user_get_leave_summary_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/user_get_this_year_leave_summary_use_case.dart'; // 🆕
import 'package:ibm_presensi_app/app/module/use_case/user_update_fcm_token_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/user_update_location_use_case.dart';

// ==========================================
// USE CASES - Dashboard
// ==========================================
import 'package:ibm_presensi_app/app/module/use_case/dashboard_get_stats_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/dashboard_get_monthly_summary_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/dashboard_get_this_month_summary_use_case.dart'; // 🆕
import 'package:ibm_presensi_app/app/module/use_case/dashboard_get_recent_activities_use_case.dart';

// ==========================================
// USE CASES - Master Data
// ==========================================
import 'package:ibm_presensi_app/app/module/use_case/office_get_list_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/office_get_nearest_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/office_check_radius_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/position_get_list_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/shift_get_list_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/shift_get_detail_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_get_list_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_get_by_user_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_create_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_ban_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_unban_use_case.dart';

// ==========================================
// USE CASES - User Location
// ==========================================
import 'package:ibm_presensi_app/app/module/use_case/get_user_locations_use_case.dart';

// ==========================================
// NOTIFIERS - Auth
// ==========================================
import 'package:ibm_presensi_app/app/presentation/auth/login/login_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/auth/change_password/change_password_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/auth/forgot_password/forgot_password_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/auth/register_face/register_face_notifier.dart';

// ==========================================
// NOTIFIERS - User
// ==========================================
import 'package:ibm_presensi_app/app/presentation/common/dashboard/dashboard_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/common/profile/profile_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/common/attendance/check_in_out/check_in_out_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/common/attendance/map/map_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/common/attendance/history/history_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/common/leave/list/leave_list_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/common/leave/create/leave_create_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/common/permission/list/permission_list_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/common/permission/create/permission_create_notifier.dart';

// ==========================================
// NOTIFIERS - Manager
// ==========================================
import 'package:ibm_presensi_app/app/presentation/manager/team_dashboard/team_dashboard_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/manager/team_attendance/team_attendance_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/manager/approval/leave_approval/leave_approval_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/manager/approval/permission_approval/permission_approval_notifier.dart';

// ==========================================
// NOTIFIERS - Admin
// ==========================================
import 'package:ibm_presensi_app/app/presentation/admin/dashboard/admin_dashboard_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/admin/user_management/user_management_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/admin/office_management/office_management_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/admin/position_management/position_management_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/admin/shift_management/shift_management_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/admin/schedule_management/schedule_management_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/admin/report/report_notifier.dart';

// ==========================================
// NOTIFIERS - Face Recognition
// ==========================================

final sl = GetIt.instance;

Future<void> initDependency() async {
  // ==========================================
  // 1. CORE & NETWORK
  // ==========================================
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  await SharedPreferencesHelper.init();

  sl.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.BASE_URL,
        connectTimeout: const Duration(seconds: AppConfig.connectTimeout),
        receiveTimeout: const Duration(seconds: AppConfig.receiveTimeout),
        validateStatus: (status) => status! < 500,
      ),
    );

    dio.interceptors.addAll([
      AppInterceptor(),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        compact: true,
      ),
    ]);

    return dio;
  });

  // ==========================================
  // 2. API SERVICES (Data Sources)
  // ==========================================
  sl.registerLazySingleton<AuthApiService>(() => AuthApiService(sl()));
  sl.registerLazySingleton<AttendanceApiService>(
      () => AttendanceApiService(sl()));
  sl.registerLazySingleton<LeaveApiService>(() => LeaveApiService(sl()));
  sl.registerLazySingleton<PermissionApiService>(
      () => PermissionApiService(sl()));
  sl.registerLazySingleton<UserApiService>(() => UserApiService(sl()));
  sl.registerLazySingleton<ScheduleApiService>(() => ScheduleApiService(sl()));
  sl.registerLazySingleton<DashboardApiService>(
      () => DashboardApiService(sl()));
  sl.registerLazySingleton<OfficeApiService>(() => OfficeApiService(sl()));
  sl.registerLazySingleton<PositionApiService>(() => PositionApiService(sl()));
  sl.registerLazySingleton<ShiftApiService>(() => ShiftApiService(sl()));

  // ==========================================
  // 3. REPOSITORY IMPLEMENTATIONS
  // ==========================================
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<AttendanceRepository>(
      () => AttendanceRepositoryImpl(sl()));
  sl.registerLazySingleton<LeaveRepository>(() => LeaveRepositoryImpl(sl()));
  sl.registerLazySingleton<PermissionRepository>(
      () => PermissionRepositoryImpl(sl()));
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));
  sl.registerLazySingleton<ScheduleRepository>(
      () => ScheduleRepositoryImpl(sl()));
  sl.registerLazySingleton<DashboardRepository>(
      () => DashboardRepositoryImpl(sl()));
  sl.registerLazySingleton<OfficeRepository>(() => OfficeRepositoryImpl(sl()));
  sl.registerLazySingleton<PositionRepository>(
      () => PositionRepositoryImpl(sl()));
  sl.registerLazySingleton<ShiftRepository>(() => ShiftRepositoryImpl(sl()));

  // ==========================================
  // 4. USE CASES
  // ==========================================
  // Auth
  sl.registerLazySingleton(() => AuthLoginUseCase(sl()));
  sl.registerLazySingleton(() => AuthGetMeUseCase(sl()));
  sl.registerLazySingleton(() => AuthLogoutUseCase(sl()));
  sl.registerLazySingleton(() => AuthLogoutAllUseCase(sl()));
  sl.registerLazySingleton(() => AuthUpdatePasswordUseCase(sl()));
  sl.registerLazySingleton(() => AuthRegisterFaceUseCase(sl()));
  sl.registerLazySingleton(() => AuthForgotPasswordUseCase(sl()));
  sl.registerLazySingleton(() => AuthResetPasswordUseCase(sl()));

  // Attendance
  sl.registerLazySingleton(() => AttendanceGetTodayUseCase(sl()));
  sl.registerLazySingleton(() => AttendanceGetHistoryUseCase(sl()));
  sl.registerLazySingleton(() => AttendanceGetSummaryUseCase(sl()));
  sl.registerLazySingleton(() => AttendanceGetThisMonthUseCase(sl()));
  sl.registerLazySingleton(() => AttendanceCheckInOutUseCase(sl()));
  sl.registerLazySingleton(() => AttendanceGetScheduleUseCase(sl()));
  sl.registerLazySingleton(() => AttendanceReportSuspiciousUseCase(sl()));

  // Leave
  sl.registerLazySingleton(() => LeaveGetListUseCase(sl()));
  sl.registerLazySingleton(() => LeaveGetDetailUseCase(sl()));
  sl.registerLazySingleton(() => LeaveGetTypesUseCase(sl()));
  sl.registerLazySingleton(() => LeaveGetQuotaUseCase(sl()));
  sl.registerLazySingleton(() => LeaveCreateUseCase(sl()));
  sl.registerLazySingleton(() => LeaveCancelUseCase(sl()));
  sl.registerLazySingleton(() => LeaveUpdateStatusUseCase(sl()));

  // Permission
  sl.registerLazySingleton(() => PermissionGetListUseCase(sl()));
  sl.registerLazySingleton(() => PermissionGetDetailUseCase(sl()));
  sl.registerLazySingleton(() => PermissionGetTypesUseCase(sl()));
  sl.registerLazySingleton(() => PermissionCheckUseCase(sl()));
  sl.registerLazySingleton(() => PermissionCreateUseCase(sl()));
  sl.registerLazySingleton(() => PermissionCancelUseCase(sl()));
  sl.registerLazySingleton(() => PermissionUpdateStatusUseCase(sl()));

  // User
  sl.registerLazySingleton(() => UserGetProfileUseCase(sl()));
  sl.registerLazySingleton(() => UserUpdateProfileUseCase(sl()));
  sl.registerLazySingleton(() => UserGetPhotoUseCase(sl()));
  sl.registerLazySingleton(() => UserDeletePhotoUseCase(sl()));
  sl.registerLazySingleton(() => UserGetScheduleUseCase(sl()));
  sl.registerLazySingleton(() => UserGetTodayScheduleUseCase(sl()));
  sl.registerLazySingleton(() => UserGetLeaveSummaryUseCase(sl()));
  sl.registerLazySingleton(() => UserGetThisYearLeaveSummaryUseCase(sl()));
  sl.registerLazySingleton(() => UserUpdateFcmTokenUseCase(sl()));
  sl.registerLazySingleton(() => UserUpdateLocationUseCase(sl()));

  // Dashboard
  sl.registerLazySingleton(() => DashboardGetStatsUseCase(sl()));
  sl.registerLazySingleton(() => DashboardGetMonthlySummaryUseCase(sl()));
  sl.registerLazySingleton(() => DashboardGetThisMonthSummaryUseCase(sl()));
  sl.registerLazySingleton(() => DashboardGetRecentActivitiesUseCase(sl()));

  // Master Data
  sl.registerLazySingleton(() => OfficeGetListUseCase(sl()));
  sl.registerLazySingleton(() => OfficeGetNearestUseCase(sl()));
  sl.registerLazySingleton(() => OfficeCheckRadiusUseCase(sl()));
  sl.registerLazySingleton(() => PositionGetListUseCase(sl()));
  sl.registerLazySingleton(() => ShiftGetListUseCase(sl()));
  sl.registerLazySingleton(() => ShiftGetDetailUseCase(sl()));
  sl.registerLazySingleton(() => ScheduleGetListUseCase(sl()));
  sl.registerLazySingleton(() => ScheduleGetByUserUseCase(sl()));
  sl.registerLazySingleton(() => ScheduleCreateUseCase(sl()));
  sl.registerLazySingleton(() => ScheduleBanUseCase(sl()));
  sl.registerLazySingleton(() => ScheduleUnbanUseCase(sl()));

  // User Location
  sl.registerLazySingleton(() => GetAllUserLocationsUseCase(sl()));
  sl.registerLazySingleton(() => GetTeamLocationsUseCase(sl()));
  sl.registerLazySingleton(() => GetUserLocationUseCase(sl()));

  // ==========================================
  // 5. NOTIFIERS (Presentation Layer)
  // ==========================================

  // Auth Notifiers
  sl.registerFactory(() => LoginNotifier(sl()));
  sl.registerFactory(() => ChangePasswordNotifier(sl()));
  sl.registerFactory(() => ForgotPasswordNotifier(sl()));
  sl.registerFactory(() => RegisterFaceNotifier(sl(), sl()));

  // User Notifiers
  sl.registerFactory(
      () => DashboardNotifier(sl(), sl(), sl(), sl(), sl(), sl()));
  sl.registerFactory(() => ProfileNotifier(sl()));
  sl.registerFactory(() => CheckInOutNotifier(sl(), sl(), sl()));
  sl.registerFactory(() => MapNotifier(sl(), sl(), sl(), sl()));
  sl.registerFactory(() => HistoryNotifier(sl(), sl()));
  sl.registerFactory(() => LeaveListNotifier(sl(), sl(), sl()));
  sl.registerFactory(() => LeaveCreateNotifier(sl(), sl()));
  sl.registerFactory(() => PermissionListNotifier(sl(), sl()));
  sl.registerFactory(() => PermissionCreateNotifier(sl(), sl()));

  // Manager Notifiers
  sl.registerFactory(() => TeamDashboardNotifier(sl()));
  sl.registerFactory(() => TeamAttendanceNotifier(sl(), sl()));
  sl.registerFactory(() => LeaveApprovalNotifier(sl(), sl()));
  sl.registerFactory(() => PermissionApprovalNotifier(sl(), sl()));

  // Admin Notifiers
  sl.registerFactory(() => AdminDashboardNotifier(sl(), sl()));
  sl.registerFactory(() => UserManagementNotifier(sl()));
  sl.registerFactory(() => OfficeManagementNotifier(sl()));
  sl.registerFactory(() => PositionManagementNotifier(sl()));
  sl.registerFactory(() => ShiftManagementNotifier(sl()));
  sl.registerFactory(() => ScheduleManagementNotifier(sl()));
  sl.registerFactory(() => ReportNotifier(sl()));

  // Face Recognition
  sl.registerFactory(() => FaceRecognitionNotifier(sl()));
}

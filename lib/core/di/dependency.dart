import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

// Source & API Services
import 'package:ibm_presensi_app/app/data/source/attendance_api_service.dart';
import 'package:ibm_presensi_app/app/data/source/auth_api_service.dart';
import 'package:ibm_presensi_app/app/data/source/leave_api_service.dart';
import 'package:ibm_presensi_app/app/data/source/profile_api_service.dart';
import 'package:ibm_presensi_app/app/data/source/schedule_api_service.dart';

// Repositories (Data Layer)
import 'package:ibm_presensi_app/app/data/repository/attendance_repository.dart';
import 'package:ibm_presensi_app/app/data/repository/auth_repository.dart';
import 'package:ibm_presensi_app/app/data/repository/leave_repository.dart';
import 'package:ibm_presensi_app/app/data/repository/profile_repository.dart';
import 'package:ibm_presensi_app/app/data/repository/schedule_repository.dart';

// Repositories (Domain Layer Interface)
import 'package:ibm_presensi_app/app/module/repository/attendance_repository.dart';
import 'package:ibm_presensi_app/app/module/repository/auth_repository.dart';
import 'package:ibm_presensi_app/app/module/repository/leave_repository.dart';
import 'package:ibm_presensi_app/app/module/repository/profile_repository.dart';
import 'package:ibm_presensi_app/app/module/repository/schedule_repository.dart';

// Use Cases
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_by_month_year.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_this_month.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_send.dart';
import 'package:ibm_presensi_app/app/module/use_case/auth_login.dart';
import 'package:ibm_presensi_app/app/module/use_case/auth_update_password.dart'; // BARU
import 'package:ibm_presensi_app/app/module/use_case/auth_register_face.dart'; // BARU
import 'package:ibm_presensi_app/app/module/use_case/leave_get_history.dart';
import 'package:ibm_presensi_app/app/module/use_case/leave_send.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_banned.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_get.dart';
import 'package:ibm_presensi_app/app/module/use_case/update_profile.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_today.dart';
import 'package:ibm_presensi_app/app/module/use_case/profile_get_photo.dart';

// Notifiers
import 'package:ibm_presensi_app/app/presentation/detail_attendance/detail_attendance_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/face_recognition/face_recognition_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/leave/leave_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/login/login_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/onboarding/change_password_notifier.dart'; // BARU
import 'package:ibm_presensi_app/app/presentation/map/map_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/profile/profile_notifier.dart';

// Core
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/network/app_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final sl = GetIt.instance;

Future<void> initDependency() async {
  // ==========================================
  // 1. CORE & NETWORK (Pondasi)
  // ==========================================
  sl.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.BASE_URL,
        connectTimeout:
            const Duration(seconds: 15), // Dipercepat agar responsif
        receiveTimeout: const Duration(seconds: 15),
        validateStatus: (status) =>
            status! < 500, // Handle error manual di Interceptor
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
  // 2. DATA SOURCES (API Services)
  // ==========================================
  sl.registerLazySingleton<AuthApiService>(() => AuthApiService(sl()));
  sl.registerLazySingleton<AttendanceApiService>(
      () => AttendanceApiService(sl()));
  sl.registerLazySingleton<ScheduleApiService>(() => ScheduleApiService(sl()));
  sl.registerLazySingleton<LeaveApiService>(() => LeaveApiService(sl()));
  sl.registerLazySingleton<ProfileApiService>(() => ProfileApiService(sl()));

  // ==========================================
  // 3. REPOSITORIES (Data Layer Implementation)
  // ==========================================
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<AttendanceRepository>(
      () => AttendanceRepositoryImpl(sl()));
  sl.registerLazySingleton<ScheduleRepository>(
      () => ScheduleRepositoryImpl(sl()));
  sl.registerLazySingleton<LeaveRepository>(() => LeaveRepositoryImpl(sl()));
  sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(sl()));

  // ==========================================
  // 4. USE CASES (Domain Layer Logic)
  // ==========================================
  // Auth
  sl.registerLazySingleton(() => AuthLoginUseCase(sl()));
  sl.registerLazySingleton(() => AuthUpdatePasswordUseCase(sl()));
  sl.registerLazySingleton(() => AuthRegisterFaceUseCase(sl()));

  // Attendance
  sl.registerLazySingleton(() => AttendanceGetTodayUseCase(sl()));
  sl.registerLazySingleton(() => AttendanceGetMonthUseCase(sl()));
  sl.registerLazySingleton(() => AttendanceSendUseCase(sl()));
  sl.registerLazySingleton(() => AttendanceGetByMonthYear(sl()));

  // Schedule & Profile
  sl.registerLazySingleton(() => ScheduleGetUseCase(sl()));
  sl.registerLazySingleton(() => ScheduleBannedUseCase(sl()));
  sl.registerLazySingleton(() => UpdateProfileUseCase(sl()));
  sl.registerLazySingleton(() => ProfileGetPhotoUseCase(sl()));

  // Leave
  sl.registerLazySingleton(() => LeaveSendUseCase(sl()));
  sl.registerLazySingleton(() => LeaveGetHistoryUseCase(sl()));

  // ==========================================
  // 5. NOTIFIERS (Presentation Layer State)
  // ==========================================

  // GLOBAL STATE (Tetap Hidup/Singleton)
  sl.registerLazySingleton<HomeNotifier>(
      () => HomeNotifier(sl(), sl(), sl(), sl(), sl()));
  sl.registerLazySingleton<ProfileNotifier>(() => ProfileNotifier(sl()));

  // SCREEN STATE (Reset tiap buka/Factory)
  sl.registerFactory(() => LoginNotifier(sl()));
  sl.registerFactory(() => ChangePasswordNotifier(sl()));
  sl.registerFactory(() => MapNotifier(sl(), sl(), sl()));
  sl.registerFactory(() => DetailAttendanceNotifier(sl()));
  sl.registerFactory(() => FaceRecognitionNotifier(sl(), sl()));
  sl.registerFactory(() => LeaveNotifier(sl(), sl()));
}

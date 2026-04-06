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
import 'package:ibm_presensi_app/app/module/use_case/leave_get_history.dart';
import 'package:ibm_presensi_app/app/module/use_case/leave_send.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_banned.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_get.dart';
import 'package:ibm_presensi_app/app/module/use_case/update_profile.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_today.dart';
import 'package:ibm_presensi_app/app/module/use_case/profile_get_photo.dart'; // BARU

// Notifiers
import 'package:ibm_presensi_app/app/presentation/detail_attendance/detail_attendance_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/face_recognition/face_recognition_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/leave/leave_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/login/login_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/map/map_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/profile/profile_notifier.dart';

// Core
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/network/app_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final sl = GetIt.instance;

Future<void> initDependency() async {
  // --- Core / Dio ---
  Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.BASE_URL,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  dio.interceptors.add(AppInterceptor());
  dio.interceptors.add(
    PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      compact: true,
    ),
  );
  sl.registerSingleton<Dio>(dio);

  // --- API Services (Tetap Singleton) ---
  sl.registerLazySingleton<AuthApiService>(() => AuthApiService(sl()));
  sl.registerLazySingleton<AttendanceApiService>(
      () => AttendanceApiService(sl()));
  sl.registerLazySingleton<ScheduleApiService>(() => ScheduleApiService(sl()));
  sl.registerLazySingleton<LeaveApiService>(() => LeaveApiService(sl()));
  sl.registerLazySingleton<ProfileApiService>(() => ProfileApiService(sl()));

  // --- Repositories (Tetap Singleton) ---
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<AttendanceRepository>(
      () => AttendanceRepositoryImpl(sl()));
  sl.registerLazySingleton<ScheduleRepository>(
      () => ScheduleRepositoryImpl(sl()));
  sl.registerLazySingleton<LeaveRepository>(() => LeaveRepositoryImpl(sl()));
  sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(sl()));

  // --- Use Cases (Tetap Singleton) ---
  sl.registerLazySingleton<AuthLoginUseCase>(() => AuthLoginUseCase(sl()));
  sl.registerLazySingleton<AttendanceGetTodayUseCase>(
      () => AttendanceGetTodayUseCase(sl()));
  sl.registerLazySingleton<AttendanceGetMonthUseCase>(
      () => AttendanceGetMonthUseCase(sl()));
  sl.registerLazySingleton<ScheduleGetUseCase>(() => ScheduleGetUseCase(sl()));
  sl.registerLazySingleton<AttendanceSendUseCase>(
      () => AttendanceSendUseCase(sl()));
  sl.registerLazySingleton<AttendanceGetByMonthYear>(
      () => AttendanceGetByMonthYear(sl()));
  sl.registerLazySingleton<ScheduleBannedUseCase>(
      () => ScheduleBannedUseCase(sl()));
  sl.registerLazySingleton<LeaveSendUseCase>(() => LeaveSendUseCase(sl()));
  sl.registerLazySingleton<LeaveGetHistoryUseCase>(
      () => LeaveGetHistoryUseCase(sl()));
  sl.registerLazySingleton<UpdateProfileUseCase>(
      () => UpdateProfileUseCase(sl()));
  sl.registerLazySingleton<ProfileGetPhotoUseCase>(
      () => ProfileGetPhotoUseCase(sl()));

  // --- Providers / Notifiers ---

  // Login: Pakai Factory (Setiap buka login harus bersih)
  sl.registerFactory<LoginNotifier>(() => LoginNotifier(sl()));

  // Home: Pakai LazySingleton (Agar data dashboard tidak hilang/re-fetch terus)
  sl.registerLazySingleton<HomeNotifier>(
    () => HomeNotifier(
      sl<AttendanceGetTodayUseCase>(),
      sl<AttendanceGetMonthUseCase>(),
      sl<ScheduleGetUseCase>(),
      sl<ProfileGetPhotoUseCase>(),
      sl<ScheduleBannedUseCase>(),
    ),
  );

  // Profile: Pakai LazySingleton (KUNCI AGAR FOTO & POSISI SINKRON!)
  sl.registerLazySingleton<ProfileNotifier>(() => ProfileNotifier(sl()));

  // Halaman lain tetap Factory (Data sementara)
  sl.registerFactory<MapNotifier>(() => MapNotifier(sl(), sl(), sl()));
  sl.registerFactory<DetailAttendanceNotifier>(
      () => DetailAttendanceNotifier(sl()));
  sl.registerFactory<FaceRecognitionNotifier>(
      () => FaceRecognitionNotifier(sl(), sl()));
  sl.registerFactory<LeaveNotifier>(() => LeaveNotifier(sl(), sl()));
}

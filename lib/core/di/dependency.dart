import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:ibm_presensi_app/app/data/repository/attendance_repository.dart';
import 'package:ibm_presensi_app/app/data/repository/auth_repository.dart';
import 'package:ibm_presensi_app/app/data/repository/photo_repository.dart';
import 'package:ibm_presensi_app/app/data/repository/schedule_repository.dart';
import 'package:ibm_presensi_app/app/data/source/attendance_api_service.dart';
import 'package:ibm_presensi_app/app/data/source/auth_api_service.dart';
import 'package:ibm_presensi_app/app/data/source/photo_api_service.dart';
import 'package:ibm_presensi_app/app/data/source/schedule_api_service.dart';
import 'package:ibm_presensi_app/app/module/repository/attendance_repository.dart';
import 'package:ibm_presensi_app/app/module/repository/auth_repository.dart';
import 'package:ibm_presensi_app/app/module/repository/photo_repository.dart';
import 'package:ibm_presensi_app/app/module/repository/schedule_repository.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_by_month_year.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_this_month.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_send.dart';
import 'package:ibm_presensi_app/app/module/use_case/auth_login.dart';
import 'package:ibm_presensi_app/app/module/use_case/photo_get_bytes.dart';
import 'package:ibm_presensi_app/app/module/use_case/photo_get_url.dart';
import 'package:ibm_presensi_app/app/module/use_case/photo_upload.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_banned.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_get.dart';
import 'package:ibm_presensi_app/app/presentation/detail_attendance/detail_attendance_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/face_recognition/face_recognition_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/login/login_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/map/map_notifier.dart';
import 'package:ibm_presensi_app/core/network/app_interceptor.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_today.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final sl = GetIt.instance;

Future<void> initDependency() async {
  Dio dio = Dio();
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

  //api service
  sl.registerSingleton<AuthApiService>(AuthApiService(sl()));
  sl.registerSingleton<AttendanceApiService>(AttendanceApiService(sl()));
  sl.registerSingleton<ScheduleApiService>(ScheduleApiService(sl()));
  sl.registerSingleton<PhotoApiService>(PhotoApiService(sl()));

  //repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));
  sl.registerSingleton<AttendanceRepository>(AttendanceRepositoryImpl(sl()));
  sl.registerSingleton<ScheduleRepository>(ScheduleRepositoryImpl(sl()));
  sl.registerSingleton<PhotoRepository>(PhotoRepositoryImpl(sl()));

  // use case
  sl.registerSingleton<AuthLoginUseCase>(AuthLoginUseCase(sl()));
  sl.registerSingleton<AttendanceGetTodayUseCase>(
      AttendanceGetTodayUseCase(sl()));
  sl.registerSingleton<AttendanceGetMonthUseCase>(
      AttendanceGetMonthUseCase(sl()));
  sl.registerSingleton<ScheduleGetUseCase>(ScheduleGetUseCase(sl()));
  sl.registerSingleton<AttendanceSendUseCase>(AttendanceSendUseCase(sl()));
  sl.registerSingleton<AttendanceGetByMonthYear>(
      AttendanceGetByMonthYear(sl()));
  sl.registerSingleton<ScheduleBannedUseCase>(ScheduleBannedUseCase(sl()));
  sl.registerSingleton<PhotoGetBytesUseCase>(PhotoGetBytesUseCase(sl()));
  sl.registerSingleton<PhotoGetUrlUseCase>(PhotoGetUrlUseCase(sl()));
  sl.registerSingleton<PhotoUploadUseCase>(PhotoUploadUseCase(sl()));

  //provider
  sl.registerFactoryParam<LoginNotifier, void, void>(
    (param1, param2) => LoginNotifier(sl()),
  );

  sl.registerFactoryParam<HomeNotifier, void, void>(
    (param1, param2) => HomeNotifier(sl(), sl(), sl(), sl(), sl()),
  );

  sl.registerFactoryParam<MapNotifier, void, void>(
    (param1, param2) => MapNotifier(sl(), sl(), sl()),
  );

  sl.registerFactoryParam<DetailAttendanceNotifier, void, void>(
    (param1, param2) => DetailAttendanceNotifier(sl()),
  );
  sl.registerFactoryParam<FaceRecognitionNotifier, void, void>(
    (param1, param2) => FaceRecognitionNotifier(sl(), sl()),
  );
}

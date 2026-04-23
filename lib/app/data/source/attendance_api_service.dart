import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';

part 'attendance_api_service.g.dart';

@RestApi(baseUrl: AppConfig.BASE_URL)
abstract class AttendanceApiService {
  factory AttendanceApiService(Dio dio, {String baseUrl}) =
      _AttendanceApiService;

  @GET(AppConfig.attendanceToday)
  Future<String> getToday();

  @GET(AppConfig.attendanceHistory)
  Future<String> getHistory({
    @Query('month') required int month,
    @Query('year') required int year,
    @Query('per_page') int? perPage,
    @Query('page') int? page,
  });

  @GET(AppConfig.attendanceSchedule)
  Future<String> getSchedule();

  @GET(AppConfig.attendanceSummary)
  Future<String> getSummary({
    @Query('month') required int month,
    @Query('year') required int year,
  });

  @POST(AppConfig.attendanceStore)
  Future<String> sendAttendance({
    @Body() required Map<String, dynamic> body,
  });

  @POST(AppConfig.attendanceReportSuspicious)
  Future<String> reportSuspicious({
    @Body() required Map<String, dynamic> body,
  });
}

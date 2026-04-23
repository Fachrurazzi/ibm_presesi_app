import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';

part 'dashboard_api_service.g.dart';

@RestApi(baseUrl: AppConfig.BASE_URL)
abstract class DashboardApiService {
  factory DashboardApiService(Dio dio, {String baseUrl}) = _DashboardApiService;

  @GET(AppConfig.dashboardStats)
  Future<String> getStats();

  @GET(AppConfig.dashboardMonthly)
  Future<String> getMonthlySummary({
    @Query('month') required int month,
    @Query('year') required int year,
  });

  @GET(AppConfig.dashboardActivities)
  Future<String> getRecentActivities();
}
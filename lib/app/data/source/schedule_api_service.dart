import 'package:dio/dio.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:retrofit/retrofit.dart';

part 'schedule_api_service.g.dart';

@RestApi(baseUrl: AppConfig.BASE_URL)
abstract class ScheduleApiService {
  factory ScheduleApiService(Dio dio) = _ScheduleApiService;

  // 1. Ambil Jadwal Kerja (Shift & Office)
  // Gunakan dynamic agar Retrofit membiarkan data dalam bentuk Map mentah
  @GET('/schedule')
  Future<HttpResponse<dynamic>> get();

  // 2. Kirim Status/Cek Banned
  @POST('/banned')
  Future<HttpResponse<dynamic>> banned();
}

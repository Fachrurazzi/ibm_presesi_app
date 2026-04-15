import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'schedule_api_service.g.dart';

@RestApi() // BaseURL dikelola terpusat di dependency.dart
abstract class ScheduleApiService {
  factory ScheduleApiService(Dio dio, {String baseUrl}) = _ScheduleApiService;

  /// Mengambil data jadwal kerja (Shift jam masuk/pulang & lokasi kantor)
  /// Digunakan oleh HomeNotifier untuk validasi radius absensi
  @GET('/schedule')
  Future<HttpResponse<dynamic>> get();

  /// Melaporkan status perangkat atau mengecek status banned akun
  @POST('/attendance/banned')
  Future<HttpResponse<dynamic>> banned();
}

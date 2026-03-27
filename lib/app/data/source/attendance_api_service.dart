import 'package:dio/dio.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:retrofit/retrofit.dart';

part 'attendance_api_service.g.dart';

@RestApi(baseUrl: AppConfig.BASE_URL)
abstract class AttendanceApiService {
  factory AttendanceApiService(Dio dio) = _AttendanceApiService;

  // 1. Ambil data absen hari ini
  // Gunakan dynamic agar Retrofit tidak mencoba memanggil .fromJson()
  @GET('/today')
  Future<HttpResponse<dynamic>> getAttendanceToday();

  // 2. Kirim data absen (Check-in/Check-out)
  @POST('/store')
  Future<HttpResponse<dynamic>> sendAttendance(
      {@Body() required Map<String, dynamic> body});

  // 3. Ambil riwayat bulanan
  @GET('/history/{month}/{year}')
  Future<HttpResponse<dynamic>> getAttendanceByMonthYear({
    @Path('month') required String month,
    @Path('year') required String year,
  });
}

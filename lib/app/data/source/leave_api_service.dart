import 'package:dio/dio.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:retrofit/retrofit.dart';

part 'leave_api_service.g.dart';

@RestApi(baseUrl: AppConfig.BASE_URL)
abstract class LeaveApiService {
  factory LeaveApiService(Dio dio) = _LeaveApiService;

  // Gunakan dynamic agar Retrofit tidak mencoba memanggil .fromJson() secara otomatis
  @POST('/leaves')
  Future<HttpResponse<dynamic>> send(
      {@Body() required Map<String, dynamic> body});

  // Tambahkan ini untuk ambil list riwayat cuti
  @GET('/leaves')
  Future<HttpResponse<dynamic>> getHistory();
}

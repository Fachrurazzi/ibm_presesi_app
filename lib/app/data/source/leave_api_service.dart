import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'leave_api_service.g.dart';

@RestApi() // BaseURL dikelola terpusat di dependency.dart
abstract class LeaveApiService {
  factory LeaveApiService(Dio dio, {String baseUrl}) = _LeaveApiService;

  /// Mengirim pengajuan izin/cuti ke server
  @POST('/leaves/store')
  Future<HttpResponse<dynamic>> send({
    @Body() required Map<String, dynamic> body,
  });

  /// Mengambil daftar riwayat pengajuan cuti karyawan
  @GET('/leaves/history')
  Future<HttpResponse<dynamic>> getHistory();
}
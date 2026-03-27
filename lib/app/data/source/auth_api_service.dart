import 'package:dio/dio.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: AppConfig.BASE_URL)
abstract class AuthApiService {
  factory AuthApiService(Dio dio) = _AuthApiService;

  @POST('/login')
  Future<HttpResponse<dynamic>> login({
    @Body() required Map<String, dynamic> body,
  });
}
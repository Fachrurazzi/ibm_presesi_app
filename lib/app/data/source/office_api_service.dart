import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';

part 'office_api_service.g.dart';

@RestApi(baseUrl: AppConfig.BASE_URL)
abstract class OfficeApiService {
  factory OfficeApiService(Dio dio, {String baseUrl}) = _OfficeApiService;

  @GET(AppConfig.officesList)
  Future<String> getList();

  @GET('${AppConfig.officesList}/{id}')
  Future<String> getDetail(@Path('id') int id);

  @GET(AppConfig.officesNearest)
  Future<String> getNearest({
    @Query('latitude') required double latitude,
    @Query('longitude') required double longitude,
  });

  @POST(AppConfig.officesList)
  Future<String> create({@Body() required Map<String, dynamic> body});

  @PUT('${AppConfig.officesList}/{id}')
  Future<String> update({
    @Path('id') required int id,
    @Body() required Map<String, dynamic> body,
  });

  @DELETE('${AppConfig.officesList}/{id}')
  Future<String> delete(@Path('id') int id);

  @POST(AppConfig.officesCheckRadius)
  Future<String> checkRadius({@Body() required Map<String, dynamic> body});
}

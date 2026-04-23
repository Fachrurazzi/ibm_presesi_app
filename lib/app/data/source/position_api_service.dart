import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';

part 'position_api_service.g.dart';

@RestApi(baseUrl: AppConfig.BASE_URL)
abstract class PositionApiService {
  factory PositionApiService(Dio dio, {String baseUrl}) = _PositionApiService;

  @GET(AppConfig.positionsList)
  Future<String> getList();

  @POST(AppConfig.positionsList)
  Future<String> create({@Body() required Map<String, dynamic> body});

  @PUT('${AppConfig.positionsList}/{id}')
  Future<String> update({
    @Path('id') required int id,
    @Body() required Map<String, dynamic> body,
  });

  @DELETE('${AppConfig.positionsList}/{id}')
  Future<String> delete(@Path('id') int id);
}

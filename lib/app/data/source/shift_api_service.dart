import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';

part 'shift_api_service.g.dart';

@RestApi(baseUrl: AppConfig.BASE_URL)
abstract class ShiftApiService {
  factory ShiftApiService(Dio dio, {String baseUrl}) = _ShiftApiService;

  @GET(AppConfig.shiftsList)
  Future<String> getList();

  @GET('${AppConfig.shiftsList}/{id}')
  Future<String> getDetail(@Path('id') int id);

  @POST(AppConfig.shiftsList)
  Future<String> create({@Body() required Map<String, dynamic> body});

  @PUT('${AppConfig.shiftsList}/{id}')
  Future<String> update({
    @Path('id') required int id,
    @Body() required Map<String, dynamic> body,
  });

  @DELETE('${AppConfig.shiftsList}/{id}')
  Future<String> delete(@Path('id') int id);
}

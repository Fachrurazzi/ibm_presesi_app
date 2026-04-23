import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';

part 'schedule_api_service.g.dart';

@RestApi(baseUrl: AppConfig.BASE_URL)
abstract class ScheduleApiService {
  factory ScheduleApiService(Dio dio, {String baseUrl}) = _ScheduleApiService;

  @GET(AppConfig.schedulesList)
  Future<String> getList({
    @Query('page') int? page,
    @Query('per_page') int? perPage,
    @Query('user_id') int? userId,
    @Query('status') String? status,
  });

  @GET('${AppConfig.schedulesList}/{id}')
  Future<String> getDetail(@Path('id') int id);

  @GET('${AppConfig.schedulesList}/user/{userId}')
  Future<String> getByUser(@Path('userId') int userId);

  @POST(AppConfig.schedulesList)
  Future<String> create({@Body() required Map<String, dynamic> body});

  @PUT('${AppConfig.schedulesList}/{id}')
  Future<String> update({
    @Path('id') required int id,
    @Body() required Map<String, dynamic> body,
  });

  @DELETE('${AppConfig.schedulesList}/{id}')
  Future<String> delete(@Path('id') int id);

  @PATCH('${AppConfig.schedulesList}/{id}/ban')
  Future<String> ban({
    @Path('id') required int id,
    @Body() required Map<String, dynamic> body,
  });

  @PATCH('${AppConfig.schedulesList}/{id}/unban')
  Future<String> unban(@Path('id') int id);
}

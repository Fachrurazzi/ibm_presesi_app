import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';

part 'permission_api_service.g.dart';

@RestApi(baseUrl: AppConfig.BASE_URL)
abstract class PermissionApiService {
  factory PermissionApiService(Dio dio, {String baseUrl}) =
      _PermissionApiService;

  @GET(AppConfig.permissionsList)
  Future<String> getList({
    @Query('page') int? page,
    @Query('per_page') int? perPage,
    @Query('status') String? status,
  });

  @GET(AppConfig.permissionsTypes)
  Future<String> getTypes();

  @GET(AppConfig.permissionsCheck)
  Future<String> check({@Query('date') required String date});

  @GET('${AppConfig.permissionsList}/{id}')
  Future<String> getDetail(@Path('id') int id);

  @POST(AppConfig.permissionsList)
  @MultiPart()
  Future<String> create({
    @Part(name: 'type') required String type,
    @Part(name: 'date') required String date,
    @Part(name: 'reason') required String reason,
    @Part(name: 'image') File? image,
  });

  @DELETE('${AppConfig.permissionsList}/{id}')
  Future<String> cancel(@Path('id') int id);

  @PATCH('${AppConfig.permissionsList}/{id}/status')
  Future<String> updateStatus({
    @Path('id') required int id,
    @Body() required Map<String, dynamic> body,
  });
}

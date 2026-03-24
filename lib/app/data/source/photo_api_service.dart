import 'dart:io';

import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'photo_api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class PhotoApiService {
  factory PhotoApiService(Dio dio) {
    return _PhotoApiService(dio);
  }

  @GET('/image')
  Future<HttpResponse<DataState>> get();

  @GET('{path}')
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> getBytes(
      {@Path('path') required String path});

  @POST('/image')
  @MultiPart()
  Future<HttpResponse<DataState>> upload(@Part(name: "image") File image);
}

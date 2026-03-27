import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:retrofit/retrofit.dart';

part 'photo_api_service.g.dart';

@RestApi(baseUrl: AppConfig.BASE_URL)
abstract class PhotoApiService {
  factory PhotoApiService(Dio dio) = _PhotoApiService;

  // 1. Ambil URL Foto Profil
  // Gunakan dynamic agar Retrofit tidak bingung mencari .fromJson
  @GET('/image')
  Future<HttpResponse<dynamic>> get();

  // 2. Ambil Bytes Gambar
  // TETAP List<int> karena ini data biner, bukan JSON Map
  @GET('{path}')
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> getBytes(
      {@Path('path') required String path});

  // 3. Upload Foto Profil
  @POST('/image')
  @MultiPart()
  Future<HttpResponse<dynamic>> upload(
      {@Part(name: "image") required File image});
}

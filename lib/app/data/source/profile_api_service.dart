import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart'; // Import AppConfig
import 'package:retrofit/retrofit.dart';

part 'profile_api_service.g.dart';

@RestApi(baseUrl: AppConfig.BASE_URL) // Tambahkan baseUrl global di sini
abstract class ProfileApiService {
  factory ProfileApiService(Dio dio, {String baseUrl}) = _ProfileApiService;

  // 1. UPDATE PROFIL (Nama, Foto, Password)
  @POST('/profile/update')
  @MultiPart()
  Future<HttpResponse> updateProfile({
    @Part(name: 'name') required String name,
    @Part(name: 'image') File? image,
    @Part(name: 'old_password') String? oldPassword,
    @Part(name: 'new_password') String? newPassword,
  });

  // 2. AMBIL FOTO SAJA (Method Baru)
  @GET('/profile/photo')
  Future<HttpResponse<dynamic>> getProfilePhoto();
}

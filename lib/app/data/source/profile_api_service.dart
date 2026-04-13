import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_api_service.g.dart';

@RestApi() // BaseURL terpusat di dependency.dart (DI)
abstract class ProfileApiService {
  factory ProfileApiService(Dio dio, {String baseUrl}) = _ProfileApiService;

  /// Memperbarui profil karyawan (Nama, Foto, dan Password)
  /// Menggunakan MultiPart karena ada pengiriman File gambar fisik
  @POST('/profile/update')
  @MultiPart()
  Future<HttpResponse<dynamic>> updateProfile({
    @Part(name: 'name') required String name,
    @Part(name: 'image') File? image,
    @Part(name: 'old_password') String? oldPassword,
    @Part(name: 'new_password') String? newPassword,
  });

  /// Mengambil URL foto profil terbaru secara terpisah
  @GET('/profile/photo')
  Future<HttpResponse<dynamic>> getProfilePhoto();
}
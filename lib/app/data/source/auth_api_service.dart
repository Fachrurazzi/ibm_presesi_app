import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi() // BaseURL sudah dikelola secara terpusat di dependency.dart
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  /// Autentikasi karyawan IBM
  @POST('/login')
  Future<HttpResponse<dynamic>> login({
    @Body() required Map<String, dynamic> body,
  });

  /// Update password (Khusus Onboarding atau Ganti Berkala)
  @POST('/update-password')
  Future<HttpResponse<dynamic>> updatePassword({
    @Body() required Map<String, dynamic> body,
  });

  /// Registrasi Wajah (Face Enrollment)
  /// Mengirimkan data biometrik (json string) dan file gambar fisik
  @POST('/register-face')
  @MultiPart()
  Future<HttpResponse<dynamic>> registerFace({
    @Part(name: "face_model") required String faceModel,
    @Part(name: "image") required File image,
  });
}
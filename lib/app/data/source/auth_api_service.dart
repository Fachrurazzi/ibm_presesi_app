import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: AppConfig.BASE_URL)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  /// POST /login - Login user
  @POST(AppConfig.login)
  Future<String> login(@Body() Map<String, dynamic> request);

  /// GET /me - Get authenticated user
  @GET(AppConfig.me)
  Future<String> getMe();

  /// POST /logout - Logout current device
  @POST(AppConfig.logout)
  Future<String> logout();

  /// POST /logout-all - Logout all devices
  @POST(AppConfig.logoutAll)
  Future<String> logoutAll();

  /// PUT /password - Update password
  @PUT(AppConfig.updatePassword)
  Future<String> updatePassword(@Body() Map<String, dynamic> request);

  /// POST /forgot-password - Request password reset
  @POST(AppConfig.forgotPassword)
  Future<String> forgotPassword(@Body() Map<String, dynamic> request);

  /// POST /reset-password - Reset password with token
  @POST(AppConfig.resetPassword)
  Future<String> resetPassword(@Body() Map<String, dynamic> request);

  /// POST /register-face - Register face for recognition
  @POST(AppConfig.registerFace)
  @MultiPart()
  Future<String> registerFace({
    @Part(name: 'face_model') required String faceModel,
    @Part(name: 'image') required File image,
  });

  /// POST /resend-verification - Resend email verification
  @POST(AppConfig.resendVerification)
  Future<String> resendVerification();
}

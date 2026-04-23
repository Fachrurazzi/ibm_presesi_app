import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';

part 'user_api_service.g.dart';

@RestApi(baseUrl: AppConfig.BASE_URL)
abstract class UserApiService {
  factory UserApiService(Dio dio, {String baseUrl}) = _UserApiService;

  // ========== EXISTING ENDPOINTS ==========

  @GET(AppConfig.userProfile)
  Future<String> getProfile();

  @PUT(AppConfig.userUpdate)
  @MultiPart()
  Future<String> updateProfile({
    @Part(name: 'name') required String name,
    @Part(name: 'image') File? image,
  });

  @GET(AppConfig.userPhoto)
  Future<String> getPhoto();

  @DELETE(AppConfig.userPhoto)
  Future<String> deletePhoto();

  @GET(AppConfig.userSchedule)
  Future<String> getSchedule({
    @Query('month') required int month,
    @Query('year') required int year,
  });

  @GET(AppConfig.userScheduleToday)
  Future<String> getTodaySchedule();

  @GET(AppConfig.userLeaveSummary)
  Future<String> getLeaveSummary({@Query('year') required int year});

  @PUT(AppConfig.userFcmToken)
  Future<String> updateFcmToken({@Body() required Map<String, dynamic> body});

  @POST(AppConfig.userLocation)
  Future<String> updateLocation({@Body() required Map<String, dynamic> body});

  // ========== 🆕 USER LOCATION TRACKING (ADMIN & MANAGER) ==========

  /// GET /user-locations/all - Get all users with last location (Admin only)
  @GET(AppConfig.userLocationsAll)
  Future<String> getAllUserLocations();

  /// GET /user-locations/team - Get team locations (Manager only)
  @GET(AppConfig.userLocationsTeam)
  Future<String> getTeamLocations();

  /// GET /user-locations/{userId} - Get single user location
  @GET('${AppConfig.userLocationDetail}{userId}')
  Future<String> getUserLocation(@Path('userId') int userId);
}

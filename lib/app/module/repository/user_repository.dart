import 'package:ibm_presensi_app/app/module/entity/user.dart';
import 'package:ibm_presensi_app/app/module/entity/user_location.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

abstract class UserRepository {
  // ========== EXISTING METHODS ==========

  Future<DataState<UserEntity>> getProfile();
  Future<DataState<UserEntity>> updateProfile(UserUpdateParams param);
  Future<DataState<String>> getPhoto();
  Future<DataState<bool>> deletePhoto();
  Future<DataState<PaginatedUserSchedule>> getSchedule(
      UserScheduleParams param);
  Future<DataState<TodaySchedule>> getTodaySchedule();
  Future<DataState<LeaveSummary>> getLeaveSummary(LeaveSummaryParams param);
  Future<DataState<bool>> updateFcmToken(FcmTokenParams param);
  Future<DataState<bool>> updateLocation(LocationUpdateParams param);

  // ========== 🆕 USER LOCATION TRACKING ==========

  /// GET /user-locations/all - Get all users with last location (Admin only)
  Future<DataState<List<UserLocation>>> getAllUserLocations();

  /// GET /user-locations/team - Get team locations (Manager only)
  Future<DataState<List<UserLocation>>> getTeamLocations();

  /// GET /user-locations/{userId} - Get single user location
  Future<DataState<UserLocation>> getUserLocation(int userId);
}

import 'package:ibm_presensi_app/app/module/entity/schedule.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

abstract class ScheduleRepository {
  /// GET /schedules - Get paginated schedules (Admin only)
  Future<DataState<PaginatedSchedule>> getList(ScheduleListParams param);

  /// GET /schedules/{id} - Get schedule detail
  Future<DataState<ScheduleEntity>> getDetail(int id);

  /// GET /schedules/user/{userId} - Get schedules by user
  Future<DataState<List<ScheduleEntity>>> getByUser(int userId);

  /// POST /schedules - Create schedule (Admin only)
  Future<DataState<ScheduleEntity>> create(ScheduleParams param);

  /// PUT /schedules/{id} - Update schedule (Admin only)
  Future<DataState<ScheduleEntity>> update(int id, ScheduleParams param);

  /// DELETE /schedules/{id} - Delete schedule (Admin only)
  Future<DataState<bool>> delete(int id);

  /// PATCH /schedules/{id}/ban - Ban schedule (Admin only)
  Future<DataState<ScheduleEntity>> ban(BanScheduleParams param);

  /// PATCH /schedules/{id}/unban - Unban schedule (Admin only)
  Future<DataState<ScheduleEntity>> unban(int id);
}

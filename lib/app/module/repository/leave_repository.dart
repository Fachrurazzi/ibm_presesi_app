import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

abstract class LeaveRepository {
  /// GET /leaves - Get paginated leave list
  Future<DataState<PaginatedLeave>> getList(LeaveListParams param);

  /// GET /leaves/types - Get leave types for dropdown
  Future<DataState<List<LeaveType>>> getTypes();

  /// GET /leaves/quota - Get leave quota info
  Future<DataState<LeaveQuota>> getQuota();

  /// GET /leaves/{id} - Get leave detail
  Future<DataState<LeaveEntity>> getDetail(int id);

  /// POST /leaves - Create new leave request
  Future<DataState<LeaveEntity>> create(LeaveCreateParams param);

  /// DELETE /leaves/{id} - Cancel pending leave
  Future<DataState<bool>> cancel(int id);

  /// PATCH /leaves/{id}/status - Update leave status (Admin only)
  Future<DataState<bool>> updateStatus(LeaveUpdateStatusParams param);
}

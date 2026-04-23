import 'package:ibm_presensi_app/app/module/entity/permission.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

abstract class PermissionRepository {
  /// GET /permissions - Get paginated permission list
  Future<DataState<PaginatedPermission>> getList(PermissionListParams param);

  /// GET /permissions/types - Get permission types for dropdown
  Future<DataState<List<PermissionType>>> getTypes();

  /// GET /permissions/check - Check if has permission on date
  Future<DataState<PermissionCheckResult>> check(PermissionCheckParams param);

  /// GET /permissions/{id} - Get permission detail
  Future<DataState<PermissionEntity>> getDetail(int id);

  /// POST /permissions - Create new permission request
  Future<DataState<PermissionEntity>> create(PermissionCreateParams param);

  /// DELETE /permissions/{id} - Cancel pending permission
  Future<DataState<bool>> cancel(int id);

  /// PATCH /permissions/{id}/status - Update permission status (Admin only)
  Future<DataState<bool>> updateStatus(PermissionUpdateStatusParams param);
}

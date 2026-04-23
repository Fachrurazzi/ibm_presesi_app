import 'package:ibm_presensi_app/app/module/entity/permission.dart';
import 'package:ibm_presensi_app/app/module/repository/permission_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class PermissionGetListUseCase
    extends AppUseCase<DataState<PaginatedPermission>, PermissionListParams> {
  final PermissionRepository _repository;

  PermissionGetListUseCase(this._repository);

  @override
  Future<DataState<PaginatedPermission>> call(PermissionListParams param) {
    return _repository.getList(param);
  }
}

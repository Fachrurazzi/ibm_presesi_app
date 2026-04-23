import 'package:ibm_presensi_app/app/module/entity/permission.dart';
import 'package:ibm_presensi_app/app/module/repository/permission_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class PermissionGetTypesUseCase
    extends AppUseCase<DataState<List<PermissionType>>, NoParams> {
  final PermissionRepository _repository;

  PermissionGetTypesUseCase(this._repository);

  @override
  Future<DataState<List<PermissionType>>> call(NoParams params) {
    return _repository.getTypes();
  }
}
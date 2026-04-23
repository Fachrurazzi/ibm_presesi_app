import 'package:ibm_presensi_app/app/module/entity/permission.dart';
import 'package:ibm_presensi_app/app/module/repository/permission_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class PermissionCheckUseCase extends AppUseCase<
    DataState<PermissionCheckResult>, PermissionCheckParams> {
  final PermissionRepository _repository;

  PermissionCheckUseCase(this._repository);

  @override
  Future<DataState<PermissionCheckResult>> call(PermissionCheckParams param) {
    if (param.date.isEmpty) {
      return Future.value(
        const ErrorState(message: "Tanggal harus diisi"),
      );
    }
    return _repository.check(param);
  }
}

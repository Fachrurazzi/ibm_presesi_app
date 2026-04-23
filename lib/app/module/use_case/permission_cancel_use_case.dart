import 'package:ibm_presensi_app/app/module/entity/permission.dart';
import 'package:ibm_presensi_app/app/module/repository/permission_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class PermissionCancelUseCase extends AppUseCase<DataState<bool>, int> {
  final PermissionRepository _repository;

  PermissionCancelUseCase(this._repository);

  @override
  Future<DataState<bool>> call(int id) {
    if (id <= 0) {
      return Future.value(
        const ErrorState(message: "ID izin tidak valid"),
      );
    }
    return _repository.cancel(id);
  }
}

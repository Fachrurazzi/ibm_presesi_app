import 'package:ibm_presensi_app/app/module/entity/permission.dart';
import 'package:ibm_presensi_app/app/module/repository/permission_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class PermissionUpdateStatusUseCase
    extends AppUseCase<DataState<bool>, PermissionUpdateStatusParams> {
  final PermissionRepository _repository;

  PermissionUpdateStatusUseCase(this._repository);

  @override
  Future<DataState<bool>> call(PermissionUpdateStatusParams param) {
    if (param.id <= 0) {
      return Future.value(
        const ErrorState(message: "ID izin tidak valid"),
      );
    }

    final status = param.status.toUpperCase();
    if (status != 'APPROVED' && status != 'REJECTED') {
      return Future.value(
        const ErrorState(message: "Status harus APPROVED atau REJECTED"),
      );
    }

    return _repository.updateStatus(param);
  }
}

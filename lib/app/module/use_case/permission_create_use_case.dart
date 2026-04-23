import 'package:ibm_presensi_app/app/module/entity/permission.dart';
import 'package:ibm_presensi_app/app/module/repository/permission_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class PermissionCreateUseCase
    extends AppUseCase<DataState<PermissionEntity>, PermissionCreateParams> {
  final PermissionRepository _repository;

  PermissionCreateUseCase(this._repository);

  @override
  Future<DataState<PermissionEntity>> call(PermissionCreateParams param) {
    // Validasi
    if (param.type.isEmpty) {
      return Future.value(
        const ErrorState(message: "Tipe izin harus dipilih"),
      );
    }
    if (param.date.isEmpty) {
      return Future.value(
        const ErrorState(message: "Tanggal izin harus diisi"),
      );
    }
    if (param.reason.length < 10) {
      return Future.value(
        const ErrorState(message: "Alasan minimal 10 karakter"),
      );
    }

    // Validasi tipe
    const validTypes = [
      'LATE',
      'EARLY_LEAVE',
      'BUSINESS_TRIP',
      'SICK_WITH_CERT'
    ];
    if (!validTypes.contains(param.type)) {
      return Future.value(
        const ErrorState(message: "Tipe izin tidak valid"),
      );
    }

    return _repository.create(param);
  }
}

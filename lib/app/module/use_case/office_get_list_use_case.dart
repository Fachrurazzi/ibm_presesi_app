// office_get_list_use_case.dart
import 'package:ibm_presensi_app/app/module/entity/office.dart';
import 'package:ibm_presensi_app/app/module/repository/office_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class OfficeGetListUseCase
    extends AppUseCase<DataState<List<OfficeEntity>>, NoParams> {
  final OfficeRepository _repository;
  OfficeGetListUseCase(this._repository);

  @override
  Future<DataState<List<OfficeEntity>>> call(NoParams params) {
    return _repository.getList();
  }
}
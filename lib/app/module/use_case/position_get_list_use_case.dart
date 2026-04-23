// position_get_list_use_case.dart
import 'package:ibm_presensi_app/app/module/entity/position.dart';
import 'package:ibm_presensi_app/app/module/repository/position_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class PositionGetListUseCase
    extends AppUseCase<DataState<List<PositionEntity>>, NoParams> {
  final PositionRepository _repository;
  PositionGetListUseCase(this._repository);

  @override
  Future<DataState<List<PositionEntity>>> call(NoParams params) {
    return _repository.getList();
  }
}

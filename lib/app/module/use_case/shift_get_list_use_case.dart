// shift_get_list_use_case.dart
import 'package:ibm_presensi_app/app/module/entity/shift.dart';
import 'package:ibm_presensi_app/app/module/repository/shift_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class ShiftGetListUseCase
    extends AppUseCase<DataState<List<ShiftEntity>>, NoParams> {
  final ShiftRepository _repository;
  ShiftGetListUseCase(this._repository);

  @override
  Future<DataState<List<ShiftEntity>>> call(NoParams params) {
    return _repository.getList();
  }
}

// shift_get_detail_use_case.dart
import 'package:ibm_presensi_app/app/module/entity/shift.dart';
import 'package:ibm_presensi_app/app/module/repository/shift_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class ShiftGetDetailUseCase extends AppUseCase<DataState<ShiftEntity>, int> {
  final ShiftRepository _repository;
  ShiftGetDetailUseCase(this._repository);

  @override
  Future<DataState<ShiftEntity>> call(int id) {
    if (id <= 0) {
      return Future.value(const ErrorState(message: "ID shift tidak valid"));
    }
    return _repository.getDetail(id);
  }
}

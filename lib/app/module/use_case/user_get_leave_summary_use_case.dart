import 'package:ibm_presensi_app/app/module/entity/user.dart';
import 'package:ibm_presensi_app/app/module/repository/user_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class UserGetLeaveSummaryUseCase
    extends AppUseCase<DataState<LeaveSummary>, LeaveSummaryParams> {
  final UserRepository _repository;

  UserGetLeaveSummaryUseCase(this._repository);

  @override
  Future<DataState<LeaveSummary>> call(LeaveSummaryParams param) {
    if (param.year < 2020 || param.year > 2100) {
      return Future.value(
        const ErrorState(message: "Tahun tidak valid"),
      );
    }
    return _repository.getLeaveSummary(param);
  }
}

/// Shortcut untuk tahun ini
class UserGetThisYearLeaveSummaryUseCase
    extends AppUseCase<DataState<LeaveSummary>, NoParams> {
  final UserRepository _repository;

  UserGetThisYearLeaveSummaryUseCase(this._repository);

  @override
  Future<DataState<LeaveSummary>> call(NoParams params) {
    final year = DateTime.now().year;
    return _repository.getLeaveSummary(LeaveSummaryParams(year: year));
  }
}

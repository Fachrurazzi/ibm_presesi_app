import 'package:ibm_presensi_app/app/module/entity/dashboard.dart';
import 'package:ibm_presensi_app/app/module/repository/dashboard_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class DashboardGetMonthlySummaryUseCase
    extends AppUseCase<DataState<MonthlySummary>, MonthlySummaryParams> {
  final DashboardRepository _repository;

  DashboardGetMonthlySummaryUseCase(this._repository);

  @override
  Future<DataState<MonthlySummary>> call(MonthlySummaryParams param) {
    if (param.month < 1 || param.month > 12) {
      return Future.value(
        const ErrorState(message: "Bulan tidak valid (1-12)"),
      );
    }
    if (param.year < 2020 || param.year > 2100) {
      return Future.value(
        const ErrorState(message: "Tahun tidak valid"),
      );
    }
    return _repository.getMonthlySummary(param);
  }
}

/// Shortcut untuk bulan ini
class DashboardGetThisMonthSummaryUseCase
    extends AppUseCase<DataState<MonthlySummary>, NoParams> {
  final DashboardRepository _repository;

  DashboardGetThisMonthSummaryUseCase(this._repository);

  @override
  Future<DataState<MonthlySummary>> call(NoParams params) {
    final now = DateTime.now();
    return _repository.getMonthlySummary(
      MonthlySummaryParams(month: now.month, year: now.year),
    );
  }
}

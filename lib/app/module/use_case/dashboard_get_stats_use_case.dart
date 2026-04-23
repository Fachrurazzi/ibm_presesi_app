import 'package:ibm_presensi_app/app/module/entity/dashboard.dart';
import 'package:ibm_presensi_app/app/module/repository/dashboard_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class DashboardGetStatsUseCase
    extends AppUseCase<DataState<DashboardStats>, NoParams> {
  final DashboardRepository _repository;

  DashboardGetStatsUseCase(this._repository);

  @override
  Future<DataState<DashboardStats>> call(NoParams params) {
    return _repository.getStats();
  }
}

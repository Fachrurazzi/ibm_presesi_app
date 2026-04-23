import 'package:ibm_presensi_app/app/module/entity/dashboard.dart';
import 'package:ibm_presensi_app/app/module/repository/dashboard_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class DashboardGetRecentActivitiesUseCase
    extends AppUseCase<DataState<List<RecentActivity>>, NoParams> {
  final DashboardRepository _repository;

  DashboardGetRecentActivitiesUseCase(this._repository);

  @override
  Future<DataState<List<RecentActivity>>> call(NoParams params) {
    return _repository.getRecentActivities();
  }
}

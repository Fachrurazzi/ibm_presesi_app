import 'package:ibm_presensi_app/app/module/entity/dashboard.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

abstract class DashboardRepository {
  /// GET /dashboard/stats - Get dashboard statistics
  Future<DataState<DashboardStats>> getStats();

  /// GET /dashboard/monthly-summary - Get monthly attendance summary
  Future<DataState<MonthlySummary>> getMonthlySummary(
      MonthlySummaryParams param);

  /// GET /dashboard/recent-activities - Get recent activities
  Future<DataState<List<RecentActivity>>> getRecentActivities();
}

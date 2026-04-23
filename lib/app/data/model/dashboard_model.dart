import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibm_presensi_app/app/module/entity/dashboard.dart';

part 'dashboard_model.freezed.dart';
part 'dashboard_model.g.dart';

// ========== DASHBOARD STATS RESPONSE ==========
@freezed
class DashboardStatsResponse with _$DashboardStatsResponse {
  const factory DashboardStatsResponse({
    required DashboardStats data,
  }) = _DashboardStatsResponse;

  factory DashboardStatsResponse.fromJson(Map<String, dynamic> json) =>
      _$DashboardStatsResponseFromJson(json);
}

// ========== MONTHLY SUMMARY RESPONSE ==========
@freezed
class MonthlySummaryResponse with _$MonthlySummaryResponse {
  const factory MonthlySummaryResponse({
    required MonthlySummary data,
  }) = _MonthlySummaryResponse;

  factory MonthlySummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$MonthlySummaryResponseFromJson(json);
}

// ========== RECENT ACTIVITIES RESPONSE ==========
@freezed
class RecentActivitiesResponse with _$RecentActivitiesResponse {
  const factory RecentActivitiesResponse({
    required List<RecentActivity> data,
  }) = _RecentActivitiesResponse;

  factory RecentActivitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$RecentActivitiesResponseFromJson(json);
}

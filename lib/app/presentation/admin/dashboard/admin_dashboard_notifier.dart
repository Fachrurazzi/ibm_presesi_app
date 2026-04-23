import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/dashboard.dart';
import 'package:ibm_presensi_app/app/module/use_case/dashboard_get_stats_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/dashboard_get_monthly_summary_use_case.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class AdminDashboardNotifier extends AppProvider {
  final DashboardGetStatsUseCase _getStatsUseCase;
  final DashboardGetMonthlySummaryUseCase _getMonthlySummaryUseCase;

  AdminDashboardNotifier(
      this._getStatsUseCase, this._getMonthlySummaryUseCase) {
    init();
  }

  DashboardStats? _stats;
  MonthlySummary? _monthlySummary;
  bool _isLoading = false;

  DashboardStats? get stats => _stats;
  MonthlySummary? get monthlySummary => _monthlySummary;
  bool get isLoadingData => _isLoading;

  @override
  Future<void> init() async {
    await loadData();
  }

  Future<void> loadData() async {
    _isLoading = true;
    notifyListeners();

    final now = DateTime.now();
    final statsResult = await _getStatsUseCase(const NoParams());
    final summaryResult = await _getMonthlySummaryUseCase(
        MonthlySummaryParams(month: now.month, year: now.year));

    if (statsResult is SuccessState<DashboardStats>) _stats = statsResult.data;
    if (summaryResult is SuccessState<MonthlySummary>)
      _monthlySummary = summaryResult.data;

    _isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() => loadData();
  @override
  void clearError() => setError("");
}

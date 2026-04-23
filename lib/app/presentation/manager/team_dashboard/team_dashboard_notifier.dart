import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/dashboard.dart';
import 'package:ibm_presensi_app/app/module/use_case/dashboard_get_stats_use_case.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class TeamDashboardNotifier extends AppProvider {
  final DashboardGetStatsUseCase _getStatsUseCase;

  TeamDashboardNotifier(this._getStatsUseCase) {
    init();
  }

  DashboardStats? _stats;
  DashboardStats? get stats => _stats;

  @override
  Future<void> init() async {
    await loadData();
  }

  Future<void> loadData() async {
    showLoading();
    final result = await _getStatsUseCase(const NoParams());
    if (result is SuccessState<DashboardStats>) {
      _stats = result.data;
    } else {
      setError(result.message);
    }
    hideLoading();
    notifyListeners();
  }

  Future<void> refresh() => loadData();
  @override
  void clearError() => setError("");
}

import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/position.dart';
import 'package:ibm_presensi_app/app/module/use_case/position_get_list_use_case.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class PositionManagementNotifier extends AppProvider {
  final PositionGetListUseCase _getListUseCase;

  PositionManagementNotifier(this._getListUseCase) {
    init();
  }

  List<PositionEntity> _positions = [];
  List<PositionEntity> get positions => _positions;

  @override
  Future<void> init() async {
    await loadPositions();
  }

  Future<void> loadPositions() async {
    showLoading();
    final result = await _getListUseCase(const NoParams());
    if (result is SuccessState<List<PositionEntity>>) {
      _positions = result.data ?? [];
    } else {
      setError(result.message);
    }
    hideLoading();
    notifyListeners();
  }

  Future<void> refresh() => loadPositions();
  @override
  void clearError() => setError("");
}

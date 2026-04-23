import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/shift.dart';
import 'package:ibm_presensi_app/app/module/use_case/shift_get_list_use_case.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class ShiftManagementNotifier extends AppProvider {
  final ShiftGetListUseCase _getListUseCase;

  ShiftManagementNotifier(this._getListUseCase) {
    init();
  }

  List<ShiftEntity> _shifts = [];
  List<ShiftEntity> get shifts => _shifts;

  @override
  Future<void> init() async {
    await loadShifts();
  }

  Future<void> loadShifts() async {
    showLoading();
    final result = await _getListUseCase(const NoParams());
    if (result is SuccessState<List<ShiftEntity>>) {
      _shifts = result.data ?? [];
    } else {
      setError(result.message);
    }
    hideLoading();
    notifyListeners();
  }

  Future<void> refresh() => loadShifts();
  @override
  void clearError() => setError("");
}

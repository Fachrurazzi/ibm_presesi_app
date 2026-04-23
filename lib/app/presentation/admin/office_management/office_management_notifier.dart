import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/office.dart';
import 'package:ibm_presensi_app/app/module/use_case/office_get_list_use_case.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class OfficeManagementNotifier extends AppProvider {
  final OfficeGetListUseCase _getListUseCase;

  OfficeManagementNotifier(this._getListUseCase) {
    init();
  }

  List<OfficeEntity> _offices = [];
  List<OfficeEntity> get offices => _offices;

  @override
  Future<void> init() async {
    await loadOffices();
  }

  Future<void> loadOffices() async {
    showLoading();
    final result = await _getListUseCase(const NoParams());
    if (result is SuccessState<List<OfficeEntity>>) {
      _offices = result.data ?? [];
    } else {
      setError(result.message);
    }
    hideLoading();
    notifyListeners();
  }

  Future<void> refresh() => loadOffices();
  @override
  void clearError() => setError("");
}

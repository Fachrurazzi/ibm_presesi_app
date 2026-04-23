import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/app/module/use_case/leave_get_detail_use_case.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class LeaveDetailNotifier extends AppProvider {
  final LeaveGetDetailUseCase _getDetailUseCase;
  final int leaveId;

  LeaveDetailNotifier(this._getDetailUseCase, this.leaveId) {
    init();
  }

  LeaveEntity? _leave;
  LeaveEntity? get leave => _leave;

  @override
  Future<void> init() async {
    await loadData();
  }

  Future<void> loadData() async {
    showLoading();
    final result = await _getDetailUseCase(leaveId);
    if (result is SuccessState<LeaveEntity>) {
      _leave = result.data;
    } else {
      setError(result.message);
    }
    hideLoading();
    notifyListeners();
  }

  @override
  void clearError() => setError("");
}

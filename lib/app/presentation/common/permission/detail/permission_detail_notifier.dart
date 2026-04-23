import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/permission.dart';
import 'package:ibm_presensi_app/app/module/use_case/permission_get_detail_use_case.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class PermissionDetailNotifier extends AppProvider {
  final PermissionGetDetailUseCase _getDetailUseCase;
  final int permissionId;

  PermissionDetailNotifier(this._getDetailUseCase, this.permissionId) {
    init();
  }

  PermissionEntity? _permission;
  PermissionEntity? get permission => _permission;

  @override
  Future<void> init() async {
    await loadData();
  }

  Future<void> loadData() async {
    showLoading();
    final result = await _getDetailUseCase(permissionId);
    if (result is SuccessState<PermissionEntity>) {
      _permission = result.data;
    } else {
      setError(result.message);
    }
    hideLoading();
    notifyListeners();
  }

  @override
  void clearError() => setError("");
}

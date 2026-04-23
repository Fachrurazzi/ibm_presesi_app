import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/permission.dart';
import 'package:ibm_presensi_app/app/module/use_case/permission_get_list_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/permission_update_status_use_case.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class PermissionApprovalNotifier extends AppProvider {
  final PermissionGetListUseCase _getListUseCase;
  final PermissionUpdateStatusUseCase _updateStatusUseCase;

  PermissionApprovalNotifier(this._getListUseCase, this._updateStatusUseCase) {
    init();
  }

  List<PermissionEntity> _listPermission = [];
  List<PermissionEntity> get listPermission => _listPermission;

  int _currentPage = 1;
  bool _hasMore = true;
  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;

  String _selectedStatus = 'PENDING';
  String get selectedStatus => _selectedStatus;

  @override
  Future<void> init() async {
    await loadData();
  }

  Future<void> loadData({bool refresh = false}) async {
    if (refresh) {
      _currentPage = 1;
      _hasMore = true;
    }
    if (!_hasMore && !refresh) return;

    _isLoadingMore = true;
    notifyListeners();

    final params = PermissionListParams(
        page: _currentPage, perPage: 10, status: _selectedStatus);
    final result = await _getListUseCase(params);

    if (result is SuccessState<PaginatedPermission>) {
      if (refresh) {
        _listPermission = result.data?.data ?? [];
      } else {
        _listPermission.addAll(result.data?.data ?? []);
      }
      _hasMore = (result.data?.meta.currentPage ?? 1) <
          (result.data?.meta.lastPage ?? 1);
      if (_hasMore) _currentPage++;
    } else {
      setError(result.message);
    }

    _isLoadingMore = false;
    notifyListeners();
  }

  Future<void> refresh() => loadData(refresh: true);
  Future<void> loadMore() async {
    if (_hasMore && !_isLoadingMore) await loadData();
  }

  void filterByStatus(String status) {
    _selectedStatus = status;
    refresh();
  }

  Future<bool> approve(int id) => _updateStatus(id, 'APPROVED');
  Future<bool> reject(int id) => _updateStatus(id, 'REJECTED');

  Future<bool> _updateStatus(int id, String status) async {
    showLoading();
    final params = PermissionUpdateStatusParams(id: id, status: status);
    final result = await _updateStatusUseCase(params);
    hideLoading();

    if (result is SuccessState<bool> && result.data == true) {
      _listPermission.removeWhere((p) => p.id == id);
      notifyListeners();
      return true;
    } else {
      setError(result.message);
      notifyListeners();
      return false;
    }
  }

  @override
  void clearError() => setError("");
}

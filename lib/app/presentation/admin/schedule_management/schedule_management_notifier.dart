import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/schedule.dart';
import 'package:ibm_presensi_app/app/module/use_case/schedule_get_list_use_case.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class ScheduleManagementNotifier extends AppProvider {
  final ScheduleGetListUseCase _getListUseCase;

  ScheduleManagementNotifier(this._getListUseCase) {
    init();
  }

  List<ScheduleEntity> _schedules = [];
  List<ScheduleEntity> get schedules => _schedules;
  int _currentPage = 1;
  bool _hasMore = true;
  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;

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
    final params = ScheduleListParams(page: _currentPage, perPage: 10);
    final result = await _getListUseCase(params);
    if (result is SuccessState<PaginatedSchedule>) {
      if (refresh) {
        _schedules = result.data?.data ?? [];
      } else {
        _schedules.addAll(result.data?.data ?? []);
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

  @override
  void clearError() => setError("");
}

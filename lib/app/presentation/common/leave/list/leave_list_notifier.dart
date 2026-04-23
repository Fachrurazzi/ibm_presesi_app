import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/app/module/use_case/leave_cancel_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/leave_get_list_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/leave_get_quota_use_case.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class LeaveListNotifier extends AppProvider {
  final LeaveGetListUseCase _getListUseCase;
  final LeaveGetQuotaUseCase _getQuotaUseCase;
  final LeaveCancelUseCase _cancelUseCase;

  LeaveListNotifier(
      this._getListUseCase, this._getQuotaUseCase, this._cancelUseCase) {
    init();
  }

  List<LeaveEntity> _listLeave = [];
  List<LeaveEntity> get listLeave => _listLeave;

  int _leaveQuota = 12;
  int _remainingLeave = 12;
  int get leaveQuota => _leaveQuota;
  int get remainingLeave => _remainingLeave;

  String _selectedStatus = 'all';
  String get selectedStatus => _selectedStatus;

  int _currentPage = 1;
  bool _hasMore = true;
  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;

  @override
  Future<void> init() async {
    await Future.wait([_loadQuota(), _loadData()]);
  }

  Future<void> _loadQuota() async {
    final result = await _getQuotaUseCase(const NoParams());
    if (result is SuccessState<LeaveQuota>) {
      _leaveQuota = result.data!.totalQuota;
      _remainingLeave = result.data!.remainingQuota;
    }
    notifyListeners();
  }

  Future<void> _loadData({bool refresh = false}) async {
    if (refresh) {
      _currentPage = 1;
      _hasMore = true;
    }
    if (!_hasMore && !refresh) return;

    _isLoadingMore = true;
    notifyListeners();

    final params = LeaveListParams(
      page: _currentPage,
      perPage: 10,
      status: _selectedStatus == 'all' ? null : _selectedStatus,
    );
    final result = await _getListUseCase(params);

    if (result is SuccessState<PaginatedLeave>) {
      if (refresh) {
        _listLeave = result.data?.data ?? [];
      } else {
        _listLeave.addAll(result.data?.data ?? []);
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

  Future<void> refresh() => _loadData(refresh: true);
  Future<void> loadMore() async {
    if (_hasMore && !_isLoadingMore) await _loadData();
  }

  void filterByStatus(String status) {
    _selectedStatus = status;
    refresh();
  }

  Future<bool> cancelLeave(int id) async {
    showLoading();
    final result = await _cancelUseCase(id);
    hideLoading();

    if (result is SuccessState<bool> && result.data == true) {
      _listLeave.removeWhere((l) => l.id == id);
      await _loadQuota();
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

import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/app/module/use_case/leave_create_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/leave_get_quota_use_case.dart';
import 'package:ibm_presensi_app/app/presentation/common/dashboard/dashboard_notifier.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';
import 'package:intl/intl.dart';

class LeaveCreateNotifier extends AppProvider {
  final LeaveCreateUseCase _createUseCase;
  final LeaveGetQuotaUseCase _getQuotaUseCase;

  LeaveCreateNotifier(this._createUseCase, this._getQuotaUseCase) {
    init();
  }

  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;

  int _leaveQuota = 12;
  int _remainingLeave = 12;
  int get leaveQuota => _leaveQuota;
  int get remainingLeave => _remainingLeave;

  String _leaveError = "";
  String get leaveError => _leaveError;

  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final reasonController = TextEditingController();

  @override
  Future<void> init() async {
    await _loadQuota();
  }

  Future<void> _loadQuota() async {
    final result = await _getQuotaUseCase(const NoParams());
    if (result is SuccessState<LeaveQuota>) {
      _leaveQuota = result.data!.totalQuota;
      _remainingLeave = result.data!.remainingQuota;
    }
    notifyListeners();
  }

  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                  primary: Theme.of(context).colorScheme.primary)),
          child: child!),
    );
    if (picked != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
      notifyListeners();
    }
  }

  Future<void> submit() async {
    final start = startDateController.text;
    final end = endDateController.text;
    final reason = reasonController.text.trim();

    _leaveError = "";
    if (!_validate(start, end, reason)) return;

    showLoading();
    _isSuccess = false;

    final params = LeaveCreateParams(
        startDate: start, endDate: end, reason: reason, category: 'annual');
    final result = await _createUseCase(params);

    if (result is SuccessState<LeaveEntity>) {
      if (sl.isRegistered<DashboardNotifier>())
        await sl<DashboardNotifier>().refreshAll();
      _isSuccess = true;
    } else {
      _leaveError = result.message;
    }

    hideLoading();
    notifyListeners();
  }

  bool _validate(String start, String end, String reason) {
    if (start.isEmpty || end.isEmpty || reason.isEmpty) {
      _leaveError = "Mohon lengkapi formulir pengajuan";
      notifyListeners();
      return false;
    }
    try {
      final dtStart = DateFormat('yyyy-MM-dd').parse(start);
      final dtEnd = DateFormat('yyyy-MM-dd').parse(end);
      final todayStr = DateFormat('yyyy-MM-dd').format(DateTime.now());
      final dtToday = DateFormat('yyyy-MM-dd').parse(todayStr);
      if (dtStart.isBefore(dtToday)) {
        _leaveError = "Tanggal mulai tidak boleh di masa lalu";
      } else if (dtEnd.isBefore(dtStart)) {
        _leaveError = "Tanggal selesai tidak boleh sebelum mulai";
      }
      final duration = dtEnd.difference(dtStart).inDays + 1;
      if (duration > _remainingLeave) {
        _leaveError = "Sisa cuti tidak mencukupi (Sisa: $_remainingLeave hari)";
      }
      if (_leaveError.isNotEmpty) {
        notifyListeners();
        return false;
      }
    } catch (e) {
      _leaveError = "Format tanggal tidak valid";
      notifyListeners();
      return false;
    }
    return true;
  }

  @override
  void clearError() => setError("");
  void clearSuccess() => _isSuccess = false;

  @override
  void dispose() {
    startDateController.dispose();
    endDateController.dispose();
    reasonController.dispose();
    super.dispose();
  }
}

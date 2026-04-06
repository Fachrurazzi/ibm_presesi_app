import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/app/module/use_case/leave_get_history.dart';
import 'package:ibm_presensi_app/app/module/use_case/leave_send.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:intl/intl.dart'; // Pastikan import intl

class LeaveNotifier extends AppProvider {
  final LeaveSendUseCase _leaveSendUseCase;
  final LeaveGetHistoryUseCase _leaveGetHistoryUseCase;

  LeaveNotifier(this._leaveSendUseCase, this._leaveGetHistoryUseCase) {
    init();
  }

  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;

  int _leaveQuota = 0;
  int get leaveQuota => _leaveQuota;

  List<LeaveEntity> _listLeave = [];
  List<LeaveEntity> get listLeave => _listLeave;

  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final reasonController = TextEditingController();

  @override
  void init() async {
    _isSuccess = false;
    _leaveQuota =
        await SharedPreferencesHelper.getInt(AppPreferences.LEAVE_QUOTA) ?? 0;
    getHistory();
  }

  Future<void> getHistory() async {
    showLoading();
    final response = await _leaveGetHistoryUseCase();
    if (response.success) {
      _listLeave = response.data ?? [];
    } else {
      errorMessage = response.message;
    }
    hideLoading();
    notifyListeners();
  }

  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      // FIX: Gunakan DateFormat agar murni string YYYY-MM-DD
      // Ini jauh lebih aman daripada manipulasi string manual
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
      notifyListeners();
    }
  }

  Future<void> send() async {
    final start = startDateController.text;
    final end = endDateController.text;
    final reason = reasonController.text.trim();

    if (start.isEmpty || end.isEmpty || reason.isEmpty) {
      errorMessage = "Mohon lengkapi formulir pengajuan";
      notifyListeners();
      return;
    }

    // --- FIX VALIDASI AGAR TIDAK SALAH TIMEZONE ---
    try {
      DateTime dtStart = DateFormat('yyyy-MM-dd').parse(start);
      DateTime dtEnd = DateFormat('yyyy-MM-dd').parse(end);

      if (dtEnd.isBefore(dtStart)) {
        errorMessage = "Tanggal selesai tidak boleh sebelum mulai";
        notifyListeners();
        return;
      }
    } catch (e) {
      errorMessage = "Format tanggal tidak valid";
      notifyListeners();
      return;
    }

    showLoading();
    // Kirim string 'start' dan 'end' langsung, jangan di-parse jadi DateTime lagi di Repository
    final param =
        LeaveParamEntity(startDate: start, endDate: end, reason: reason);
    final response = await _leaveSendUseCase(param: param);

    if (response.success) {
      _isSuccess = true;
      startDateController.clear();
      endDateController.clear();
      reasonController.clear();
      await getHistory();
    } else {
      errorMessage = response.message;
    }
    hideLoading();
    notifyListeners();
  }

  @override
  void dispose() {
    startDateController.dispose();
    endDateController.dispose();
    reasonController.dispose();
    super.dispose();
  }
}

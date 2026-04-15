import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/app/module/use_case/leave_get_history.dart';
import 'package:ibm_presensi_app/app/module/use_case/leave_send.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_notifier.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:intl/intl.dart';

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

  String leaveError = "";
  List<LeaveEntity> _listLeave = [];
  List<LeaveEntity> get listLeave => _listLeave;

  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final reasonController = TextEditingController();

  set isSuccess(bool value) {
    _isSuccess = value;
    notifyListeners();
  }

  @override
  void init() async {
    _isSuccess = false;
    leaveError = "";

    // 1. Ambil data lokal segera saat inisialisasi
    _syncQuotaData();

    // 2. Load riwayat
    getHistory();
  }

  /// REVISI: Ambil data dari Storage sebagai prioritas utama
  void _syncQuotaData() {
    // Kita prioritaskan ambil dari SharedPreferences karena HomeNotifier pasti sudah menulis ke sana
    final int? localQuota =
        SharedPreferencesHelper.getInt(AppPreferences.LEAVE_QUOTA);

    if (localQuota != null) {
      _leaveQuota = localQuota;
      debugPrint("📊 [LEAVE_SYNC] Menggunakan data dari Storage: $_leaveQuota");
    } else if (sl.isRegistered<HomeNotifier>()) {
      _leaveQuota = sl<HomeNotifier>().leaveQuota;
      debugPrint(
          "📊 [LEAVE_SYNC] Menggunakan data dari HomeNotifier: $_leaveQuota");
    }

    notifyListeners();
  }

  Future<void> getHistory() async {
    showLoading();
    final response = await _leaveGetHistoryUseCase();
    if (response.success) {
      _listLeave = response.data ?? [];
    } else {
      leaveError = response.message;
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
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme:
              ColorScheme.light(primary: Theme.of(context).primaryColor),
        ),
        child: child!,
      ),
    );

    if (picked != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
      notifyListeners();
    }
  }

  Future<void> send() async {
    final start = startDateController.text;
    final end = endDateController.text;
    final reason = reasonController.text.trim();

    leaveError = "";
    if (!_validate(start, end, reason)) return;

    showLoading();
    _isSuccess = false;

    final param =
        LeaveParamEntity(startDate: start, endDate: end, reason: reason);
    final response = await _leaveSendUseCase(param: param);

    if (response.success) {
      startDateController.clear();
      endDateController.clear();
      reasonController.clear();

      // 1. Trigger HomeNotifier untuk tarik data terbaru dari server Laravel
      if (sl.isRegistered<HomeNotifier>()) {
        debugPrint(
            "🔄 [LEAVE_SEND] Memicu refresh data server di HomeNotifier...");
        await sl<HomeNotifier>().refreshData();
      }

      // 2. Tunggu sebentar agar SharedPreferences selesai menulis data (IO Delay)
      await Future.delayed(const Duration(milliseconds: 500));

      // 3. Update Kuota di halaman ini
      _syncQuotaData();

      // 4. Update riwayat
      await getHistory();

      _isSuccess = true;
    } else {
      leaveError = response.message;
    }

    hideLoading();
    notifyListeners();
  }

  bool _validate(String start, String end, String reason) {
    if (start.isEmpty || end.isEmpty || reason.isEmpty) {
      leaveError = "Mohon lengkapi formulir pengajuan";
      notifyListeners();
      return false;
    }

    try {
      DateTime dtStart = DateFormat('yyyy-MM-dd').parse(start);
      DateTime dtEnd = DateFormat('yyyy-MM-dd').parse(end);
      DateTime today = DateFormat('yyyy-MM-dd')
          .parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));

      if (dtStart.isBefore(today)) {
        leaveError = "Tanggal mulai tidak boleh di masa lalu";
      } else if (dtEnd.isBefore(dtStart)) {
        leaveError = "Tanggal selesai tidak boleh sebelum mulai";
      }

      if (leaveError.isNotEmpty) {
        notifyListeners();
        return false;
      }
    } catch (e) {
      leaveError = "Format tanggal tidak valid";
      notifyListeners();
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    startDateController.dispose();
    endDateController.dispose();
    reasonController.dispose();
    super.dispose();
  }
}

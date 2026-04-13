import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/app/module/use_case/leave_get_history.dart';
import 'package:ibm_presensi_app/app/module/use_case/leave_send.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:intl/intl.dart';

class LeaveNotifier extends AppProvider {
  final LeaveSendUseCase _leaveSendUseCase;
  final LeaveGetHistoryUseCase _leaveGetHistoryUseCase;

  LeaveNotifier(this._leaveSendUseCase, this._leaveGetHistoryUseCase) {
    init();
  }

  // --- UI & Data State ---
  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;

  int _leaveQuota = 0;
  int get leaveQuota => _leaveQuota;

  String leaveError = "";
  List<LeaveEntity> _listLeave = [];
  List<LeaveEntity> get listLeave => _listLeave;

  set isSuccess(bool value) {
    _isSuccess = value;
    notifyListeners();
  }

  // Controllers
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final reasonController = TextEditingController();

  @override
  void init() async {
    // Saat inisialisasi awal, pastikan state bersih
    _isSuccess = false;
    leaveError = "";

    // Load kuota dari local storage agar instan tampil di UI
    _leaveQuota =
        SharedPreferencesHelper.getInt(AppPreferences.LEAVE_QUOTA) ?? 0;

    getHistory();
  }

  /// Reset form input tanpa mematikan status sukses/error untuk notifikasi
  void clearForm() {
    startDateController.clear();
    endDateController.clear();
    reasonController.clear();
    notifyListeners();
  }

  /// Sinkronisasi Riwayat Cuti
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

  /// Date Picker yang sinkron dengan format Laravel
  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (picked != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
      notifyListeners();
    }
  }

  /// Proses Submit Pengajuan Cuti
  Future<void> send() async {
    final start = startDateController.text;
    final end = endDateController.text;
    final reason = reasonController.text.trim();

    if (!_validate(start, end, reason)) return;

    showLoading();
    leaveError = "";
    _isSuccess = false; // Reset status sebelum mulai

    final param =
        LeaveParamEntity(startDate: start, endDate: end, reason: reason);
    final response = await _leaveSendUseCase(param: param);

    if (response.success) {
      // 1. Bersihkan form field-nya saja
      startDateController.clear();
      endDateController.clear();
      reasonController.clear();

      // 2. Tandai sukses agar UI memunculkan notifikasi
      _isSuccess = true;

      // 3. Tarik data riwayat terbaru dari server
      await getHistory();
    } else {
      leaveError = response.message;
    }

    hideLoading();
    notifyListeners();
  }

  /// Validasi Internal Logic
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
      leaveError = "Format tanggal bermasalah";
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

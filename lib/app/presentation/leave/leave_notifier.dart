import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/app/module/use_case/leave_get_history.dart'; // Tambahkan UseCase Get
import 'package:ibm_presensi_app/app/module/use_case/leave_send.dart';
import 'package:ibm_presensi_app/core/helper/date_time_helper.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class LeaveNotifier extends AppProvider {
  final LeaveSendUseCase _leaveSendUseCase;
  final LeaveGetHistoryUseCase _leaveGetHistoryUseCase;

  LeaveNotifier(this._leaveSendUseCase, this._leaveGetHistoryUseCase) {
    init();
  }

  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;

  List<LeaveEntity> _listLeave = [];
  List<LeaveEntity> get listLeave => _listLeave;

  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final reasonController = TextEditingController();

  @override
  void init() {
    _isSuccess = false;
    getHistory(); // Ambil riwayat saat inisialisasi
  }

  // Fungsi ambil riwayat dari API Laravel
  Future<void> getHistory() async {
    showLoading();
    final response = await _leaveGetHistoryUseCase();
    if (response.success) {
      _listLeave = response.data ?? [];
    } else {
      snackbarMessage = response.message;
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
      controller.text =
          DateTimeHelper.formatDateTime(dateTime: picked, format: 'yyyy-MM-dd');
      notifyListeners();
    }
  }

  Future<void> send() async {
    if (startDateController.text.isEmpty ||
        endDateController.text.isEmpty ||
        reasonController.text.isEmpty) {
      snackbarMessage = "Lengkapi semua data pengajuan";
      return;
    }

    showLoading();
    final param = LeaveParamEntity(
      startDate: startDateController.text,
      endDate: endDateController.text,
      reason: reasonController.text,
    );

    final response = await _leaveSendUseCase(param: param);

    if (response.success) {
      _isSuccess = true;
      startDateController.clear();
      endDateController.clear();
      reasonController.clear();
      await getHistory(); // Refresh list setelah kirim
    } else {
      snackbarMessage = response.message;
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

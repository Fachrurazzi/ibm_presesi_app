import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/app/module/use_case/leave_send.dart';
import 'package:ibm_presensi_app/core/helper/date_time_helper.dart'; // Asumsi helper tanggal tersedia
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class LeaveNotifier extends AppProvider {
  final LeaveSendUseCase _leaveSendUseCase;

  LeaveNotifier(this._leaveSendUseCase) {
    init();
  }

  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;

  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final reasonController = TextEditingController();

  @override
  void init() {
    _isSuccess = false;
  }

  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: Theme.of(context).colorScheme.primary,
                ),
          ),
          child: child!,
        );
      },
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
      notifyListeners();
    } else {
      snackbarMessage = response.message;
    }
    hideLoading();
  }
}

import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_by_month_year.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class DetailAttendanceNotifier extends AppProvider {
  final AttendanceGetByMonthYear _attendanceGetByMonthYear;

  DetailAttendanceNotifier(this._attendanceGetByMonthYear) {
    init();
  }

  final monthController = TextEditingController();
  final yearController = TextEditingController();

  final List<DropdownMenuEntry<int>> monthListDropdown = [
    const DropdownMenuEntry(value: 1, label: 'Januari'),
    const DropdownMenuEntry(value: 2, label: 'Februari'),
    const DropdownMenuEntry(value: 3, label: 'Maret'),
    const DropdownMenuEntry(value: 4, label: 'April'),
    const DropdownMenuEntry(value: 5, label: 'Mei'),
    const DropdownMenuEntry(value: 6, label: 'Juni'),
    const DropdownMenuEntry(value: 7, label: 'Juli'),
    const DropdownMenuEntry(value: 8, label: 'Agustus'),
    const DropdownMenuEntry(value: 9, label: 'September'),
    const DropdownMenuEntry(value: 10, label: 'Oktober'),
    const DropdownMenuEntry(value: 11, label: 'November'),
    const DropdownMenuEntry(value: 12, label: 'Desember'),
  ];

  final List<DropdownMenuEntry<int>> yearListDropdown = [
    const DropdownMenuEntry(value: 2026, label: '2026'),
    const DropdownMenuEntry(value: 2025, label: '2025'),
  ];

  List<AttendanceEntity> _listAttendance = [];
  List<AttendanceEntity> get listAttendance => _listAttendance;

  @override
  void init() {
    // Otomatis cari data bulan sekarang saat masuk halaman
    Future.microtask(() => search());
  }

  @override
  void dispose() {
    monthController.dispose();
    yearController.dispose();
    super.dispose();
  }

  Future<void> search() async {
    showLoading();

    try {
      // Ambil value berdasarkan label yang ada di controller
      final month = monthListDropdown
          .firstWhere((e) => e.label == monthController.text,
              orElse: () => monthListDropdown[DateTime.now().month - 1])
          .value;
      final year = yearListDropdown
          .firstWhere((e) => e.label == yearController.text,
              orElse: () => yearListDropdown[0])
          .value;

      final response = await _attendanceGetByMonthYear(
          param: AttendanceParamGetEntity(month: month, year: year));

      if (response.success) {
        _listAttendance = response.data ?? [];
        if (_listAttendance.isEmpty) {
          snackbarMessage = "Tidak ada data ditemukan";
        }
      } else {
        errorMessage = response.message;
      }
    } catch (e) {
      snackbarMessage = "Gagal memproses data riwayat";
    }

    hideLoading();
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_by_month_year.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class DetailAttendanceNotifier extends AppProvider {
  final AttendanceGetByMonthYear _attendanceGetByMonthYear;

  DetailAttendanceNotifier(this._attendanceGetByMonthYear) {
    // Ambil waktu sekarang untuk default pencarian
    final now = DateTime.now();
    _selectedMonth = now.month;
    _selectedYear = now.year;

    init();
  }

  // --- State Variables ---
  int _selectedMonth = 1;
  int _selectedYear = 2026;
  List<AttendanceEntity> _listAttendance = [];
  bool _isPusat = false;

  // --- Getters ---
  int get selectedMonth => _selectedMonth;
  int get selectedYear => _selectedYear;
  List<AttendanceEntity> get listAttendance => _listAttendance;
  bool get isPusat => _isPusat;

  // List dropdown entries (Static)
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

  @override
  void init() {
    _checkOffice();
    // Gunakan Future.delayed agar build context selesai dulu
    Future.delayed(Duration.zero, () => search());
  }

  // Fungsi untuk update nilai dari UI
  void onMonthSelected(int? val) {
    if (val != null) {
      _selectedMonth = val;
      notifyListeners(); // Update UI agar pilihan dropdown terlihat berubah
    }
  }

  void onYearSelected(int? val) {
    if (val != null) {
      _selectedYear = val;
      notifyListeners();
    }
  }

  Future<void> _checkOffice() async {
    final office =
        await SharedPreferencesHelper.getString(AppPreferences.OFFICE_NAME) ??
            "";
    _isPusat = office.toLowerCase().contains("pusat");
    notifyListeners();
  }

  Future<void> search() async {
    // Reset error & tampilkan loading
    errorMessage = '';
    showLoading();

    // Kosongkan list lama agar user tahu data sedang di-refresh
    _listAttendance = [];
    notifyListeners();

    try {
      final response = await _attendanceGetByMonthYear(
        param: AttendanceParamGetEntity(
          month: _selectedMonth,
          year: _selectedYear,
        ),
      );

      if (response.success) {
        _listAttendance = response.data ?? [];
        // Sorting: Tanggal terbaru di posisi paling atas
        _listAttendance.sort((a, b) => (b.date ?? "").compareTo(a.date ?? ""));
      } else {
        errorMessage = response.message;
      }
    } catch (e) {
      errorMessage = "Gagal memuat data dari server PT Intiboga";
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}

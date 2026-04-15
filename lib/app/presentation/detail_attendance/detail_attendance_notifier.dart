import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_by_month_year.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_today.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class DetailAttendanceNotifier extends AppProvider {
  final AttendanceGetByMonthYear _attendanceGetByMonthYear;

  DetailAttendanceNotifier(this._attendanceGetByMonthYear) {
    final now = DateTime.now();
    _selectedMonth = now.month;
    _selectedYear = now.year;

    // Gunakan scheduling agar init tidak menabrak proses build UI
    Future.microtask(() => init());
  }

  int _selectedMonth = 1;
  int _selectedYear = 2026;
  List<AttendanceEntity> _listAttendance = [];
  bool _isPusat = false;
  bool _isWfa = false;

  int get selectedMonth => _selectedMonth;
  int get selectedYear => _selectedYear;
  List<AttendanceEntity> get listAttendance => _listAttendance;
  bool get isPusat => _isPusat;
  bool get isWfa => _isWfa;

  String get totalUangMakan {
    int total =
        _listAttendance.fold(0, (sum, item) => sum + (item.lunchMoney ?? 0));
    return NumberFormat.currency(
            locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0)
        .format(total);
  }

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

  // REVISI: Buat list tahun dinamis (Tahun ini dan tahun lalu)
  List<DropdownMenuEntry<int>> get yearListDropdown {
    int currentYear = DateTime.now().year;
    return [
      DropdownMenuEntry(value: currentYear, label: currentYear.toString()),
      DropdownMenuEntry(
          value: currentYear - 1, label: (currentYear - 1).toString()),
    ];
  }

  @override
  void init() {
    _syncLocalData();
    search();
  }

  void _syncLocalData() {
    final office =
        SharedPreferencesHelper.getString(AppPreferences.OFFICE_NAME) ?? "";
    _isPusat = office.toLowerCase().contains("pusat");
    _isWfa = SharedPreferencesHelper.getBool('IS_WFA') ?? false;
    notifyListeners();
  }

  void onMonthSelected(int? val) {
    if (val != null && val != _selectedMonth) {
      _selectedMonth = val;
      search(); // Tidak perlu notifyListeners di sini karena search() akan memanggilnya di akhir
    }
  }

  void onYearSelected(int? val) {
    if (val != null && val != _selectedYear) {
      _selectedYear = val;
      search();
    }
  }

  Future<void> search() async {
    errorMessage = '';
    showLoading();

    try {
      final response = await _attendanceGetByMonthYear(
        param: AttendanceParamGetEntity(
          month: _selectedMonth,
          year: _selectedYear,
        ),
      );

      if (response.success) {
        _listAttendance = response.data ?? [];
        // Sort tanggal DESC (Terbaru di atas)
        _listAttendance.sort((a, b) => (b.date ?? "").compareTo(a.date ?? ""));
      } else {
        errorMessage = response.message;
        _listAttendance = []; // Reset list jika gagal agar UI bersih
      }
    } catch (e) {
      debugPrint("🚨 SEARCH_ERROR: $e");
      errorMessage = "Gagal memuat data riwayat";
      _listAttendance = [];
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}

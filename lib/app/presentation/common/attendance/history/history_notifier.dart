import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_history_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/attendance_get_summary_use_case.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class HistoryNotifier extends AppProvider {
  final AttendanceGetHistoryUseCase _getHistoryUseCase;
  final AttendanceGetSummaryUseCase _getSummaryUseCase;

  HistoryNotifier(this._getHistoryUseCase, this._getSummaryUseCase) {
    final now = DateTime.now();
    _selectedMonth = now.month;
    _selectedYear = now.year;
    Future.microtask(() => init());
  }

  int _selectedMonth = 1;
  int _selectedYear = 2026;
  List<AttendanceEntity> _listAttendance = [];
  AttendanceSummary? _summary;
  bool _isPusat = false;
  bool _isWfa = false;

  int get selectedMonth => _selectedMonth;
  int get selectedYear => _selectedYear;
  List<AttendanceEntity> get listAttendance => _listAttendance;
  AttendanceSummary? get summary => _summary;
  bool get isPusat => _isPusat;
  bool get isWfa => _isWfa;

  String get totalUangMakan {
    final total = _listAttendance.fold<int>(0, (sum, item) => sum + (item.lunchMoney ?? 0));
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(total);
  }

  final List<DropdownMenuEntry<int>> monthListDropdown = const [
    DropdownMenuEntry(value: 1, label: 'Januari'),
    DropdownMenuEntry(value: 2, label: 'Februari'),
    DropdownMenuEntry(value: 3, label: 'Maret'),
    DropdownMenuEntry(value: 4, label: 'April'),
    DropdownMenuEntry(value: 5, label: 'Mei'),
    DropdownMenuEntry(value: 6, label: 'Juni'),
    DropdownMenuEntry(value: 7, label: 'Juli'),
    DropdownMenuEntry(value: 8, label: 'Agustus'),
    DropdownMenuEntry(value: 9, label: 'September'),
    DropdownMenuEntry(value: 10, label: 'Oktober'),
    DropdownMenuEntry(value: 11, label: 'November'),
    DropdownMenuEntry(value: 12, label: 'Desember'),
  ];

  List<DropdownMenuEntry<int>> get yearListDropdown {
    final currentYear = DateTime.now().year;
    return [
      DropdownMenuEntry(value: currentYear, label: currentYear.toString()),
      DropdownMenuEntry(value: currentYear - 1, label: (currentYear - 1).toString()),
    ];
  }

  @override
  Future<void> init() async {
    _syncLocalData();
    await search();
  }

  void _syncLocalData() {
    final office = SharedPreferencesHelper.getString(AppPreferences.OFFICE_NAME) ?? "";
    _isPusat = office.toLowerCase().contains("pusat");
    _isWfa = SharedPreferencesHelper.getBool(AppPreferences.IS_WFA) ?? false;
    notifyListeners();
  }

  void onMonthSelected(int? val) {
    if (val != null && val != _selectedMonth) {
      _selectedMonth = val;
      search();
    }
  }

  void onYearSelected(int? val) {
    if (val != null && val != _selectedYear) {
      _selectedYear = val;
      search();
    }
  }

  Future<void> search() async {
    clearError();
    showLoading();

    try {
      final historyParams = AttendanceHistoryParams(month: _selectedMonth, year: _selectedYear, perPage: 50);
      final historyResult = await _getHistoryUseCase(historyParams);

      final summaryParams = AttendanceSummaryParams(month: _selectedMonth, year: _selectedYear);
      final summaryResult = await _getSummaryUseCase(summaryParams);

      if (historyResult is SuccessState<PaginatedAttendance>) {
        _listAttendance = historyResult.data?.data ?? [];
        _listAttendance.sort((a, b) => (b.date ?? "").compareTo(a.date ?? ""));
      } else {
        setError(historyResult.message);
        _listAttendance = [];
      }

      if (summaryResult is SuccessState<AttendanceSummary>) {
        _summary = summaryResult.data;
      }
    } catch (e) {
      debugPrint("🚨 SEARCH_ERROR: $e");
      setError("Gagal memuat data riwayat");
      _listAttendance = [];
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  @override
  void clearError() {
    setError("");
  }
}
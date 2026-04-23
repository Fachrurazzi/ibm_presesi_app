import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/dashboard.dart';
import 'package:ibm_presensi_app/app/module/use_case/dashboard_get_monthly_summary_use_case.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class ReportNotifier extends AppProvider {
  final DashboardGetMonthlySummaryUseCase _getMonthlySummaryUseCase;

  ReportNotifier(this._getMonthlySummaryUseCase) {
    final now = DateTime.now();
    _selectedMonth = now.month;
    _selectedYear = now.year;
    init();
  }

  int _selectedMonth = 1;
  int _selectedYear = 2026;
  MonthlySummary? _summary;
  bool _isLoading = false;

  int get selectedMonth => _selectedMonth;
  int get selectedYear => _selectedYear;
  MonthlySummary? get summary => _summary;
  bool get isLoadingData => _isLoading;

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
      DropdownMenuEntry(
          value: currentYear - 1, label: (currentYear - 1).toString())
    ];
  }

  @override
  Future<void> init() async {
    await loadData();
  }

  Future<void> loadData() async {
    _isLoading = true;
    notifyListeners();
    final result = await _getMonthlySummaryUseCase(
        MonthlySummaryParams(month: _selectedMonth, year: _selectedYear));
    if (result is SuccessState<MonthlySummary>) _summary = result.data;
    _isLoading = false;
    notifyListeners();
  }

  void onMonthChanged(int? month) {
    if (month != null && month != _selectedMonth) {
      _selectedMonth = month;
      loadData();
    }
  }

  void onYearChanged(int? year) {
    if (year != null && year != _selectedYear) {
      _selectedYear = year;
      loadData();
    }
  }

  @override
  void clearError() => setError("");
}

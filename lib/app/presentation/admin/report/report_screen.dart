import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/dashboard.dart';
import 'package:ibm_presensi_app/app/presentation/admin/report/report_notifier.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ReportScreen extends AppWidget<ReportNotifier, void, void> {
  ReportScreen({super.key}) : super(param1: null, param2: null);

  @override
  Widget bodyBuild(BuildContext context) {
    final prov = context.watch<ReportNotifier>();
    final theme = Theme.of(context);
    final summary = prov.summary;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
          title: const Text("Laporan",
              style: TextStyle(fontWeight: FontWeight.w900)),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white),
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.all(16),
            child: Row(children: [
              Expanded(
                  child: DropdownMenu<int>(
                      label: const Text('Bulan'),
                      initialSelection: prov.selectedMonth,
                      dropdownMenuEntries: prov.monthListDropdown,
                      onSelected: prov.onMonthChanged)),
              const SizedBox(width: 12),
              Expanded(
                  child: DropdownMenu<int>(
                      label: const Text('Tahun'),
                      initialSelection: prov.selectedYear,
                      dropdownMenuEntries: prov.yearListDropdown,
                      onSelected: prov.onYearChanged))
            ])),
        Expanded(
            child: prov.isLoadingData
                ? _buildShimmerContent()
                : summary == null
                    ? _buildEmptyState()
                    : SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Column(children: [
                          _buildSummaryCard(summary, theme),
                          const SizedBox(height: 24),
                          _buildCalendarSection(summary, theme)
                        ]))),
      ]),
    );
  }

  Widget _buildSummaryCard(MonthlySummary summary, ThemeData theme) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(24)),
        child: Column(children: [
          Text(summary.monthName ?? "Ringkasan",
              style:
                  const TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
          const SizedBox(height: 16),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            _buildSummaryItem(
                "Hari Kerja", summary.totalWorkingDays.toString(), Colors.blue),
            _buildSummaryItem(
                "Hadir", summary.presentDays.toString(), Colors.green),
            _buildSummaryItem(
                "Terlambat", summary.lateDays.toString(), Colors.orange),
            _buildSummaryItem(
                "Absen", summary.absentDays.toString(), Colors.red)
          ]),
          const SizedBox(height: 16),
          LinearProgressIndicator(
              value: summary.attendanceRate / 100,
              backgroundColor: Colors.grey.shade200,
              color: summary.rateColor,
              minHeight: 10,
              borderRadius: BorderRadius.circular(10)),
          const SizedBox(height: 8),
          Text("${summary.attendanceRateDisplay} Kehadiran",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: summary.rateColor))
        ]));
  }

  Widget _buildSummaryItem(String label, String value, Color color) =>
      Column(children: [
        Text(value,
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 20, color: color)),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey))
      ]);

  Widget _buildCalendarSection(MonthlySummary summary, ThemeData theme) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(24)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Kalender Kehadiran",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
          const SizedBox(height: 16),
          Wrap(
              spacing: 8,
              runSpacing: 8,
              children: summary.calendar
                      ?.map((day) => _buildCalendarDay(day, theme))
                      .toList() ??
                  [])
        ]));
  }

  Widget _buildCalendarDay(CalendarDay day, ThemeData theme) {
    return Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: day.statusColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: day.statusColor.withOpacity(0.3))),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(day.day,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: day.statusColor)),
          Text(day.dayName ?? "",
              style: TextStyle(fontSize: 8, color: day.statusColor))
        ]));
  }

  Widget _buildShimmerContent() => SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Column(children: [
            Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24))),
            const SizedBox(height: 24),
            Container(
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24)))
          ])));
  Widget _buildEmptyState() => Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.assessment_outlined, size: 80, color: Colors.grey.shade300),
        const SizedBox(height: 16),
        const Text("Tidak Ada Data",
            style:
                TextStyle(fontWeight: FontWeight.w900, color: Colors.blueGrey))
      ]));

  @override
  void checkVariableAfterUi(BuildContext context) {}
  @override
  void checkVariableBeforeUi(BuildContext context) {}
  @override
  AppBar? appBarBuild(BuildContext context) => null;
}

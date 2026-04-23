import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/presentation/manager/team_attendance/team_attendance_notifier.dart';
import 'package:ibm_presensi_app/core/helper/date_time_helper.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class TeamAttendanceScreen
    extends AppWidget<TeamAttendanceNotifier, void, void> {
  TeamAttendanceScreen({super.key}) : super(param1: null, param2: null);

  @override
  Widget bodyBuild(BuildContext context) {
    final prov = context.watch<TeamAttendanceNotifier>();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text("Absensi Tim",
            style: TextStyle(fontWeight: FontWeight.w900)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: DropdownMenu<int>(
                    label: const Text('Bulan'),
                    initialSelection: prov.selectedMonth,
                    dropdownMenuEntries: prov.monthListDropdown,
                    onSelected: prov.onMonthChanged,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownMenu<int>(
                    label: const Text('Tahun'),
                    initialSelection: prov.selectedYear,
                    dropdownMenuEntries: prov.yearListDropdown,
                    onSelected: prov.onYearChanged,
                  ),
                ),
              ],
            ),
          ),
          if (prov.summary != null) _buildSummaryCard(prov.summary!, theme),
          Expanded(
            child: prov.isLoading
                ? _buildShimmerList()
                : prov.listAttendance.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: prov.listAttendance.length,
                        itemBuilder: (context, index) => _buildAttendanceCard(
                            prov.listAttendance[index], theme),
                      ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(AttendanceSummary summary, ThemeData theme) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildSummaryItem(
              "Hadir", summary.presentDays.toString(), Colors.green),
          _buildSummaryItem(
              "Terlambat", summary.lateDays.toString(), Colors.orange),
          _buildSummaryItem("Absen", summary.absentDays.toString(), Colors.red),
          _buildSummaryItem(
              "Rate",
              "${summary.attendanceRate.toStringAsFixed(1)}%",
              theme.colorScheme.primary),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 18, color: color),
        ),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }

  Widget _buildAttendanceCard(AttendanceEntity item, ThemeData theme) {
    // Format waktu
    final startTime = item.startTime != null && item.startTime != "--:--"
        ? item.startTime!.substring(0, 5)
        : "--:--";
    final endTime = item.endTime != null && item.endTime != "--:--"
        ? item.endTime!.substring(0, 5)
        : "--:--";
    final lunchMoney = item.lunchMoney ?? 0;
    final lunchMoneyLabel =
        item.lunchMoneyLabel ?? (lunchMoney > 0 ? "Rp $lunchMoney" : "Rp 0");

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.05),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                DateTimeHelper.formatString(
                    dateTimeString: item.date, format: 'dd\nMMM'),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$startTime - $endTime",
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      item.isLate
                          ? Icons.warning_amber_rounded
                          : Icons.check_circle_rounded,
                      color: item.isLate ? Colors.orange : Colors.green,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      item.isLate ? "Terlambat" : "Tepat Waktu",
                      style: TextStyle(
                        fontSize: 11,
                        color: item.isLate ? Colors.orange : Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: lunchMoney > 0
                  ? Colors.green.withOpacity(0.1)
                  : Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              lunchMoneyLabel,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: lunchMoney > 0 ? Colors.green : Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 8,
      itemBuilder: (_, __) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people_outline_rounded,
              size: 80, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          const Text("Tidak Ada Data",
              style: TextStyle(
                  fontWeight: FontWeight.w900, color: Colors.blueGrey)),
          const Text("Tim belum melakukan absensi bulan ini",
              style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  @override
  void checkVariableAfterUi(BuildContext context) {
    if (notifier.hasError) {
      final msg = notifier.errorMessage;
      notifier.clearError();
      GlobalHelper.showErrorNotification(
        context: context,
        title: "Gagal Memuat",
        message: msg,
      );
    }
  }

  @override
  void checkVariableBeforeUi(BuildContext context) {}

  @override
  AppBar? appBarBuild(BuildContext context) => null;
}

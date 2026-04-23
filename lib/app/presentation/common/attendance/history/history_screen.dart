import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/presentation/common/attendance/history/history_notifier.dart';
import 'package:ibm_presensi_app/core/helper/date_time_helper.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HistoryScreen extends AppWidget<HistoryNotifier, void, void> {
  HistoryScreen({super.key}) : super(param1: null, param2: null);

  @override
  Widget bodyBuild(BuildContext context) {
    final prov = context.watch<HistoryNotifier>();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: Offset(0, 10))
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      _buildAppBar(context),
                      _buildFilterSection(context, prov),
                      if (!prov.isLoading && prov.listAttendance.isNotEmpty)
                        _buildTotalLunchMoneyHeader(prov),
                    ],
                  ),
                ),
              ),
              _buildListContent(context, prov),
              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListContent(BuildContext context, HistoryNotifier prov) {
    if (prov.isLoading) {
      return SliverPadding(
        padding: const EdgeInsets.all(24),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => _buildShimmerItem(),
              childCount: 6),
        ),
      );
    }

    if (prov.listAttendance.isEmpty) {
      return SliverFillRemaining(child: _buildEmptyState(context));
    }

    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => _buildPresenceItem(
              context, prov.listAttendance[index], Theme.of(context)),
          childCount: prov.listAttendance.length,
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
            onPressed: () => Navigator.pop(context),
          ),
          const Expanded(
            child: Center(
              child: Text('Riwayat Presensi',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildTotalLunchMoneyHeader(HistoryNotifier prov) {
    final dapatCatering = prov.isPusat && !prov.isWfa;
    final summary = prov.summary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: dapatCatering ? Colors.blue.shade50 : Colors.green.shade50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color:
                  dapatCatering ? Colors.blue.shade100 : Colors.green.shade100),
        ),
        child: Row(
          children: [
            Icon(
                dapatCatering
                    ? Icons.restaurant_rounded
                    : Icons.payments_rounded,
                size: 18,
                color: dapatCatering
                    ? Colors.blue.shade700
                    : Colors.green.shade700),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      dapatCatering
                          ? "Fasilitas Makan: Aktif"
                          : "Total Uang Makan",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 13,
                          color: dapatCatering
                              ? Colors.blue.shade800
                              : Colors.green.shade800)),
                  if (!dapatCatering)
                    Text(prov.totalUangMakan,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.green.shade900)),
                  if (summary != null)
                    Text(
                        "Hadir: ${summary.presentDays} | Terlambat: ${summary.lateDays}",
                        style: TextStyle(
                            fontSize: 10,
                            color: dapatCatering
                                ? Colors.blue.shade600
                                : Colors.green.shade600)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSection(BuildContext context, HistoryNotifier prov) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
              flex: 3,
              child: _buildCustomDropdown<int>(
                  label: "Bulan",
                  value: prov.selectedMonth,
                  entries: prov.monthListDropdown,
                  onSelected: prov.onMonthSelected)),
          const SizedBox(width: 8),
          Expanded(
              flex: 2,
              child: _buildCustomDropdown<int>(
                  label: "Tahun",
                  value: prov.selectedYear,
                  entries: prov.yearListDropdown,
                  onSelected: prov.onYearSelected)),
          const SizedBox(width: 8),
          _buildSearchButton(context, prov),
        ],
      ),
    );
  }

  Widget _buildCustomDropdown<T>(
      {required String label,
      required T value,
      required List<DropdownMenuEntry<T>> entries,
      required Function(T?) onSelected}) {
    return DropdownMenu<T>(
      expandedInsets: EdgeInsets.zero,
      label: Text(label,
          style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w900,
              color: Colors.blueGrey)),
      initialSelection: value,
      dropdownMenuEntries: entries,
      onSelected: onSelected,
      textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF8F9FA),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildSearchButton(BuildContext context, HistoryNotifier prov) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4))
      ]),
      child: IconButton.filled(
        onPressed: () {
          HapticFeedback.lightImpact();
          prov.search();
        },
        icon: const Icon(Icons.search_rounded, size: 22),
        style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
      ),
    );
  }

  Widget _buildPresenceItem(
      BuildContext context, AttendanceEntity item, ThemeData theme) {
    final isLate = item.isLate ?? false;
    final statusColor = isLate ? Colors.red : Colors.green;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade100)),
      child: Row(
        children: [
          _buildDateBox(context, item.date ?? ""),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "${item.startTime ?? '--:--'} - ${item.endTime ?? '--:--'}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 15)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                        isLate
                            ? Icons.error_outline_rounded
                            : Icons.check_circle_outline_rounded,
                        color: statusColor,
                        size: 14),
                    const SizedBox(width: 4),
                    Text(isLate ? "Terlambat Datang" : "Hadir Tepat Waktu",
                        style: TextStyle(
                            fontSize: 11,
                            color: statusColor,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          Icon(isLate ? Icons.warning_amber_rounded : Icons.verified_rounded,
              color: isLate ? Colors.orange : Colors.green, size: 22),
        ],
      ),
    );
  }

  Widget _buildDateBox(BuildContext context, String date) {
    final theme = Theme.of(context);
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: theme.primaryColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: Text(
            DateTimeHelper.formatString(
                dateTimeString: date, format: 'dd\nMMM'),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w900,
                color: theme.primaryColor,
                height: 1.2)),
      ),
    );
  }

  Widget _buildShimmerItem() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          height: 80,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20))),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off_rounded, size: 80, color: Colors.grey.shade200),
          const SizedBox(height: 16),
          const Text("Tidak Ada Data",
              style: TextStyle(
                  fontWeight: FontWeight.w900, color: Colors.blueGrey)),
          const Text("Coba pilih bulan atau tahun lain",
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
      HapticFeedback.vibrate();
      GlobalHelper.showErrorNotification(
          context: context, title: "Gagal Memuat", message: msg);
    }
  }

  @override
  void checkVariableBeforeUi(BuildContext context) {}

  @override
  AppBar? appBarBuild(BuildContext context) => null;
}

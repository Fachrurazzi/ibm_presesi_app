import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/presentation/detail_attendance/detail_attendance_notifier.dart';
import 'package:ibm_presensi_app/core/helper/date_time_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';

class DetailAttendanceScreen
    extends AppWidget<DetailAttendanceNotifier, void, void> {
  DetailAttendanceScreen({super.key});

  @override
  AppBar? appBarBuild(BuildContext context) {
    return AppBar(
      title: const Text('Riwayat Presensi',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  @override
  Widget bodyBuild(BuildContext context) {
    final prov = context.watch<DetailAttendanceNotifier>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildFilterSection(context, prov),
          const SizedBox(height: 8),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: prov.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : prov.listAttendance.isEmpty
                      ? _buildEmptyState()
                      : _buildAttendanceList(prov),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection(
      BuildContext context, DetailAttendanceNotifier prov) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // DROPDOWN BULAN (Flex 3)
          Expanded(
            flex: 3,
            child: DropdownMenu<int>(
              expandedInsets: EdgeInsets.zero,
              label: const Text("Bulan",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
              initialSelection: prov.selectedMonth,
              dropdownMenuEntries: prov.monthListDropdown,
              onSelected: (val) => prov.onMonthSelected(val),
              textStyle: const TextStyle(fontSize: 13),
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
          const SizedBox(width: 8),
          // DROPDOWN TAHUN (Flex 2 - Disesuaikan agar tidak terpotong)
          Expanded(
            flex: 2,
            child: DropdownMenu<int>(
              expandedInsets: EdgeInsets.zero,
              label: const Text("Tahun",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
              initialSelection: prov.selectedYear,
              dropdownMenuEntries: prov.yearListDropdown,
              onSelected: (val) => prov.onYearSelected(val),
              textStyle: const TextStyle(fontSize: 13),
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
          const SizedBox(width: 8),
          // SEARCH BUTTON
          SizedBox(
            height: 48,
            width: 48,
            child: IconButton.filled(
              onPressed: () => prov.search(),
              icon: const Icon(Icons.search_rounded, size: 22),
              style: IconButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttendanceList(DetailAttendanceNotifier prov) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      physics: const BouncingScrollPhysics(),
      itemCount: prov.listAttendance.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) =>
          _buildPresenceItem(context, prov, prov.listAttendance[index]),
    );
  }

  Widget _buildPresenceItem(BuildContext context, DetailAttendanceNotifier prov,
      AttendanceEntity item) {
    final theme = Theme.of(context);
    final isLate = item.isLate ?? false;

    // LOGIKA RANTANGAN / UANG MAKAN
    String infoMakan = "";
    Color statusColor = Colors.green;

    if (prov.isPusat) {
      infoMakan = isLate ? "Rantangan Hangus (Telat)" : "Fasilitas Rantangan";
      statusColor = isLate ? Colors.red : Colors.blue;
    } else {
      infoMakan = item.lunchMoneyLabel ?? "Rp 0";
      statusColor = (item.lunchMoney ?? 0) == 0 ? Colors.red : Colors.green;
    }

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4))
        ],
      ),
      child: Row(
        children: [
          // BOX TANGGAL
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                DateTimeHelper.formatDateTimeFromString(
                    dateTimeString: item.date ?? "", format: 'dd\nMMM'),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary),
              ),
            ),
          ),
          const SizedBox(width: 14),
          // INFO DETAIL
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "${item.startTime ?? '--:--'} - ${item.endTime ?? '--:--'}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 15)),
                const SizedBox(height: 4),
                Text(
                  infoMakan,
                  style: TextStyle(
                      fontSize: 11,
                      color: statusColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // ICON STATUS
          Icon(
              isLate ? Icons.warning_amber_rounded : Icons.check_circle_rounded,
              color: isLate ? Colors.orange : Colors.green,
              size: 26),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history_toggle_off_rounded,
              size: 70, color: Colors.grey.shade200),
          const SizedBox(height: 16),
          const Text("Tidak ada riwayat presensi",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
        ],
      ),
    );
  }

  @override
  void checkVariableAfterUi(BuildContext context) {}
  @override
  void checkVariableBeforeUi(BuildContext context) {}
}

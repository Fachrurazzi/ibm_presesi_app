import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/presentation/detail_attendance/detail_attendance_notifier.dart';
import 'package:ibm_presensi_app/core/helper/date_time_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';

class DetailAttendanceScreen
    extends AppWidget<DetailAttendanceNotifier, void, void> {
  DetailAttendanceScreen({super.key});

  @override
  AppBar? appBarBuild(BuildContext context) {
    return AppBar(
      title: const Text('Detail Riwayat Presensi',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Theme.of(context).colorScheme.onSurface,
    );
  }

  @override
  Widget bodyBuild(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Column(
        children: [
          _buildFilterCard(context),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(32)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(32)),
                child: notifier.listAttendance.isEmpty
                    ? _buildEmptyState(context)
                    : _buildAttendanceList(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: _buildDropdown(
                  label: "Bulan",
                  controller: notifier.monthController,
                  entries: notifier.monthListDropdown,
                  initial: DateTime.now().month,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: _buildDropdown(
                  label: "Tahun",
                  controller: notifier.yearController,
                  entries: notifier.yearListDropdown,
                  initial: 2026,
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filled(
                onPressed: () => notifier.search(),
                icon: const Icon(Icons.search_rounded, size: 20),
                style: IconButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  minimumSize: const Size(48, 48),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required TextEditingController controller,
    required List<DropdownMenuEntry<int>> entries,
    required int initial,
  }) {
    return DropdownMenu<int>(
      expandedInsets: EdgeInsets.zero,
      label: Text(label, style: const TextStyle(fontSize: 12)),
      dropdownMenuEntries: entries,
      initialSelection: initial,
      controller: controller,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey.shade50,
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }

  Widget _buildAttendanceList(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(24),
      itemCount: notifier.listAttendance.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = notifier.listAttendance[index];
        return _buildPresenceItem(context, item);
      },
    );
  }

  Widget _buildPresenceItem(BuildContext context, AttendanceEntity item) {
    final theme = Theme.of(context);
    final moneyColor = (item.lunchMoney ?? 0) == 0 ? Colors.red : Colors.green;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Date Box
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  DateTimeHelper.formatDateTimeFromString(
                      dateTimeString: item.date ?? "", format: 'dd\nMMM'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                    fontSize: 12,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Time Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildTimeColumn("Masuk", item.startTime, Colors.black),
                        _buildTimeColumn("Keluar", item.endTime, Colors.black),
                        Icon(
                          (item.isLate ?? false)
                              ? Icons.warning_amber_rounded
                              : Icons.check_circle_rounded,
                          color: (item.isLate ?? false)
                              ? Colors.orange
                              : Colors.green,
                          size: 20,
                        )
                      ],
                    ),
                    const Divider(height: 20),
                    // LUNCH MONEY INFO
                    Row(
                      children: [
                        Icon(Icons.fastfood_rounded,
                            size: 14, color: moneyColor),
                        const SizedBox(width: 6),
                        Text(
                          "Uang Makan: ",
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade600),
                        ),
                        Text(
                          item.lunchMoneyLabel ?? "Rp 0",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: moneyColor),
                        ),
                        const Spacer(),
                        if (item.isLate ?? false)
                          const Text(
                            "Terlambat",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeColumn(String label, String time, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        Text(
          time,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: time == "--:--" ? Colors.grey : color,
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history_rounded, size: 80, color: Colors.grey.shade200),
          const SizedBox(height: 16),
          const Text(
            "Tidak ada riwayat presensi",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  @override
  void checkVariableAfterUi(BuildContext context) {}
  @override
  void checkVariableBeforeUi(BuildContext context) {}
}

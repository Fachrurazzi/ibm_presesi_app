import 'package:flutter/material.dart';
import 'package:flutter/src/material/app_bar.dart';
import 'package:flutter/src/widgets/framework.dart';
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
      title: const Text('Detail Presensi',
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
          // --- FILTER SECTION ---
          _buildFilterCard(context),

          const SizedBox(height: 16),

          // --- DATA SECTION ---
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
          padding: const EdgeInsets.all(12.0), // Padding sedikit diperkecil
          child: Row(
            children: [
              // Dropdown Bulan (Diberi flex lebih besar)
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

              // Dropdown Tahun
              Expanded(
                flex: 2, // Flex lebih kecil untuk tahun karena angkanya sedikit
                child: _buildDropdown(
                  label: "Tahun",
                  controller: notifier.yearController,
                  entries: notifier.yearListDropdown,
                  initial: 2026,
                ),
              ),
              const SizedBox(width: 8),

              // Tombol Cari
              IconButton.filled(
                onPressed: () => notifier.search(),
                icon: const Icon(Icons.search_rounded, size: 20),
                style: IconButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  minimumSize:
                      const Size(48, 48), // Ukuran tombol dibuat kotak presisi
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
      // KUNCI PERBAIKAN: expandedInsets: EdgeInsets.zero
      // akan membuat Dropdown memenuhi lebar Expanded tanpa terpotong
      expandedInsets: EdgeInsets.zero,
      label: Text(label, style: const TextStyle(fontSize: 12)),
      dropdownMenuEntries: entries,
      initialSelection: initial,
      controller: controller,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey.shade50,
        isDense: true, // Membuat input lebih ringkas
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade100),
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

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          // Date Box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withOpacity(0.4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              DateTimeHelper.formatDateTimeFromString(
                  dateTimeString: item.date!, format: 'dd\nMMM'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                height: 1.1,
                fontSize: 12,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(width: 20),
          // Time Info
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTimeColumn("Masuk", item.startTime, Colors.green),
                _buildTimeColumn("Keluar", item.endTime, Colors.orange),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildTimeColumn(String label, String time, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
        Text(
          time,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: time == "--:--" ? Colors.grey : Colors.black87,
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
            "Belum ada data kehadiran",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          const Text(
            "Silahkan pilih bulan & tahun lalu cari",
            style: TextStyle(color: Colors.grey, fontSize: 12),
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

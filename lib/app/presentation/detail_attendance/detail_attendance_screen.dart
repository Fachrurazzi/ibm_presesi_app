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
      body: Center(
        // KUNCI RESPONSIVE: Batasi lebar maksimal halaman agar rapi di Tablet
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
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
                          ? _buildEmptyState(
                              context) // Kirim context untuk Theme
                          : _buildAttendanceList(prov),
                ),
              ),
            ],
          ),
        ),
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
          // DROPDOWN TAHUN (Flex 2)
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
    return ListView.builder(
      padding: const EdgeInsets.all(24),
      physics: const BouncingScrollPhysics(),
      itemCount: prov.listAttendance.length,
      itemBuilder: (context, index) =>
          _buildPresenceItem(context, prov, prov.listAttendance[index]),
    );
  }

  Widget _buildPresenceItem(BuildContext context, DetailAttendanceNotifier prov,
      AttendanceEntity item) {
    final theme = Theme.of(context);
    final isLate = item.isLate ?? false;

    // Asumsikan prov.isWfa sudah dibuat di Notifier.
    // Jika namanya beda, ganti variabel ini.
    bool isDinasLuar = prov.isWfa ?? false;

    // KUNCI LOGIKA BARU: Dapat catering JIKA di Pusat DAN BUKAN dinas luar
    bool isDapatCatering = prov.isPusat && !isDinasLuar;

    String infoMakan = "";
    Color statusColor = Colors.green;

    if (isDapatCatering) {
      infoMakan = isLate ? "Rantangan Hangus (Telat)" : "Fasilitas Rantangan";
      statusColor = isLate ? Colors.red : Colors.blue;
    } else {
      infoMakan = item.lunchMoneyLabel ?? "Rp 0";
      statusColor = (item.lunchMoney ?? 0) == 0 ? Colors.red : Colors.green;
    }

    // DESAIN CARD SAMA DENGAN HOME SCREEN
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 5),
          )
        ],
        border: Border.all(color: Colors.grey.shade100, width: 1),
      ),
      child: Row(
        children: [
          // BOX TANGGAL
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade100),
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
          const SizedBox(width: 16),
          // INFO DETAIL
          // Di dalam _buildPresenceItem
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${item.startTime ?? '--:--'} - ${item.endTime ?? '--:--'}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 15),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  infoMakan, // Sudah otomatis menyesuaikan Pusat/Cabang/WFA
                  style: TextStyle(
                      fontSize: 11,
                      color: statusColor,
                      fontWeight: FontWeight.bold),
                  maxLines: 2, // Izinkan turun baris jika kepanjangan
                ),
              ],
            ),
          ),
          // ICON STATUS
          Column(
            children: [
              Icon(isLate ? Icons.warning_rounded : Icons.verified_rounded,
                  color: isLate ? Colors.orange : Colors.green, size: 26),
              if (isLate)
                const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text("Terlambat",
                      style: TextStyle(
                          fontSize: 9,
                          color: Colors.orange,
                          fontWeight: FontWeight.w900)),
                )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.event_busy_rounded,
                size: 64,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
          ),
          const SizedBox(height: 20),
          const Text("Tidak Ada Riwayat",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  color: Colors.black87)),
          const SizedBox(height: 8),
          const Text(
              "Belum ada data presensi untuk\nbulan dan tahun yang dipilih.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.5)),
        ],
      ),
    );
  }

  @override
  void checkVariableAfterUi(BuildContext context) {}
  @override
  void checkVariableBeforeUi(BuildContext context) {}
}

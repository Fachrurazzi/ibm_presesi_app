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
      title: const Text('Detail Presensi'),
    );
  }

  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // --- 1. Bagian Filter (Card Style) ---
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .surfaceContainerHighest
                    .withOpacity(0.3),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownMenu<int>(
                      expandedInsets: EdgeInsets.zero,
                      label: const Text('Bulan'),
                      dropdownMenuEntries: notifier.monthListDropdown,
                      initialSelection:
                          DateTime.now().month, // Auto pilih bulan saat ini
                      controller: notifier.monthController,
                      inputDecorationTheme: InputDecorationTheme(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownMenu<int>(
                      expandedInsets: EdgeInsets.zero,
                      label: const Text('Tahun'),
                      dropdownMenuEntries: notifier.yearListDropdown,
                      initialSelection: 2026,
                      controller: notifier.yearController,
                      inputDecorationTheme: InputDecorationTheme(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () => _onPressSearch(),
                    child: const Icon(Icons.search),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- 2. Header Tabel ---
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Center(
                          child: Text('Tanggal',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontWeight: FontWeight.bold)))),
                  Expanded(
                      flex: 2,
                      child: Center(
                          child: Text('Masuk',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontWeight: FontWeight.bold)))),
                  Expanded(
                      flex: 2,
                      child: Center(
                          child: Text('Keluar',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontWeight: FontWeight.bold)))),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // --- 3. List Kehadiran ---
            if (notifier.listAttendance.isEmpty)
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text("Tidak ada data kehadiran di bulan ini.",
                    style: TextStyle(color: Colors.grey)),
              )
            else
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: notifier.listAttendance.length,
                itemBuilder: (context, index) {
                  final item = notifier.listAttendance[index];
                  return _itemThisMonth(context, item);
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _itemThisMonth(BuildContext context, AttendanceEntity item) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Text(
                  DateTimeHelper.formatDateTimeFromString(
                      dateTimeString: item.date!, format: 'dd\nMMM'),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  item.startTime,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  item.endTime,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onPressSearch() {
    notifier.search();
  }
}

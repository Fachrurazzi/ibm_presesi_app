import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/schedule.dart';
import 'package:ibm_presensi_app/app/presentation/admin/schedule_management/schedule_management_notifier.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ScheduleManagementScreen
    extends AppWidget<ScheduleManagementNotifier, void, void> {
  ScheduleManagementScreen({super.key}) : super(param1: null, param2: null);

  @override
  Widget bodyBuild(BuildContext context) {
    final prov = context.watch<ScheduleManagementNotifier>();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
          title: const Text("Kelola Schedule",
              style: TextStyle(fontWeight: FontWeight.w900)),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white),
      body: RefreshIndicator(
          onRefresh: prov.refresh,
          child: prov.schedules.isEmpty && !prov.isLoadingMore
              ? _buildEmptyState()
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount:
                      prov.schedules.length + (prov.isLoadingMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == prov.schedules.length) {
                      prov.loadMore();
                      return const Center(
                          child: Padding(
                              padding: EdgeInsets.all(16),
                              child: CircularProgressIndicator()));
                    }
                    return _buildScheduleCard(prov.schedules[index], theme);
                  })),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddDialog(context, prov),
          child: const Icon(Icons.add_rounded)),
    );
  }

  Widget _buildScheduleCard(ScheduleEntity schedule, ThemeData theme) {
    return Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: schedule.isBanned
                        ? Colors.red.withOpacity(0.1)
                        : theme.colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(Icons.calendar_month_rounded,
                    color: schedule.isBanned
                        ? Colors.red
                        : theme.colorScheme.primary)),
            const SizedBox(width: 12),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(schedule.userDisplay,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 14)),
                  Text(schedule.officeDisplay,
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade600))
                ])),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    color: schedule.isBanned
                        ? Colors.red.withOpacity(0.1)
                        : (schedule.isActiveNow
                            ? Colors.green.withOpacity(0.1)
                            : Colors.grey.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(8)),
                child: Text(schedule.statusDisplay,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: schedule.isBanned
                            ? Colors.red
                            : (schedule.isActiveNow
                                ? Colors.green
                                : Colors.grey))))
          ]),
          const SizedBox(height: 12),
          Row(children: [
            const Icon(Icons.schedule_rounded, size: 14, color: Colors.grey),
            const SizedBox(width: 8),
            Text(schedule.shiftDisplay,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600))
          ]),
          const SizedBox(height: 4),
          Row(children: [
            const Icon(Icons.date_range_rounded, size: 14, color: Colors.grey),
            const SizedBox(width: 8),
            Text(schedule.dateRangeDisplay,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600))
          ])
        ]));
  }

  Widget _buildEmptyState() => Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.calendar_month_outlined,
            size: 80, color: Colors.grey.shade300),
        const SizedBox(height: 16),
        const Text("Belum Ada Schedule",
            style:
                TextStyle(fontWeight: FontWeight.w900, color: Colors.blueGrey))
      ]));

  void _showAddDialog(BuildContext context, ScheduleManagementNotifier prov) =>
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                  title: const Text("Tambah Schedule"),
                  content: const Text("Form tambah schedule"),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Batal")),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Simpan"))
                  ]));

  @override
  void checkVariableAfterUi(BuildContext context) {
    if (notifier.hasError) {
      final msg = notifier.errorMessage;
      notifier.clearError();
      GlobalHelper.showErrorNotification(
          context: context, title: "Gagal", message: msg);
    }
  }

  @override
  void checkVariableBeforeUi(BuildContext context) {}
  @override
  AppBar? appBarBuild(BuildContext context) => null;
}

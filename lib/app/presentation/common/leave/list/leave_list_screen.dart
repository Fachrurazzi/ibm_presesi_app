
import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/app/presentation/common/leave/create/leave_create_screen.dart';
import 'package:ibm_presensi_app/app/presentation/common/leave/detail/leave_detail_screen.dart';
import 'package:ibm_presensi_app/app/presentation/common/leave/list/leave_list_notifier.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';

class LeaveListScreen extends AppWidget<LeaveListNotifier, void, void> {
  LeaveListScreen({super.key}) : super(param1: null, param2: null);

  @override
  Widget bodyBuild(BuildContext context) {
    final prov = context.watch<LeaveListNotifier>();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text("Pengajuan Cuti",
            style: TextStyle(fontWeight: FontWeight.w900)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => Navigator.pop(context)),
      ),
      body: Column(
        children: [
          _buildQuotaHeader(prov, theme),
          _buildFilterTabs(prov, theme),
          Expanded(
            child: RefreshIndicator(
              onRefresh: prov.refresh,
              child: prov.listLeave.isEmpty && !prov.isLoadingMore
                  ? _buildEmptyState()
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount:
                          prov.listLeave.length + (prov.isLoadingMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == prov.listLeave.length) {
                          prov.loadMore();
                          return const Center(
                              child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: CircularProgressIndicator()));
                        }
                        return _buildLeaveCard(
                            context, prov.listLeave[index], prov, theme);
                      },
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToCreate(context),
        child: const Icon(Icons.add_rounded),
      ),
    );
  }

  Widget _buildQuotaHeader(LeaveListNotifier prov, ThemeData theme) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          theme.colorScheme.primary,
          theme.colorScheme.primary.withBlue(220)
        ]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12)),
              child:
                  const Icon(Icons.beach_access_rounded, color: Colors.white)),
          const SizedBox(width: 16),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text("Sisa Kuota Cuti",
                style: TextStyle(color: Colors.white70, fontSize: 12)),
            Text("${prov.remainingLeave} / ${prov.leaveQuota} Hari",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900)),
          ]),
        ],
      ),
    );
  }

  Widget _buildFilterTabs(LeaveListNotifier prov, ThemeData theme) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(scrollDirection: Axis.horizontal, children: [
        _buildFilterChip("Semua", "all", prov, theme),
        _buildFilterChip("Pending", "PENDING", prov, theme),
        _buildFilterChip("Disetujui", "APPROVED", prov, theme),
        _buildFilterChip("Ditolak", "REJECTED", prov, theme),
      ]),
    );
  }

  Widget _buildFilterChip(
      String label, String value, LeaveListNotifier prov, ThemeData theme) {
    final isSelected = prov.selectedStatus == value;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (_) => prov.filterByStatus(value),
        backgroundColor: Colors.white,
        selectedColor: theme.colorScheme.primary.withOpacity(0.2),
        checkmarkColor: theme.colorScheme.primary,
      ),
    );
  }

  Widget _buildLeaveCard(BuildContext context, LeaveEntity item,
      LeaveListNotifier prov, ThemeData theme) {
    return GestureDetector(
      onTap: () => _navigateToDetail(context, item.id),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade100)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(item.reason,
                        style: const TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis)),
                _buildStatusBadge(item.status),
              ],
            ),
            const SizedBox(height: 8),
            Text("${item.startDate} - ${item.endDate} • ${item.duration} hari",
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
            if (item.isPending)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  TextButton(
                      onPressed: () =>
                          _showCancelDialog(context, item.id, prov),
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      child: const Text("Batalkan")),
                ]),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    final statusUpper = status.toUpperCase();
    Color color = statusUpper == 'APPROVED'
        ? Colors.green
        : (statusUpper == 'REJECTED' ? Colors.red : Colors.orange);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8)),
        child: Text(statusUpper,
            style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.bold, color: color)));
  }

  Widget _buildEmptyState() {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(Icons.beach_access_rounded, size: 80, color: Colors.grey.shade300),
      const SizedBox(height: 16),
      const Text("Belum Ada Pengajuan",
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.blueGrey))
    ]));
  }

  void _navigateToCreate(BuildContext context) => Navigator.push(
          context, MaterialPageRoute(builder: (_) => LeaveCreateScreen()))
      .then((_) => context.read<LeaveListNotifier>().refresh());
  void _navigateToDetail(BuildContext context, int id) => Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => LeaveDetailScreen(leaveId: id)));

  void _showCancelDialog(BuildContext context, int id, LeaveListNotifier prov) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Batalkan Cuti"),
        content: const Text(
            "Apakah Anda yakin ingin membatalkan pengajuan cuti ini?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Tidak")),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              final success = await prov.cancelLeave(id);
              if (context.mounted && success) {
                GlobalHelper.showSuccessNotification(
                    context: context,
                    title: "Berhasil",
                    message: "Pengajuan cuti dibatalkan");
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text("Ya, Batalkan"),
          ),
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
          context: context, title: "Gagal", message: msg);
    }
  }

  @override
  void checkVariableBeforeUi(BuildContext context) {}

  @override
  AppBar? appBarBuild(BuildContext context) => null;
}

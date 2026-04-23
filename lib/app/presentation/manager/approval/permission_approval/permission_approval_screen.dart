import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibm_presensi_app/app/module/entity/permission.dart';
import 'package:ibm_presensi_app/app/presentation/manager/approval/permission_approval/permission_approval_notifier.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';

class PermissionApprovalScreen
    extends AppWidget<PermissionApprovalNotifier, void, void> {
  PermissionApprovalScreen({super.key}) : super(param1: null, param2: null);

  @override
  Widget bodyBuild(BuildContext context) {
    final prov = context.watch<PermissionApprovalNotifier>();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
          title: const Text("Approval Izin",
              style: TextStyle(fontWeight: FontWeight.w900)),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white),
      body: Column(
        children: [
          _buildFilterTabs(prov, theme),
          Expanded(
            child: RefreshIndicator(
              onRefresh: prov.refresh,
              child: prov.listPermission.isEmpty && !prov.isLoadingMore
                  ? _buildEmptyState()
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: prov.listPermission.length +
                          (prov.isLoadingMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == prov.listPermission.length) {
                          prov.loadMore();
                          return const Center(
                              child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: CircularProgressIndicator()));
                        }
                        return _buildApprovalCard(
                            context, prov.listPermission[index], prov, theme);
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTabs(PermissionApprovalNotifier prov, ThemeData theme) {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(16),
      child: Row(children: [
        Expanded(child: _buildFilterChip("Pending", "PENDING", prov, theme)),
        const SizedBox(width: 8),
        Expanded(child: _buildFilterChip("Disetujui", "APPROVED", prov, theme)),
        const SizedBox(width: 8),
        Expanded(child: _buildFilterChip("Ditolak", "REJECTED", prov, theme)),
      ]),
    );
  }

  Widget _buildFilterChip(String label, String value,
      PermissionApprovalNotifier prov, ThemeData theme) {
    final isSelected = prov.selectedStatus == value;
    return FilterChip(
        label: Text(label, style: const TextStyle(fontSize: 12)),
        selected: isSelected,
        onSelected: (_) => prov.filterByStatus(value),
        backgroundColor: Colors.white,
        selectedColor: theme.colorScheme.primary.withOpacity(0.2),
        checkmarkColor: theme.colorScheme.primary);
  }

  Widget _buildApprovalCard(BuildContext context, PermissionEntity item,
      PermissionApprovalNotifier prov, ThemeData theme) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade100)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: item.statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(item.typeIcon, color: item.statusColor)),
          const SizedBox(width: 12),
          Expanded(
              child: Text(item.typeDisplay,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 14))),
          _buildStatusBadge(item.status)
        ]),
        const SizedBox(height: 8),
        Text(item.date,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
        const SizedBox(height: 8),
        Text(item.reason, style: const TextStyle(fontSize: 13), maxLines: 3),
        if (item.isPending) ...[
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(
                child: OutlinedButton(
                    onPressed: () => _showRejectDialog(context, item.id, prov),
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Text("TOLAK"))),
            const SizedBox(width: 12),
            Expanded(
                child: ElevatedButton(
                    onPressed: () => _onApprove(context, item.id, prov),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Text("SETUJUI")))
          ]),
        ],
      ]),
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

  Widget _buildEmptyState() => Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.check_circle_outline_rounded,
            size: 80, color: Colors.grey.shade300),
        const SizedBox(height: 16),
        const Text("Tidak Ada Pengajuan",
            style:
                TextStyle(fontWeight: FontWeight.w900, color: Colors.blueGrey))
      ]));

  void _onApprove(
      BuildContext context, int id, PermissionApprovalNotifier prov) async {
    final success = await prov.approve(id);
    if (context.mounted && success) {
      GlobalHelper.showSuccessNotification(
          context: context,
          title: "Berhasil",
          message: "Pengajuan izin disetujui");
    }
  }

  void _showRejectDialog(
      BuildContext context, int id, PermissionApprovalNotifier prov) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: const Text("Tolak Pengajuan"),
                content: const Text(
                    "Apakah Anda yakin ingin menolak pengajuan izin ini?"),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Batal")),
                  TextButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        final success = await prov.reject(id);
                        if (context.mounted && success) {
                          GlobalHelper.showSuccessNotification(
                              context: context,
                              title: "Berhasil",
                              message: "Pengajuan izin ditolak");
                        }
                      },
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      child: const Text("Tolak"))
                ]));
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

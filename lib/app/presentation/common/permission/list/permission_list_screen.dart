import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibm_presensi_app/app/module/entity/permission.dart';
import 'package:ibm_presensi_app/app/presentation/common/permission/list/permission_list_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/common/permission/create/permission_create_screen.dart';
import 'package:ibm_presensi_app/app/presentation/common/permission/detail/permission_detail_screen.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class PermissionListScreen
    extends AppWidget<PermissionListNotifier, void, void> {
  PermissionListScreen({super.key}) : super(param1: null, param2: null);

  @override
  Widget bodyBuild(BuildContext context) {
    final prov = context.watch<PermissionListNotifier>();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text("Pengajuan Izin",
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
                        return _buildPermissionCard(
                            context, prov.listPermission[index], prov, theme);
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

  Widget _buildFilterTabs(PermissionListNotifier prov, ThemeData theme) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListView(scrollDirection: Axis.horizontal, children: [
        _buildFilterChip("Semua", "all", prov, theme),
        _buildFilterChip("Pending", "PENDING", prov, theme),
        _buildFilterChip("Disetujui", "APPROVED", prov, theme),
        _buildFilterChip("Ditolak", "REJECTED", prov, theme),
      ]),
    );
  }

  Widget _buildFilterChip(String label, String value,
      PermissionListNotifier prov, ThemeData theme) {
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

  Widget _buildPermissionCard(BuildContext context, PermissionEntity item,
      PermissionListNotifier prov, ThemeData theme) {
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
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: item.statusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)),
                    child:
                        Icon(item.typeIcon, color: item.statusColor, size: 18)),
                const SizedBox(width: 12),
                Expanded(
                    child: Text(item.typeDisplay,
                        style: const TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 14))),
                _buildStatusBadge(item.status),
              ],
            ),
            const SizedBox(height: 8),
            Text(item.date,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
            const SizedBox(height: 8),
            Text(item.reason,
                style: const TextStyle(fontSize: 13),
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
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
      Icon(Icons.note_alt_rounded, size: 80, color: Colors.grey.shade300),
      const SizedBox(height: 16),
      const Text("Belum Ada Pengajuan",
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.blueGrey))
    ]));
  }

  void _navigateToCreate(BuildContext context) => Navigator.push(
          context, MaterialPageRoute(builder: (_) => PermissionCreateScreen()))
      .then((_) => context.read<PermissionListNotifier>().refresh());
  void _navigateToDetail(BuildContext context, int id) => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => PermissionDetailScreen(permissionId: id)));

  void _showCancelDialog(
      BuildContext context, int id, PermissionListNotifier prov) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Batalkan Izin"),
        content: const Text(
            "Apakah Anda yakin ingin membatalkan pengajuan izin ini?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Tidak")),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              final success = await prov.cancelPermission(id);
              if (context.mounted && success) {
                GlobalHelper.showSuccessNotification(
                    context: context,
                    title: "Berhasil",
                    message: "Pengajuan izin dibatalkan");
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

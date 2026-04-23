import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/position.dart';
import 'package:ibm_presensi_app/app/presentation/admin/position_management/position_management_notifier.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class PositionManagementScreen
    extends AppWidget<PositionManagementNotifier, void, void> {
  PositionManagementScreen({super.key}) : super(param1: null, param2: null);

  @override
  Widget bodyBuild(BuildContext context) {
    final prov = context.watch<PositionManagementNotifier>();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
          title: const Text("Kelola Jabatan",
              style: TextStyle(fontWeight: FontWeight.w900)),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white),
      body: RefreshIndicator(
          onRefresh: prov.refresh,
          child: prov.isLoading
              ? _buildShimmerList()
              : prov.positions.isEmpty
                  ? _buildEmptyState()
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: prov.positions.length,
                      itemBuilder: (context, index) => _buildPositionCard(
                          context, prov.positions[index], prov, theme))),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddDialog(context, prov),
          child: const Icon(Icons.add_rounded)),
    );
  }

  Widget _buildPositionCard(BuildContext context, PositionEntity position,
      PositionManagementNotifier prov, ThemeData theme) {
    return Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(children: [
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12)),
              child:
                  Icon(Icons.badge_rounded, color: theme.colorScheme.primary)),
          const SizedBox(width: 16),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(position.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 16)),
                const SizedBox(height: 4),
                Text("${position.userCount} karyawan",
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600))
              ])),
          Row(mainAxisSize: MainAxisSize.min, children: [
            IconButton(
                icon: const Icon(Icons.edit_rounded, color: Colors.blue),
                onPressed: () => _showEditDialog(context, position, prov)),
            IconButton(
                icon: const Icon(Icons.delete_rounded, color: Colors.red),
                onPressed: () => _showDeleteDialog(context, position, prov))
          ])
        ]));
  }

  Widget _buildShimmerList() => ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (_, __) => Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)))));
  Widget _buildEmptyState() => Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.badge_outlined, size: 80, color: Colors.grey.shade300),
        const SizedBox(height: 16),
        const Text("Belum Ada Jabatan",
            style:
                TextStyle(fontWeight: FontWeight.w900, color: Colors.blueGrey))
      ]));

  void _showAddDialog(BuildContext context, PositionManagementNotifier prov) {
    final nameController = TextEditingController();
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: const Text("Tambah Jabatan"),
                content: TextField(
                    controller: nameController,
                    decoration:
                        const InputDecoration(labelText: "Nama Jabatan")),
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
  }

  void _showEditDialog(BuildContext context, PositionEntity position,
          PositionManagementNotifier prov) =>
      _showAddDialog(context, prov);
  void _showDeleteDialog(BuildContext context, PositionEntity position,
      PositionManagementNotifier prov) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: const Text("Hapus Jabatan"),
                content: Text("Hapus ${position.name}?"),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Batal")),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      child: const Text("Hapus"))
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

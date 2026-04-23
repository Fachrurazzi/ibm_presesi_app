import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/office.dart';
import 'package:ibm_presensi_app/app/presentation/admin/office_management/office_management_notifier.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class OfficeManagementScreen
    extends AppWidget<OfficeManagementNotifier, void, void> {
  OfficeManagementScreen({super.key}) : super(param1: null, param2: null);

  @override
  Widget bodyBuild(BuildContext context) {
    final prov = context.watch<OfficeManagementNotifier>();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
          title: const Text("Kelola Office",
              style: TextStyle(fontWeight: FontWeight.w900)),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white),
      body: RefreshIndicator(
          onRefresh: prov.refresh,
          child: prov.isLoading
              ? _buildShimmerList()
              : prov.offices.isEmpty
                  ? _buildEmptyState()
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: prov.offices.length,
                      itemBuilder: (context, index) => _buildOfficeCard(
                          context, prov.offices[index], prov, theme))),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddDialog(context, prov),
          child: const Icon(Icons.add_rounded)),
    );
  }

  Widget _buildOfficeCard(BuildContext context, OfficeEntity office,
      OfficeManagementNotifier prov, ThemeData theme) {
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
                    color: theme.colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(Icons.business_rounded,
                    color: theme.colorScheme.primary)),
            const SizedBox(width: 12),
            Expanded(
                child: Text(office.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 16))),
            Row(mainAxisSize: MainAxisSize.min, children: [
              IconButton(
                  icon: const Icon(Icons.edit_rounded, color: Colors.blue),
                  onPressed: () => _showEditDialog(context, office, prov)),
              IconButton(
                  icon: const Icon(Icons.delete_rounded, color: Colors.red),
                  onPressed: () => _showDeleteDialog(context, office, prov))
            ])
          ]),
          const SizedBox(height: 12),
          Row(children: [
            const Icon(Icons.location_on_rounded, size: 14, color: Colors.grey),
            const SizedBox(width: 8),
            Text(office.coordinateDisplay,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600))
          ]),
          const SizedBox(height: 4),
          Row(children: [
            const Icon(Icons.radar_rounded, size: 14, color: Colors.grey),
            const SizedBox(width: 8),
            Text("Radius: ${office.radiusDisplayText}",
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600))
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
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)))));
  Widget _buildEmptyState() => Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.business_outlined, size: 80, color: Colors.grey.shade300),
        const SizedBox(height: 16),
        const Text("Belum Ada Office",
            style:
                TextStyle(fontWeight: FontWeight.w900, color: Colors.blueGrey))
      ]));

  void _showAddDialog(BuildContext context, OfficeManagementNotifier prov) {
    final nameController = TextEditingController();
    final latController = TextEditingController();
    final lngController = TextEditingController();
    final radiusController = TextEditingController();
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: const Text("Tambah Office"),
                content: Column(mainAxisSize: MainAxisSize.min, children: [
                  TextField(
                      controller: nameController,
                      decoration:
                          const InputDecoration(labelText: "Nama Office")),
                  const SizedBox(height: 12),
                  TextField(
                      controller: latController,
                      decoration: const InputDecoration(labelText: "Latitude"),
                      keyboardType: TextInputType.number),
                  const SizedBox(height: 12),
                  TextField(
                      controller: lngController,
                      decoration: const InputDecoration(labelText: "Longitude"),
                      keyboardType: TextInputType.number),
                  const SizedBox(height: 12),
                  TextField(
                      controller: radiusController,
                      decoration:
                          const InputDecoration(labelText: "Radius (meter)"),
                      keyboardType: TextInputType.number)
                ]),
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

  void _showEditDialog(BuildContext context, OfficeEntity office,
          OfficeManagementNotifier prov) =>
      _showAddDialog(context, prov);
  void _showDeleteDialog(BuildContext context, OfficeEntity office,
      OfficeManagementNotifier prov) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: const Text("Hapus Office"),
                content: Text("Hapus ${office.name}?"),
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

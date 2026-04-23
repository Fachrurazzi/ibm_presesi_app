import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/shift.dart';
import 'package:ibm_presensi_app/app/presentation/admin/shift_management/shift_management_notifier.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ShiftManagementScreen
    extends AppWidget<ShiftManagementNotifier, void, void> {
  ShiftManagementScreen({super.key}) : super(param1: null, param2: null);

  @override
  Widget bodyBuild(BuildContext context) {
    final prov = context.watch<ShiftManagementNotifier>();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text("Kelola Shift",
            style: TextStyle(fontWeight: FontWeight.w900)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: prov.refresh,
        child: prov.isLoading
            ? _buildShimmerList()
            : prov.shifts.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: prov.shifts.length,
                    itemBuilder: (context, index) => _buildShiftCard(
                        context, prov.shifts[index], prov, theme),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(context, prov),
        child: const Icon(Icons.add_rounded),
      ),
    );
  }

  Widget _buildShiftCard(
      BuildContext context,
      ShiftEntity shift,
      ShiftManagementNotifier prov, // 👈 Parameter prov
      ThemeData theme) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: shift.isOvernight
                  ? Colors.indigo.withOpacity(0.1)
                  : theme.colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.schedule_rounded,
              color:
                  shift.isOvernight ? Colors.indigo : theme.colorScheme.primary,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        shift.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 16),
                      ),
                    ),
                    if (shift.isOvernight)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.indigo.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          "MALAM",
                          style: TextStyle(
                            fontSize: 9,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  shift.timeDisplay,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 2),
                Text(
                  shift.durationDisplay,
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit_rounded, color: Colors.blue),
                onPressed: () => _showEditDialog(context, shift, prov),
              ),
              IconButton(
                icon: const Icon(Icons.delete_rounded, color: Colors.red),
                onPressed: () => _showDeleteDialog(context, shift, prov),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerList() {
    return ListView.builder(
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
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.schedule_outlined, size: 80, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          const Text(
            "Belum Ada Shift",
            style:
                TextStyle(fontWeight: FontWeight.w900, color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }

  void _showAddDialog(BuildContext context, ShiftManagementNotifier prov) {
    final nameController = TextEditingController();
    final startController = TextEditingController(text: "08:30");
    final endController = TextEditingController(text: "17:30");

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Tambah Shift"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Nama Shift"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: startController,
              decoration: const InputDecoration(labelText: "Jam Mulai (HH:mm)"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: endController,
              decoration:
                  const InputDecoration(labelText: "Jam Selesai (HH:mm)"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: Implement create shift
            },
            child: const Text("Simpan"),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(
      BuildContext context, ShiftEntity shift, ShiftManagementNotifier prov) {
    // TODO: Implement edit with pre-filled values
    _showAddDialog(context, prov);
  }

  void _showDeleteDialog(
      BuildContext context, ShiftEntity shift, ShiftManagementNotifier prov) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Hapus Shift"),
        content: Text("Hapus ${shift.name}?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: Implement delete shift
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text("Hapus"),
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
        context: context,
        title: "Gagal",
        message: msg,
      );
    }
  }

  @override
  void checkVariableBeforeUi(BuildContext context) {}

  @override
  AppBar? appBarBuild(BuildContext context) => null;
}

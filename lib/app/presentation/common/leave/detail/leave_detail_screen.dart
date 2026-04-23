import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/app/module/use_case/leave_get_detail_use_case.dart';
import 'package:ibm_presensi_app/app/presentation/common/leave/detail/leave_detail_notifier.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';

class LeaveDetailScreen extends StatelessWidget {
  final int leaveId;
  const LeaveDetailScreen({super.key, required this.leaveId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) =>
            LeaveDetailNotifier(sl<LeaveGetDetailUseCase>(), leaveId),
        child: _LeaveDetailView());
  }
}

class _LeaveDetailView extends AppWidget<LeaveDetailNotifier, void, void> {
  _LeaveDetailView() : super(param1: null, param2: null);

  @override
  Widget bodyBuild(BuildContext context) {
    final prov = context.watch<LeaveDetailNotifier>();
    final theme = Theme.of(context);
    final leave = prov.leave;

    if (prov.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (leave == null) {
      return const Scaffold(body: Center(child: Text("Data tidak ditemukan")));
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
          title: const Text("Detail Cuti",
              style: TextStyle(fontWeight: FontWeight.w900)),
          centerTitle: true,
          backgroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildStatusCard(leave, theme),
          const SizedBox(height: 24),
          _buildInfoCard(leave, theme),
          const SizedBox(height: 24),
          _buildReasonCard(leave, theme),
        ]),
      ),
    );
  }

  Widget _buildStatusCard(LeaveEntity leave, ThemeData theme) {
    Color statusColor = leave.isApproved
        ? Colors.green
        : (leave.isRejected ? Colors.red : Colors.orange);
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: statusColor, borderRadius: BorderRadius.circular(24)),
        child: Row(children: [
          Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
              child: Icon(leave.statusIcon, color: Colors.white, size: 32)),
          const SizedBox(width: 16),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(leave.statusDisplay,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900)),
                Text("Durasi: ${leave.duration} hari",
                    style: const TextStyle(color: Colors.white70))
              ]))
        ]));
  }

  Widget _buildInfoCard(LeaveEntity leave, ThemeData theme) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(24)),
        child: Column(children: [
          _buildInfoRow(
              Icons.calendar_today_rounded, "Tanggal Mulai", leave.startDate),
          const Divider(height: 24),
          _buildInfoRow(
              Icons.event_available_rounded, "Tanggal Selesai", leave.endDate),
          const Divider(height: 24),
          _buildInfoRow(
              Icons.category_rounded, "Kategori", leave.categoryDisplay),
          const Divider(height: 24),
          _buildInfoRow(Icons.info_rounded, "Status", leave.statusDisplay),
          if (leave.note != null) ...[
            const Divider(height: 24),
            _buildInfoRow(Icons.note_rounded, "Catatan Admin", leave.note!)
          ]
        ]));
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(children: [
      Icon(icon, size: 20, color: Colors.grey),
      const SizedBox(width: 16),
      Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      const Spacer(),
      Text(value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14))
    ]);
  }

  Widget _buildReasonCard(LeaveEntity leave, ThemeData theme) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(24)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Alasan",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
          const SizedBox(height: 12),
          Text(leave.reason, style: const TextStyle(fontSize: 14, height: 1.5))
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

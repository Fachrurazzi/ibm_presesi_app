import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibm_presensi_app/app/presentation/common/leave/create/leave_create_notifier.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';

class LeaveCreateScreen extends AppWidget<LeaveCreateNotifier, void, void> {
  LeaveCreateScreen({super.key}) : super(param1: null, param2: null);

  @override
  Widget bodyBuild(BuildContext context) {
    final prov = context.watch<LeaveCreateNotifier>();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
          title: const Text("Ajukan Cuti",
              style: TextStyle(fontWeight: FontWeight.w900)),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: const Icon(Icons.close_rounded),
              onPressed: () => Navigator.pop(context))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildQuotaCard(prov, theme),
          const SizedBox(height: 24),
          _buildFormCard(context, prov, theme),
        ]),
      ),
    );
  }

  Widget _buildQuotaCard(LeaveCreateNotifier prov, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primary.withBlue(220)
          ]),
          borderRadius: BorderRadius.circular(24)),
      child: Row(children: [
        Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
            child: const Icon(Icons.beach_access_rounded, color: Colors.white)),
        const SizedBox(width: 16),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Sisa Kuota",
              style: TextStyle(color: Colors.white70, fontSize: 12)),
          Text("${prov.remainingLeave} / ${prov.leaveQuota} Hari",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w900))
        ]),
      ]),
    );
  }

  Widget _buildFormCard(
      BuildContext context, LeaveCreateNotifier prov, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(children: [
        Row(children: [
          Expanded(
              child: _buildDateField(
                  context, "Tanggal Mulai", prov.startDateController, prov)),
          const SizedBox(width: 12),
          Expanded(
              child: _buildDateField(
                  context, "Tanggal Selesai", prov.endDateController, prov)),
        ]),
        const SizedBox(height: 20),
        TextField(
            controller: prov.reasonController,
            maxLines: 4,
            decoration: InputDecoration(
                labelText: "Alasan Cuti",
                hintText: "Tuliskan alasan pengajuan cuti...",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                filled: true,
                fillColor: Colors.grey.shade50)),
        const SizedBox(height: 32),
        _buildSubmitButton(context, prov, theme),
      ]),
    );
  }

  Widget _buildDateField(BuildContext context, String label,
      TextEditingController controller, LeaveCreateNotifier prov) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey)),
      const SizedBox(height: 6),
      InkWell(
        onTap: () => prov.selectDate(context, controller),
        child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200)),
            child: Row(children: [
              const Icon(Icons.calendar_today_rounded,
                  size: 16, color: Colors.grey),
              const SizedBox(width: 10),
              Text(controller.text.isEmpty ? "Pilih tanggal" : controller.text,
                  style: TextStyle(
                      color: controller.text.isEmpty
                          ? Colors.grey
                          : Colors.black87))
            ])),
      ),
    ]);
  }

  Widget _buildSubmitButton(
      BuildContext context, LeaveCreateNotifier prov, ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: prov.isLoading ? null : () => prov.submit(),
        style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        child: prov.isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text("KIRIM PENGAJUAN",
                style: TextStyle(
                    fontWeight: FontWeight.w900, color: Colors.white)),
      ),
    );
  }

  @override
  void checkVariableAfterUi(BuildContext context) {
    if (notifier.isSuccess) {
      notifier.clearSuccess();
      GlobalHelper.showSuccessNotification(
          context: context,
          title: "Berhasil",
          message: "Pengajuan cuti telah terkirim");
      Navigator.pop(context);
    }
    if (notifier.leaveError.isNotEmpty) {
      final msg = notifier.leaveError;
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

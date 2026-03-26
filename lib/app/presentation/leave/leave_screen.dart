import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_screen.dart';
import 'package:ibm_presensi_app/app/presentation/leave/leave_notifier.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';

class LeaveScreen extends AppWidget<LeaveNotifier, void, void> {
  LeaveScreen({super.key});

  @override
  AppBar? appBarBuild(BuildContext context) {
    return AppBar(
      title: const Text("Pengajuan Cuti",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget bodyBuild(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoBox(context),
            const SizedBox(height: 32),

            // Container Form
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                    color: theme.colorScheme.outlineVariant.withOpacity(0.5)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 20,
                      offset: const Offset(0, 10))
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDateField(
                      context,
                      "Tanggal Mulai",
                      notifier.startDateController,
                      Icons.calendar_today_rounded),
                  const SizedBox(height: 20),
                  _buildDateField(
                      context,
                      "Tanggal Selesai",
                      notifier.endDateController,
                      Icons.event_available_rounded),
                  const SizedBox(height: 24),
                  const Text("Alasan Pengajuan",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.grey)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: notifier.reasonController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Berikan alasan singkat...",
                      filled: true,
                      fillColor: theme.colorScheme.surfaceContainerHighest
                          .withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 56,
              child: FilledButton.icon(
                onPressed: () => notifier.send(),
                icon: const Icon(Icons.send_rounded),
                label: const Text("Kirim Pengajuan Sekarang",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        children: [
          Icon(Icons.tips_and_updates_rounded, color: Colors.orange),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              "Status absensi akan otomatis berubah menjadi 'Cuti' jika pengajuan disetujui HRD.",
              style: TextStyle(
                  fontSize: 12, height: 1.5, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateField(BuildContext context, String label,
      TextEditingController controller, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 13, color: Colors.grey)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          readOnly: true,
          onTap: () => notifier.selectDate(context, controller),
          decoration: InputDecoration(
            hintText: "Pilih Tanggal",
            prefixIcon: Icon(icon, size: 20),
            suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.05),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
            ),
          ),
        ), // <--- Tanda ) ini yang sebelumnya hilang untuk menutup TextField
      ],
    );
  }

  @override
  void checkVariableAfterUi(BuildContext context) {
    if (notifier.isSuccess) {
      // Gunakan post frame callback agar tidak bentrok dengan proses build
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          // OPSI 1: Jika ingin balik ke Home dan refresh total (Sangat Direkomendasikan)
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false,
          );

          // OPSI 2: Jika hanya ingin back biasa seperti kodingan awal kamu
          // Navigator.pop(context);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Pengajuan cuti berhasil dikirim!"),
              backgroundColor: Colors.green,
            ),
          );
        }
      });
    }
  }

  @override
  void checkVariableBeforeUi(BuildContext context) {}
}

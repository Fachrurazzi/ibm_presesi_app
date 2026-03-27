import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_screen.dart';
import 'package:ibm_presensi_app/app/presentation/leave/leave_notifier.dart';
import 'package:ibm_presensi_app/core/helper/date_time_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';

class LeaveScreen extends AppWidget<LeaveNotifier, void, void> {
  LeaveScreen({super.key});

  @override
  AppBar? appBarBuild(BuildContext context) {
    return AppBar(
      title: const Text("Pengajuan Cuti",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      centerTitle: true,
    );
  }

  @override
  Widget bodyBuild(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: RefreshIndicator(
        onRefresh: () => notifier.getHistory(),
        child: CustomScrollView(
          slivers: [
            // BAGIAN 1: FORM PENGAJUAN
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    _buildInfoBox(context),
                    const SizedBox(height: 24),
                    _buildFormCard(context, theme),
                    const SizedBox(height: 24),
                    _buildSubmitButton(context),
                  ],
                ),
              ),
            ),

            // BAGIAN 2: HEADER RIWAYAT
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Text("Riwayat Pengajuan",
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
              ),
            ),

            // BAGIAN 3: LIST RIWAYAT DENGAN BADGE STATUS
            _buildHistoryList(context, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildFormCard(BuildContext context, ThemeData theme) {
    return Container(
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
        children: [
          _buildDateField(context, "Tanggal Mulai",
              notifier.startDateController, Icons.calendar_today_rounded),
          const SizedBox(height: 20),
          _buildDateField(context, "Tanggal Selesai",
              notifier.endDateController, Icons.event_available_rounded),
          const SizedBox(height: 20),
          _buildReasonField(context, theme),
        ],
      ),
    );
  }

  Widget _buildHistoryList(BuildContext context, ThemeData theme) {
    if (notifier.listLeave.isEmpty) {
      return const SliverToBoxAdapter(
        child: Center(
            child: Padding(
                padding: EdgeInsets.all(40),
                child: Text("Belum ada riwayat cuti"))),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final item = notifier.listLeave[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                title: Text(item.reason,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(
                  "${DateTimeHelper.formatDateTimeFromString(dateTimeString: item.startDate, format: 'dd MMM yyyy')} s/d ${DateTimeHelper.formatDateTimeFromString(dateTimeString: item.endDate, format: 'dd MMM yyyy')}",
                  style: const TextStyle(fontSize: 12),
                ),
                trailing: _buildStatusBadge(item.status),
              ),
            );
          },
          childCount: notifier.listLeave.length,
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color color;
    String text;

    switch (status.toLowerCase()) {
      case 'approved':
        color = Colors.green;
        text = 'Disetujui';
        break;
      case 'rejected':
        color = Colors.red;
        text = 'Ditolak';
        break;
      default:
        color = Colors.orange;
        text = 'Pending';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color),
      ),
      child: Text(text,
          style: TextStyle(
              color: color, fontSize: 11, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: FilledButton.icon(
        onPressed: () => notifier.send(),
        icon: const Icon(Icons.send_rounded),
        label: const Text("Kirim Pengajuan Sekarang",
            style: TextStyle(fontWeight: FontWeight.bold)),
        style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
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
              child: Text("Status akan otomatis berubah setelah disetujui HRD.",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))),
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
            filled: true,
            fillColor: Colors.grey.withOpacity(0.05),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }

  Widget _buildReasonField(BuildContext context, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Alasan Pengajuan",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 13, color: Colors.grey)),
        const SizedBox(height: 8),
        TextField(
          controller: notifier.reasonController,
          maxLines: 4,
          decoration: InputDecoration(
            hintText: "Berikan alasan singkat...",
            filled: true,
            fillColor:
                theme.colorScheme.surfaceContainerHighest.withOpacity(0.3),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }

  @override
  void checkVariableAfterUi(BuildContext context) {
    if (notifier.isSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text("Pengajuan cuti berhasil dikirim!"),
                backgroundColor: Colors.green),
          );
          notifier.init(); // Reset state sukses
        }
      });
    }
  }

  @override
  void checkVariableBeforeUi(BuildContext context) {}
}

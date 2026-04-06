import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/presentation/leave/leave_notifier.dart';
import 'package:ibm_presensi_app/core/helper/date_time_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';

class LeaveScreen extends AppWidget<LeaveNotifier, void, void> {
  LeaveScreen({super.key});

  @override
  AppBar? appBarBuild(BuildContext context) {
    return AppBar(
      title: const Text("Pengajuan Cuti",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  @override
  Widget bodyBuild(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () => notifier.getHistory(),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // BAGIAN 1: HEADER & KUOTA
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                child: _buildQuotaHeader(context, theme),
              ),
            ),

            // BAGIAN 2: FORM PENGAJUAN (CARD)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: _buildFormContainer(context, theme),
              ),
            ),

            // BAGIAN 3: JUDUL RIWAYAT
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Row(
                  children: [
                    const Icon(Icons.history_rounded,
                        size: 18, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text("Riwayat Pengajuan",
                        style: theme.textTheme.titleSmall
                            ?.copyWith(fontWeight: FontWeight.w900)),
                  ],
                ),
              ),
            ),

            // BAGIAN 4: LIST RIWAYAT
            _buildHistoryList(context, theme),
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }

  Widget _buildQuotaHeader(BuildContext context, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          theme.colorScheme.primary,
          theme.colorScheme.primary.withOpacity(0.7)
        ]),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
              color: theme.colorScheme.primary.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 8))
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
              backgroundColor: Colors.white24,
              child: Icon(Icons.beach_access_rounded, color: Colors.white)),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Sisa Kuota Cuti",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.w500)),
              Text("${notifier.leaveQuota} Hari",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w900)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildFormContainer(BuildContext context, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 20,
              offset: const Offset(0, 10))
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: _buildSmallDatePicker(context, "Mulai",
                      notifier.startDateController, Icons.calendar_today)),
              const SizedBox(width: 12),
              Expanded(
                  child: _buildSmallDatePicker(context, "Selesai",
                      notifier.endDateController, Icons.event_available)),
            ],
          ),
          const SizedBox(height: 20),
          _buildReasonInput(context, theme),
          const SizedBox(height: 24),
          _buildSubmitButton(context, theme),
        ],
      ),
    );
  }

  Widget _buildSmallDatePicker(BuildContext context, String label,
      TextEditingController controller, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 11, fontWeight: FontWeight.w800, color: Colors.grey)),
        const SizedBox(height: 8),
        InkWell(
          onTap: () => notifier.selectDate(context, controller),
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade100)),
            child: Row(
              children: [
                Icon(icon, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    controller.text.isEmpty ? "Pilih" : controller.text,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: controller.text.isEmpty
                            ? Colors.grey
                            : Colors.black87),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReasonInput(BuildContext context, ThemeData theme) {
    return TextField(
      controller: notifier.reasonController,
      maxLines: 3,
      decoration: InputDecoration(
        hintText: "Alasan cuti...",
        hintStyle: const TextStyle(fontSize: 13),
        filled: true,
        fillColor: Colors.grey.shade50,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context, ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: notifier.isLoading ? null : () => notifier.send(),
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          elevation: 0,
        ),
        child: notifier.isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                    color: Colors.white, strokeWidth: 2))
            : const Text("KIRIM PENGAJUAN",
                style:
                    TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1)),
      ),
    );
  }

  Widget _buildHistoryList(BuildContext context, ThemeData theme) {
    if (notifier.listLeave.isEmpty) {
      return const SliverToBoxAdapter(
        child: Center(
            child: Padding(
                padding: EdgeInsets.all(50),
                child: Text("Belum ada riwayat",
                    style: TextStyle(color: Colors.grey, fontSize: 13)))),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final item = notifier.listLeave[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.reason,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 4),
                        Text(
                          "${DateTimeHelper.formatDateTimeFromString(dateTimeString: item.startDate, format: 'dd MMM')} - ${DateTimeHelper.formatDateTimeFromString(dateTimeString: item.endDate, format: 'dd MMM yyyy')}",
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  _buildStatusBadge(item.status),
                ],
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
        text = 'DISETUJUI';
        break;
      case 'rejected':
        color = Colors.red;
        text = 'DITOLAK';
        break;
      default:
        color = Colors.orange;
        text = 'PENDING';
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12)),
      child: Text(text,
          style: TextStyle(
              color: color,
              fontSize: 9,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5)),
    );
  }

  @override
  void checkVariableAfterUi(BuildContext context) {
    if (notifier.isSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Pengajuan Berhasil! ✅"),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating));
        notifier.init();
      });
    }
  }

  @override
  void checkVariableBeforeUi(BuildContext context) {
    if (notifier.errorMessage.isNotEmpty) {
      final msg = notifier.errorMessage;
      notifier.errorMessage = "";
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(msg),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating));
      });
    }
  }
}

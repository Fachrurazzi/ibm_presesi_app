import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibm_presensi_app/app/presentation/leave/leave_notifier.dart';
import 'package:ibm_presensi_app/core/helper/date_time_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';

class LeaveScreen extends AppWidget<LeaveNotifier, void, void> {
  LeaveScreen({super.key}) : super(param1: null, param2: null);

  @override
  Widget bodyBuild(BuildContext context) {
    final theme = Theme.of(context);
    final prov = context.watch<LeaveNotifier>();

    return Scaffold(
      backgroundColor:
          const Color(0xFFF8F9FA), // Konsisten dengan bahasa desain IBM
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () => prov.getHistory(),
            color: theme.primaryColor,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // --- 1. HEADER (APPBAR & FORM AREA) ---
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 32),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(40)),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        _buildCustomAppBar(context),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: _buildQuotaHeader(context, theme, prov),
                        ),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: _buildFormContainer(context, theme, prov),
                        ),
                      ],
                    ),
                  ),
                ),

                // --- 2. SECTION TITLE RIWAYAT ---
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(24, 32, 24, 16),
                    child: Row(
                      children: [
                        Icon(Icons.history_rounded,
                            size: 18, color: Colors.blueGrey),
                        SizedBox(width: 8),
                        Text(
                          "Riwayat Pengajuan",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),

                // --- 3. LIST RIWAYAT ---
                _buildHistoryList(context, theme, prov),

                const SliverToBoxAdapter(child: SizedBox(height: 100)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
            onPressed: () => Navigator.pop(context),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Pengajuan Cuti',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
              ),
            ),
          ),
          const SizedBox(width: 48), // Spacer balance
        ],
      ),
    );
  }

  Widget _buildQuotaHeader(
      BuildContext context, ThemeData theme, LeaveNotifier prov) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [theme.primaryColor, theme.primaryColor.withBlue(220)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: theme.primaryColor.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
            child: const Icon(Icons.beach_access_rounded,
                color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Sisa Kuota Cuti Anda",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      fontWeight: FontWeight.w600)),
              Text("${prov.leaveQuota} Hari",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w900)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildFormContainer(
      BuildContext context, ThemeData theme, LeaveNotifier prov) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
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
                      prov.startDateController, Icons.calendar_today_rounded)),
              const SizedBox(width: 12),
              Expanded(
                  child: _buildSmallDatePicker(context, "Selesai",
                      prov.endDateController, Icons.event_available_rounded)),
            ],
          ),
          const SizedBox(height: 20),
          TextField(
            controller: prov.reasonController,
            maxLines: 3,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              hintText: "Tuliskan alasan pengajuan cuti...",
              hintStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey),
              filled: true,
              fillColor: const Color(0xFFF8F9FA),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.all(18),
            ),
          ),
          const SizedBox(height: 24),
          _buildSubmitButton(context, theme, prov),
        ],
      ),
    );
  }

  Widget _buildSmallDatePicker(BuildContext context, String label,
      TextEditingController controller, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 6),
          child: Text(label,
              style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  color: Colors.blueGrey)),
        ),
        InkWell(
          onTap: () {
            HapticFeedback.selectionClick();
            notifier.selectDate(context, controller);
          },
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade100),
            ),
            child: Row(
              children: [
                Icon(icon, size: 14, color: Colors.blue.withOpacity(0.5)),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    controller.text.isEmpty ? "Pilih" : controller.text,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: controller.text.isEmpty
                          ? Colors.grey
                          : Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton(
      BuildContext context, ThemeData theme, LeaveNotifier prov) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
            colors: [theme.primaryColor, theme.primaryColor.withBlue(220)]),
        boxShadow: [
          BoxShadow(
              color: theme.primaryColor.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5))
        ],
      ),
      child: ElevatedButton(
        onPressed: prov.isLoading ? null : () => prov.send(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
        child: prov.isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                    color: Colors.white, strokeWidth: 2))
            : const Text("KIRIM PENGAJUAN",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.8,
                    color: Colors.white,
                    fontSize: 13)),
      ),
    );
  }

  Widget _buildHistoryList(
      BuildContext context, ThemeData theme, LeaveNotifier prov) {
    if (prov.listLeave.isEmpty) return _buildEmptyState(theme);

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final item = prov.listLeave[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: Colors.grey.shade100),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.reason,
                            style: const TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 14),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 4),
                        Text(
                          "${DateTimeHelper.formatString(dateTimeString: item.startDate, format: 'dd MMM')} - ${DateTimeHelper.formatString(dateTimeString: item.endDate, format: 'dd MMM yyyy')}",
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  _buildStatusBadge(item.status),
                ],
              ),
            );
          },
          childCount: prov.listLeave.length,
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color color = status.toLowerCase() == 'approved'
        ? Colors.green
        : status.toLowerCase() == 'rejected'
            ? Colors.red
            : Colors.orange;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10)),
      child: Text(status.toUpperCase(),
          style: TextStyle(
              color: color, fontSize: 9, fontWeight: FontWeight.w900)),
    );
  }

  Widget _buildEmptyState(ThemeData theme) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.history_toggle_off_rounded,
                size: 60, color: Colors.grey.shade200),
            const SizedBox(height: 16),
            const Text("Belum Ada Riwayat",
                style: TextStyle(
                    fontWeight: FontWeight.w900, color: Colors.blueGrey)),
          ],
        ),
      ),
    );
  }

  @override
  void checkVariableAfterUi(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final safeAreaTop = MediaQuery.of(context).padding.top;

    if (notifier.isSuccess) {
      notifier.isSuccess = false;
      HapticFeedback.heavyImpact();
      ElegantNotification.success(
        width: screenWidth * 0.9,
        notificationMargin: safeAreaTop + 10,
        position: Alignment.topCenter,
        title: const Text("Berhasil",
            style: TextStyle(fontWeight: FontWeight.w900)),
        description: const Text("Pengajuan cuti telah dikirim."),
        showProgressIndicator: false,
        borderRadius: BorderRadius.circular(20),
        displayCloseButton: false,
      ).show(context);
    }

    if (notifier.leaveError.isNotEmpty) {
      final msg = notifier.leaveError;
      notifier.leaveError = "";
      HapticFeedback.vibrate();
      ElegantNotification.error(
        width: screenWidth * 0.9,
        notificationMargin: safeAreaTop + 10,
        position: Alignment.topCenter,
        title:
            const Text("Gagal", style: TextStyle(fontWeight: FontWeight.w900)),
        description: Text(msg),
        showProgressIndicator: false,
        borderRadius: BorderRadius.circular(20),
        displayCloseButton: false,
      ).show(context);
    }
  }

  @override
  void checkVariableBeforeUi(BuildContext context) {}

  @override
  AppBar? appBarBuild(BuildContext context) => null;
}

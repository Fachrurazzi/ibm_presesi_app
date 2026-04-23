import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/permission.dart';
import 'package:ibm_presensi_app/app/module/use_case/permission_get_detail_use_case.dart';
import 'package:ibm_presensi_app/app/presentation/common/permission/detail/permission_detail_notifier.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';

class PermissionDetailScreen extends StatelessWidget {
  final int permissionId;
  const PermissionDetailScreen({super.key, required this.permissionId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => PermissionDetailNotifier(
            sl<PermissionGetDetailUseCase>(), permissionId),
        child: _PermissionDetailView());
  }
}

class _PermissionDetailView
    extends AppWidget<PermissionDetailNotifier, void, void> {
  _PermissionDetailView() : super(param1: null, param2: null);

  @override
  Widget bodyBuild(BuildContext context) {
    final prov = context.watch<PermissionDetailNotifier>();
    final theme = Theme.of(context);
    final permission = prov.permission;

    if (prov.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (permission == null) {
      return const Scaffold(body: Center(child: Text("Data tidak ditemukan")));
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
          title: const Text("Detail Izin",
              style: TextStyle(fontWeight: FontWeight.w900)),
          centerTitle: true,
          backgroundColor: Colors.white),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _buildStatusCard(permission, theme),
            const SizedBox(height: 24),
            _buildInfoCard(permission, theme),
            if (permission.hasImage) ...[
              const SizedBox(height: 24),
              _buildImageCard(permission)
            ],
            const SizedBox(height: 24),
            _buildReasonCard(permission, theme),
          ])),
    );
  }

  Widget _buildStatusCard(PermissionEntity permission, ThemeData theme) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: permission.statusColor,
            borderRadius: BorderRadius.circular(24)),
        child: Row(children: [
          Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
              child:
                  Icon(permission.statusIcon, color: Colors.white, size: 32)),
          const SizedBox(width: 16),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(permission.statusDisplay,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900)),
                Text(permission.typeDisplay,
                    style: const TextStyle(color: Colors.white70))
              ]))
        ]));
  }

  Widget _buildInfoCard(PermissionEntity permission, ThemeData theme) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(24)),
        child: Column(children: [
          _buildInfoRow(
              Icons.calendar_today_rounded, "Tanggal Izin", permission.date),
          const Divider(height: 24),
          _buildInfoRow(Icons.info_rounded, "Status", permission.statusDisplay),
          if (permission.note != null) ...[
            const Divider(height: 24),
            _buildInfoRow(Icons.note_rounded, "Catatan Admin", permission.note!)
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

  Widget _buildImageCard(PermissionEntity permission) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(24)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Bukti Pendukung",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
          const SizedBox(height: 12),
          ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                  imageUrl: permission.imageProofUrl!,
                  fit: BoxFit.cover,
                  placeholder: (_, __) =>
                      Container(height: 200, color: Colors.grey.shade200),
                  errorWidget: (_, __, ___) => Container(
                      height: 200,
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.broken_image))))
        ]));
  }

  Widget _buildReasonCard(PermissionEntity permission, ThemeData theme) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(24)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Alasan",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
          const SizedBox(height: 12),
          Text(permission.reason,
              style: const TextStyle(fontSize: 14, height: 1.5))
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

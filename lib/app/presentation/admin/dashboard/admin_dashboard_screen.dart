import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/presentation/admin/dashboard/admin_dashboard_notifier.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class AdminDashboardScreen
    extends AppWidget<AdminDashboardNotifier, void, void> {
  AdminDashboardScreen({super.key}) : super(param1: null, param2: null);

  @override
  Widget bodyBuild(BuildContext context) {
    final prov = context.watch<AdminDashboardNotifier>();
    final theme = Theme.of(context);
    final stats = prov.stats?.stats;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
          title: const Text("Admin Dashboard",
              style: TextStyle(fontWeight: FontWeight.w900)),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white),
      body: RefreshIndicator(
        onRefresh: prov.refresh,
        child: prov.isLoadingData
            ? _buildShimmerContent()
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(children: [
                  _buildWelcomeCard(prov, theme),
                  const SizedBox(height: 16),
                  GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.5,
                      children: [
                        _buildStatCard(theme, "Total Karyawan", "120",
                            Icons.people_rounded, Colors.blue),
                        _buildStatCard(
                            theme,
                            "Hadir Hari Ini",
                            "${stats?.hadirBulanIni ?? 0}",
                            Icons.check_circle_rounded,
                            Colors.green),
                        _buildStatCard(
                            theme,
                            "Pending Cuti",
                            "${stats?.totalCutiPending ?? 0}",
                            Icons.beach_access_rounded,
                            Colors.orange),
                        _buildStatCard(
                            theme,
                            "Pending Izin",
                            "${stats?.totalIzinPending ?? 0}",
                            Icons.note_alt_rounded,
                            Colors.purple),
                      ]),
                  const SizedBox(height: 24),
                  _buildQuickActions(context, theme),
                ])),
      ),
    );
  }

  Widget _buildWelcomeCard(AdminDashboardNotifier prov, ThemeData theme) =>
      Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                theme.colorScheme.primary,
                theme.colorScheme.primary.withBlue(220)
              ]),
              borderRadius: BorderRadius.circular(24)),
          child: Row(children: [
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const Text("Selamat Datang,",
                      style: TextStyle(color: Colors.white70, fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(prov.stats?.user.name ?? "Admin",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900)),
                  const SizedBox(height: 8),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text("ADMINISTRATOR",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1)))
                ])),
            Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle),
                child: const Icon(Icons.admin_panel_settings_rounded,
                    color: Colors.white, size: 40))
          ]));

  Widget _buildStatCard(ThemeData theme, String title, String value,
          IconData icon, Color color) =>
      Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: color, size: 24),
                const SizedBox(height: 8),
                Text(value,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w900)),
                Text(title,
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade600))
              ]));

  Widget _buildQuickActions(BuildContext context, ThemeData theme) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text("Akses Cepat",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
        const SizedBox(height: 12),
        Row(children: [
          Expanded(
              child: _buildActionCard(
                  context,
                  Icons.people_rounded,
                  "Kelola User",
                  Colors.blue,
                  () => Navigator.pushNamed(context, '/user-management'))),
          const SizedBox(width: 12),
          Expanded(
              child: _buildActionCard(
                  context,
                  Icons.business_rounded,
                  "Kelola Office",
                  Colors.green,
                  () => Navigator.pushNamed(context, '/office-management'))),
          const SizedBox(width: 12),
          Expanded(
              child: _buildActionCard(
                  context,
                  Icons.calendar_month_rounded,
                  "Kelola Schedule",
                  Colors.orange,
                  () => Navigator.pushNamed(context, '/schedule-management')))
        ])
      ]);

  Widget _buildActionCard(BuildContext context, IconData icon, String label,
          Color color, VoidCallback onTap) =>
      GestureDetector(
          onTap: onTap,
          child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade100)),
              child: Column(children: [
                Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12)),
                    child: Icon(icon, color: color, size: 24)),
                const SizedBox(height: 8),
                Text(label,
                    style: const TextStyle(
                        fontSize: 11, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center)
              ])));

  Widget _buildShimmerContent() => SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Column(children: [
            Container(
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24))),
            const SizedBox(height: 16),
            GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.5,
                children: List.generate(
                    4,
                    (_) => Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)))))
          ])));

  @override
  void checkVariableAfterUi(BuildContext context) {}
  @override
  void checkVariableBeforeUi(BuildContext context) {}
  @override
  AppBar? appBarBuild(BuildContext context) => null;
}

import 'dart:ui';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:ibm_presensi_app/app/presentation/map/map_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/navbar/navbar_screen.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';

class MapScreen extends AppWidget<MapNotifier, void, void> {
  MapScreen({super.key}) : super(param1: null, param2: null);

  @override
  AppBar? appBarBuild(BuildContext context) {
    return AppBar(
      title: const Text("Lokasi Presensi",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
        onPressed: () => Navigator.pop(context),
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  @override
  Widget bodyBuild(BuildContext context) {
    final notifier = context.watch<MapNotifier>();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Stack(
            children: [
              // 1. PETA (Layer Dasar)
              OSMFlutter(
                controller: notifier.mapController,
                osmOption: OSMOption(
                  zoomOption: const ZoomOption(initZoom: 16, maxZoomLevel: 19),
                  userLocationMarker: UserLocationMaker(
                    personMarker: MarkerIcon(
                      icon: Icon(Icons.location_history,
                          size: 60, color: theme.colorScheme.primary),
                    ),
                    directionArrowMarker: const MarkerIcon(
                      icon:
                          Icon(Icons.navigation, size: 48, color: Colors.blue),
                    ),
                  ),
                  staticPoints: [
                    if (notifier.officeLocation != null)
                      StaticPositionGeoPoint(
                        "office",
                        MarkerIcon(
                          icon: Icon(Icons.location_on,
                              color: Colors.redAccent.shade700, size: 56),
                        ),
                        [notifier.officeLocation!],
                      ),
                  ],
                ),
                onMapIsReady: (ready) => notifier.onMapReady(ready),
                mapIsLoading: const Center(child: CircularProgressIndicator()),
              ),

              // 2. INDICATOR: Glassmorphism Status Radius
              Positioned(
                top: 16,
                left: 20,
                right: 20,
                child: _buildStatusHeader(context, notifier),
              ),

              // 3. BOTTOM PANEL: Info & Tombol Absen
              Align(
                alignment: Alignment.bottomCenter,
                child: _buildBottomPanel(context, notifier, theme),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusHeader(BuildContext context, MapNotifier notifier) {
    bool inArea = notifier.isEnableSubmitButton;
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          decoration: BoxDecoration(
            color: (inArea ? Colors.green : Colors.redAccent).withOpacity(0.85),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white24),
          ),
          child: Row(
            children: [
              Icon(inArea ? Icons.verified_user_rounded : Icons.gpp_bad_rounded,
                  color: Colors.white, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  inArea
                      ? "ANDA BERADA DI DALAM RADIUS"
                      : "DI LUAR RADIUS KANTOR",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 11,
                      letterSpacing: 0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomPanel(
      BuildContext context, MapNotifier notifier, ThemeData theme) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 30,
              offset: const Offset(0, 10))
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              _buildInfoTile(context, Icons.business_rounded, "LOKASI",
                  notifier.schedule?.office.name ?? "..."),
              const SizedBox(width: 12),
              _buildInfoTile(context, Icons.history_toggle_off_rounded, "SHIFT",
                  notifier.schedule?.shift.name ?? "-"),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: notifier.isEnableSubmitButton && !notifier.isLoading
                  ? LinearGradient(
                      colors: [
                        theme.primaryColor,
                        theme.primaryColor.withBlue(220)
                      ],
                    )
                  : null,
            ),
            child: ElevatedButton(
              onPressed: notifier.isEnableSubmitButton && !notifier.isLoading
                  ? () => notifier.submitAttendance()
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: notifier.isEnableSubmitButton
                    ? Colors.transparent
                    : Colors.grey.shade200,
                foregroundColor: Colors.white,
                disabledForegroundColor: Colors.grey.shade400,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: notifier.isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 3))
                  : const Text("KIRIM PRESENSI",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                          letterSpacing: 1)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(
      BuildContext context, IconData icon, String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: const Color(0xFFF8F9FA),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.grey.shade100)),
        child: Row(
          children: [
            Icon(icon, size: 16, color: Theme.of(context).primaryColor),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label,
                      style: const TextStyle(
                          fontSize: 9,
                          color: Colors.grey,
                          fontWeight: FontWeight.w800)),
                  Text(value,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w900),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void checkVariableAfterUi(BuildContext context) {
    final prov = context.read<MapNotifier>();
    final double safeAreaTop = MediaQuery.of(context).padding.top;
    final double screenWidth = MediaQuery.of(context).size.width;

    if (prov.isSuccess) {
      prov.isSuccess = false;
      HapticFeedback.heavyImpact();
      _showNotif(context, "Presensi Berhasil!",
          "Data lokasi Anda telah tercatat sistem ✅",
          isError: false, width: screenWidth, margin: safeAreaTop);

      Future.delayed(const Duration(milliseconds: 2000), () {
        if (context.mounted) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const NavbarScreen()),
              (route) => false);
        }
      });
    }

    if (prov.failedMessage.isNotEmpty || prov.errorMessage.isNotEmpty) {
      final msg = prov.failedMessage.isNotEmpty
          ? prov.failedMessage
          : prov.errorMessage;
      prov.failedMessage = "";
      // Reset state notifier jika perlu
      HapticFeedback.vibrate();
      _showNotif(context, "Gagal Presensi", msg,
          isError: true, width: screenWidth, margin: safeAreaTop);
    }
  }

  void _showNotif(BuildContext context, String title, String msg,
      {required bool isError, required double width, required double margin}) {
    ElegantNotification(
      width: width * 0.9,
      notificationMargin: margin + 10,
      position: Alignment.topCenter,
      animation: AnimationType.fromTop,
      background: isError ? Colors.red.shade50 : Colors.green.shade50,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
      description: Text(msg, style: const TextStyle(fontSize: 11)),
      icon: Icon(
        isError
            ? Icons.error_outline_rounded
            : Icons.check_circle_outline_rounded,
        color: isError ? Colors.red : Colors.green,
      ),
      showProgressIndicator: false,
      borderRadius: BorderRadius.circular(20), // Konsisten 20px
      displayCloseButton: false,
    ).show(context);
  }
}

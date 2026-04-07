import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_screen.dart';
import 'package:ibm_presensi_app/app/presentation/map/map_notifier.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';

class MapScreen extends AppWidget<MapNotifier, void, void> {
  MapScreen({super.key});

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
    );
  }

  @override
  Widget bodyBuild(BuildContext context) {
    final notifier = context.watch<MapNotifier>();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        // KUNCI RESPONSIVE: Batasi lebar maksimal untuk Tablet
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Stack(
            children: [
              // 1. MAP LAYER (FULL)
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
                    StaticPositionGeoPoint(
                      "office",
                      MarkerIcon(
                        icon: Icon(
                          Icons.location_on,
                          color: Colors.redAccent.shade700,
                          size: 56,
                        ),
                      ),
                      [
                        notifier.officeLocation ??
                            GeoPoint(latitude: 0, longitude: 0)
                      ],
                    ),
                  ],
                ),
                onMapIsReady: (ready) => notifier.mapIsReady(ready),
                mapIsLoading: const Center(child: CircularProgressIndicator()),
              ),

              // 2. TOP STATUS BAR (Glassmorphism)
              Positioned(
                top: 16,
                left: 20,
                right: 20,
                child: _buildStatusHeader(context, notifier),
              ),

              // 3. COMPACT BOTTOM PANEL
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
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur diperkuat
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          decoration: BoxDecoration(
            color: (inArea ? Colors.green : Colors.redAccent).withOpacity(0.8),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white24),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                  inArea
                      ? Icons.verified_user_rounded
                      : Icons.location_off_rounded,
                  color: Colors.white,
                  size: 20),
              const SizedBox(width: 12),
              // FIX: Pakai Expanded + FittedBox agar teks status tidak overflow di HP kecil
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    inArea ? "ZONA TERDETEKSI" : "DI LUAR RADIUS",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                      letterSpacing: 1.2,
                    ),
                  ),
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
      margin:
          const EdgeInsets.all(20), // Memberikan margin agar terlihat melayang
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32), // Lebih membulat (Premium)
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 25,
              offset: const Offset(0, 10))
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // INFO ROW
          Row(
            children: [
              _buildCompactInfo(context, Icons.business_rounded, "KANTOR",
                  notifier.schedule?.office.name ?? "-"),
              const SizedBox(width: 12),
              _buildCompactInfo(context, Icons.schedule_rounded, "SHIFT",
                  notifier.schedule?.shift.name ?? "-"),
            ],
          ),

          const SizedBox(height: 16),

          // BUTTON KIRIM
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: notifier.isEnableSubmitButton && !notifier.isLoading
                  ? () => notifier.send()
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.grey.shade100,
                disabledForegroundColor: Colors.grey.shade400,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                elevation: 0,
              ),
              child: notifier.isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 2.5))
                  : const Text("KIRIM PRESENSI SEKARANG",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                          letterSpacing: 0.5)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompactInfo(
      BuildContext context, IconData icon, String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey.shade100),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(label,
                      style: const TextStyle(
                          fontSize: 9,
                          color: Colors.grey,
                          fontWeight: FontWeight.w900)),
                  // FIX: FittedBox agar nama kantor yang panjang tidak terpotong kasar
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(value,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: Colors.black87),
                        maxLines: 1),
                  ),
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
    if (notifier.isSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text("Presensi Berhasil! ✅"),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating),
        );
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => HomeScreen()), (route) => false);
      });
    }
  }

  @override
  void checkVariableBeforeUi(BuildContext context) {
    if (notifier.errorMessage.isNotEmpty) {
      final msg = notifier.errorMessage;
      notifier.errorMessage = "";
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(msg),
              backgroundColor: Colors.redAccent,
              behavior: SnackBarBehavior.floating),
        );
      });
    }
  }
}

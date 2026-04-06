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
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
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
      body: Stack(
        children: [
          // 1. MAP LAYER
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
                  icon: Icon(Icons.navigation, size: 48, color: Colors.blue),
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
    );
  }

  Widget _buildStatusHeader(BuildContext context, MapNotifier notifier) {
    bool inArea = notifier.isEnableSubmitButton;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          decoration: BoxDecoration(
            color: (inArea ? Colors.green : Colors.redAccent).withOpacity(0.85),
            borderRadius: BorderRadius.circular(20),
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
              const SizedBox(width: 10),
              Text(
                inArea ? "ZONA TERDETEKSI" : "DI LUAR RADIUS",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 12,
                  letterSpacing: 1.1,
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
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
              color: Colors.black12, blurRadius: 20, offset: Offset(0, -5))
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // INFO ROW (Horizontal Layout - Hemat Ruang)
          Row(
            children: [
              _buildCompactInfo(context, Icons.business_rounded, "KANTOR",
                  notifier.schedule?.office.name ?? "-"),
              const SizedBox(width: 12),
              _buildCompactInfo(context, Icons.schedule_rounded, "SHIFT",
                  notifier.schedule?.shift.name ?? "-"),
            ],
          ),

          const SizedBox(height: 20),

          // BUTTON KIRIM (Lebih Slim)
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: notifier.isEnableSubmitButton && !notifier.isLoading
                  ? () => notifier.send()
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 0,
              ),
              child: notifier.isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 2))
                  : const Text("KIRIM PRESENSI SEKARANG",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade100),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(label,
                      style: const TextStyle(
                          fontSize: 9,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold)),
                  Text(value,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
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

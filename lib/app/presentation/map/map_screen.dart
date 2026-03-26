import 'package:flutter/material.dart';
import 'package:flutter/src/material/app_bar.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_screen.dart';
import 'package:ibm_presensi_app/app/presentation/map/map_notifier.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/helper/location_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:ibm_presensi_app/core/widget/loading_app_widget.dart';

class MapScreen extends AppWidget<MapNotifier, void, void> {
  MapScreen({super.key});

  @override
  AppBar? appBarBuild(BuildContext context) {
    return AppBar(
      title: const Text("Lokasi Presensi",
          style: TextStyle(fontWeight: FontWeight.bold)),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
  }

  @override
  Widget bodyBuild(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Map View
          OSMFlutter(
            controller: notifier.mapController,
            osmOption: OSMOption(
              zoomOption: const ZoomOption(initZoom: 16, maxZoomLevel: 19),
              userLocationMarker: UserLocationMaker(
                personMarker: const MarkerIcon(
                    icon: Icon(Icons.location_history, size: 48)),
                directionArrowMarker:
                    const MarkerIcon(icon: Icon(Icons.navigation, size: 48)),
              ),
            ),
            onMapIsReady: (ready) => ready ? notifier.mapIsReady() : null,
            mapIsLoading: const Center(child: CircularProgressIndicator()),
          ),

          // 2. Floating Info Chip
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: _buildStatusChip(context),
          ),

          // 3. Bottom Detail Panel
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildBottomPanel(context),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context) {
    bool inArea = notifier.isEnableSubmitButton;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      color: inArea ? Colors.green.shade600 : Colors.red.shade600,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(inArea ? Icons.check_circle : Icons.error,
                color: Colors.white, size: 18),
            const SizedBox(width: 8),
            Text(
              inArea
                  ? "Anda berada di zona presensi"
                  : "Di luar zona jangkauan",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomPanel(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
              color: Colors.black12, blurRadius: 20, offset: Offset(0, -5))
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              _buildInfoItem(context, Icons.business, "Kantor",
                  notifier.schedule?.office.name ?? "-"),
              const SizedBox(width: 20),
              _buildInfoItem(context, Icons.timer_outlined, "Shift",
                  notifier.schedule?.shift.name ?? "-"),
            ],
          ),
          const Divider(height: 32),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: FilledButton(
              onPressed:
                  notifier.isEnableSubmitButton ? () => notifier.send() : null,
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                backgroundColor: theme.colorScheme.primary,
              ),
              child: const Text("Kirim Kehadiran Sekarang",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(
      BuildContext context, IconData icon, String label, String value) {
    return Expanded(
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(color: Colors.grey, fontSize: 11)),
                Text(value,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void checkVariableAfterUi(BuildContext context) {
    if (notifier.isSuccess) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => HomeScreen()), (r) => false);
    }
  }

  @override
  void checkVariableBeforeUi(BuildContext context) {
    // Logika Error Button untuk Permission/GPS (Tetap sama)
  }
}

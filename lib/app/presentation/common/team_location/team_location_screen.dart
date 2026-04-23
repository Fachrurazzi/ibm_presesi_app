import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:ibm_presensi_app/app/module/entity/user_location.dart';
import 'package:ibm_presensi_app/app/module/use_case/get_user_locations_use_case.dart';
import 'package:ibm_presensi_app/app/presentation/common/team_location/team_location_notifier.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';

class TeamLocationScreen extends StatelessWidget {
  final bool isAdmin;

  const TeamLocationScreen({super.key, this.isAdmin = false});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TeamLocationNotifier(
        sl<GetAllUserLocationsUseCase>(),
        sl<GetTeamLocationsUseCase>(),
        isAdmin,
      ),
      child: _TeamLocationView(),
    );
  }
}

class _TeamLocationView extends AppWidget<TeamLocationNotifier, void, void> {
  _TeamLocationView() : super(param1: null, param2: null);

  @override
  Widget bodyBuild(BuildContext context) {
    final prov = context.watch<TeamLocationNotifier>();
    final theme = Theme.of(context);

    // Siapkan static points untuk marker
    final staticPoints = prov.users.where((u) => u.hasLocation).map((user) {
      final isSelected = user.id == prov.selectedUser?.id;
      return StaticPositionGeoPoint(
        "user_${user.id}",
        MarkerIcon(
          icon: Icon(
            Icons.person_pin_circle_rounded,
            color: isSelected ? Colors.red : Colors.green,
            size: 35,
          ),
        ),
        [
          GeoPoint(latitude: user.lastLatitude!, longitude: user.lastLongitude!)
        ],
      );
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Lokasi Tim",
            style: TextStyle(fontWeight: FontWeight.w900)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: prov.refresh,
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Cari karyawan...",
                prefixIcon: const Icon(Icons.search_rounded),
                suffixIcon: prov.searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear_rounded),
                        onPressed: () => prov.search(""),
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade50,
              ),
              onChanged: prov.search,
            ),
          ),

          // Map View
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: OSMFlutter(
                  controller: prov.mapController,
                  osmOption: OSMOption(
                    zoomOption:
                        const ZoomOption(initZoom: 14, maxZoomLevel: 19),
                    userLocationMarker: UserLocationMaker(
                      personMarker: MarkerIcon(
                        icon: Icon(
                          Icons.my_location_rounded,
                          color: theme.colorScheme.primary,
                          size: 30,
                        ),
                      ),
                      directionArrowMarker: MarkerIcon(
                        // 👈 Tambahkan ini
                        icon: Icon(
                          Icons.navigation_rounded,
                          color: theme.colorScheme.primary,
                          size: 40,
                        ),
                      ),
                    ),
                    staticPoints: staticPoints,
                  ),
                ),
              ),
            ),
          ),

          // Selected User Info
          if (prov.selectedUser != null)
            _buildSelectedUserCard(prov.selectedUser!, theme),

          // User List
          Container(
            height: 180,
            margin: const EdgeInsets.only(top: 8),
            child: prov.isLoading
                ? _buildShimmerList()
                : prov.filteredUsers.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: prov.filteredUsers.length,
                        itemBuilder: (context, index) {
                          final user = prov.filteredUsers[index];
                          final isSelected = user.id == prov.selectedUser?.id;
                          return _buildUserCard(user, isSelected,
                              () => prov.selectUser(user), theme);
                        },
                      ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedUserCard(UserLocation user, ThemeData theme) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: user.displayAvatar.isNotEmpty
                ? NetworkImage(user.displayAvatar)
                : null,
            child: user.displayAvatar.isEmpty
                ? const Icon(Icons.person_rounded)
                : null,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        user.displayName,
                        style: const TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 16),
                      ),
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: user.statusColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      user.isOnline ? "Online" : "Offline",
                      style: TextStyle(fontSize: 11, color: user.statusColor),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  user.displayPosition,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on_rounded,
                        size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      user.hasLocation ? user.lastSeenText : "Belum ada lokasi",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    if (user.hasLocation) ...[
                      const SizedBox(width: 12),
                      const Icon(Icons.access_time_rounded,
                          size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        user.lastTimeFormatted,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserCard(
      UserLocation user, bool isSelected, VoidCallback onTap, ThemeData theme) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 12, bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.primary.withOpacity(0.1)
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color:
                isSelected ? theme.colorScheme.primary : Colors.grey.shade200,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            if (!isSelected)
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: user.displayAvatar.isNotEmpty
                          ? NetworkImage(user.displayAvatar)
                          : null,
                      child: user.displayAvatar.isEmpty
                          ? const Icon(Icons.person, size: 18)
                          : null,
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: user.statusColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    user.displayName.split(' ')[0],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (user.hasLocation) ...[
              Row(
                children: [
                  const Icon(Icons.location_on_rounded,
                      size: 12, color: Colors.grey),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      user.lastSeenText,
                      style: const TextStyle(fontSize: 10, color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ] else
              const Row(
                children: [
                  Icon(Icons.location_off_rounded,
                      size: 12, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(
                    "Belum ada lokasi",
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 5,
      itemBuilder: (_, __) => Container(
        width: 150,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people_outline_rounded,
              size: 40, color: Colors.grey.shade300),
          const SizedBox(height: 8),
          const Text(
            "Tidak ada data",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  @override
  void checkVariableAfterUi(BuildContext context) {
    if (notifier.hasError) {
      final msg = notifier.errorMessage;
      notifier.clearError();
      GlobalHelper.showErrorNotification(
        context: context,
        title: "Gagal",
        message: msg,
      );
    }
  }

  @override
  void checkVariableBeforeUi(BuildContext context) {}

  @override
  AppBar? appBarBuild(BuildContext context) => null;
}

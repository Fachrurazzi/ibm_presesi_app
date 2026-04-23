import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibm_presensi_app/app/presentation/common/team_location/team_location_screen.dart';
import 'package:ibm_presensi_app/app/presentation/manager/team_dashboard/team_dashboard_screen.dart';
import 'package:ibm_presensi_app/app/presentation/manager/team_attendance/team_attendance_screen.dart';
import 'package:ibm_presensi_app/app/presentation/manager/approval/leave_approval/leave_approval_screen.dart';
import 'package:ibm_presensi_app/app/presentation/manager/approval/permission_approval/permission_approval_screen.dart';
import 'package:ibm_presensi_app/app/presentation/common/profile/profile_screen.dart';

class ManagerNavbar extends StatefulWidget {
  const ManagerNavbar({super.key});

  @override
  State<ManagerNavbar> createState() => _ManagerNavbarState();
}

class _ManagerNavbarState extends State<ManagerNavbar> {
  int _selectedIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      TeamDashboardScreen(),
      TeamAttendanceScreen(),
      TeamLocationScreen(isAdmin: false,),
      LeaveApprovalScreen(),
      PermissionApprovalScreen(),
      ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    HapticFeedback.selectionClick();
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFFF8F9FA),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(Icons.dashboard_rounded, 'Dashboard', 0, theme),
            _buildNavItem(Icons.people_alt_rounded, 'Tim', 1, theme),
            _buildNavItem(Icons.beach_access_rounded, 'Cuti', 2, theme),
            _buildNavItem(Icons.note_alt_rounded, 'Izin', 3, theme),
            _buildNavItem(Icons.person_rounded, 'Profil', 4, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
      IconData icon, String label, int index, ThemeData theme) {
    final isSelected = _selectedIndex == index;
    final color = isSelected ? theme.colorScheme.primary : Colors.grey.shade400;

    return Expanded(
      child: GestureDetector(
        onTap: () => _onItemTapped(index),
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSelected ? color.withOpacity(0.1) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w900 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_screen.dart';
import 'package:ibm_presensi_app/app/presentation/detail_attendance/detail_attendance_screen.dart';
import 'package:ibm_presensi_app/app/presentation/leave/leave_screen.dart';
import 'package:ibm_presensi_app/app/presentation/profile/profile_screen.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Memeriksa status onboarding segera setelah render pertama
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _checkOnboardingStatus());
  }

  // --- LOGIKA ONBOARDING: Memastikan User melewati semua step PT IBM ---
  Future<void> _checkOnboardingStatus() async {
    // Beri jeda agar SharedPreferences benar-benar siap
    await Future.delayed(const Duration(milliseconds: 300));

    final bool isDefaultPass =
        SharedPreferencesHelper.getBool(AppPreferences.IS_DEFAULT_PASSWORD) ??
            false;
    final bool isFaceReg =
        SharedPreferencesHelper.getBool(AppPreferences.IS_FACE_REGISTERED) ??
            false;

    if (!mounted) return;

    if (isDefaultPass) {
      Navigator.pushReplacementNamed(context, '/change-password');
    } else if (!isFaceReg) {
      Navigator.pushReplacementNamed(
        context,
        '/face-recognition',
        arguments: {'isRegistration': true},
      );
    }
  }

  final List<Widget> _screens = [
    HomeScreen(),
    DetailAttendanceScreen(),
    LeaveScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    HapticFeedback.selectionClick();
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return PopScope(
      canPop: _selectedIndex == 0,
      onPopInvoked: (didPop) {
        if (didPop) return;
        if (_selectedIndex != 0) setState(() => _selectedIndex = 0);
      },
      child: Scaffold(
        extendBody: true,
        backgroundColor: const Color(0xFFF8F9FA),
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),

        // --- FAB MODERN (Presensi Cepat) ---
        floatingActionButton: AnimatedScale(
          scale: isKeyboardOpen ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutBack,
          child: GestureDetector(
            onTap: () {
              HapticFeedback.heavyImpact();
              Navigator.pushNamed(context, '/face-recognition');
            },
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    theme.primaryColor,
                    theme.primaryColor.withBlue(220)
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: theme.primaryColor.withOpacity(0.4),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  )
                ],
              ),
              child: const Icon(Icons.fingerprint_rounded,
                  color: Colors.white, size: 35),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        // --- BOTTOM BAR: Proteksi Overflow PT IBM ---
        bottomNavigationBar: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isKeyboardOpen ? 0 : 100, // Sedikit lebih rendah agar rapi
          child: BottomAppBar(
            padding: EdgeInsets.zero,
            color: Colors.white,
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            elevation: 30,
            child: Row(
              children: [
                // Kelompok Kiri
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNavItem(
                          Icons.grid_view_rounded, 'Beranda', 0, theme),
                      _buildNavItem(
                          Icons.assignment_outlined, 'Riwayat', 1, theme),
                    ],
                  ),
                ),

                // Ruang untuk FAB di tengah
                const SizedBox(width: 75),

                // Kelompok Kanan
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNavItem(
                          Icons.calendar_today_rounded, 'Cuti', 2, theme),
                      _buildNavItem(
                          Icons.account_circle_outlined, 'Profil', 3, theme),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
      IconData icon, String label, int index, ThemeData theme) {
    final isSelected = _selectedIndex == index;
    final color = isSelected ? theme.primaryColor : Colors.blueGrey.shade200;

    return Expanded(
      // Memastikan membagi ruang secara matematis
      child: GestureDetector(
        onTap: () => _onItemTapped(index),
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected
                    ? theme.primaryColor.withOpacity(0.12)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(height: 4),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 10,
                  fontWeight: isSelected ? FontWeight.w900 : FontWeight.w600,
                  letterSpacing: -0.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_screen.dart';
import 'package:ibm_presensi_app/app/presentation/detail_attendance/detail_attendance_screen.dart';
import 'package:ibm_presensi_app/app/presentation/leave/leave_screen.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/profile/profile_screen.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:provider/provider.dart';

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
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _checkOnboardingStatus());
  }

  /// Menjaga user agar wajib melewati flow ganti password & daftar wajah
  Future<void> _checkOnboardingStatus() async {
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
      Navigator.pushReplacementNamed(context, '/face-recognition',
          arguments: {'isRegistration': true});
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

    // KUNCI: Pantau status keamanan dan status kerja secara real-time
    final homeNotifier = context.watch<HomeNotifier>();

    // --- 1. LOGIKA PROTEKSI KERAS (BANNED/EMULATOR) ---
    if (homeNotifier.isEmulator) {
      return HomeScreen();
    }

    // --- 2. LOGIKA STATUS CUTI & ABSENSI ---
    final bool isUserOnLeave = homeNotifier.isLeaves;

    final bool isClockIn = homeNotifier.attendanceToday?.startTime != null &&
        homeNotifier.attendanceToday?.startTime != "--:--";

    final bool isClockOut = homeNotifier.attendanceToday?.endTime != null &&
        homeNotifier.attendanceToday?.endTime != "--:--";

    final bool isFullyDone = isClockIn && isClockOut;

    return PopScope(
      canPop: _selectedIndex == 0,
      onPopInvoked: (didPop) {
        if (didPop) return;
        if (_selectedIndex != 0) setState(() => _selectedIndex = 0);
      },
      child: Scaffold(
        extendBody: true,
        backgroundColor: const Color(0xFFF8F9FA),
        resizeToAvoidBottomInset: false,
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),

        // --- 3. FLOATING ACTION BUTTON (DINAMIS: ABSEN / CUTI) ---
        floatingActionButton: isUserOnLeave
            ? _buildLeaveFAB(context) // Tampilkan Icon Cuti jika sedang cuti
            : AnimatedScale(
                scale: isKeyboardOpen ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutBack,
                child: GestureDetector(
                  onTap: isFullyDone
                      ? () {
                          HapticFeedback.vibrate();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Absensi hari ini sudah selesai ✅"),
                                behavior: SnackBarBehavior.floating),
                          );
                        }
                      : () {
                          HapticFeedback.heavyImpact();
                          Navigator.pushNamed(context, '/face-recognition');
                        },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 72,
                    width: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: isFullyDone
                          ? LinearGradient(colors: [
                              Colors.grey.shade400,
                              Colors.grey.shade600
                            ])
                          : LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                theme.primaryColor,
                                theme.primaryColor.withBlue(220)
                              ],
                            ),
                      boxShadow: [
                        BoxShadow(
                          color: isFullyDone
                              ? Colors.transparent
                              : theme.primaryColor.withOpacity(0.4),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        )
                      ],
                      border: Border.all(color: Colors.white, width: 4),
                    ),
                    child: Icon(
                      isFullyDone
                          ? Icons.check_rounded
                          : (isClockIn
                              ? Icons.logout_rounded
                              : Icons.fingerprint_rounded),
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        // --- 4. BOTTOM NAVIGATION BAR ---
        bottomNavigationBar: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isKeyboardOpen ? 0 : 90,
          child: BottomAppBar(
            padding: EdgeInsets.zero,
            color: Colors.white,
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            elevation: 30,
            child: Row(
              children: [
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
                const SizedBox(width: 75), // Spacer FAB
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

  // --- HELPER: WIDGET NAVBAR ITEM ---
  Widget _buildNavItem(
      IconData icon, String label, int index, ThemeData theme) {
    final isSelected = _selectedIndex == index;
    final color = isSelected ? theme.primaryColor : Colors.blueGrey.shade200;

    return Expanded(
      child: GestureDetector(
        onTap: () => _onItemTapped(index),
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected
                    ? theme.primaryColor.withOpacity(0.1)
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

  // --- HELPER: TOMBOL SAAT SEDANG CUTI ---
  Widget _buildLeaveFAB(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text("Anda sedang dalam masa cuti 🏖️ Selamat beristirahat!"),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.orange,
          ),
        );
      },
      child: Container(
        height: 72,
        width: 72,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.orange.shade50,
          border: Border.all(color: Colors.white, width: 4),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withOpacity(0.2),
              blurRadius: 15,
              offset: const Offset(0, 8),
            )
          ],
        ),
        child: const Icon(
          Icons.beach_access_rounded,
          color: Colors.orange,
          size: 32,
        ),
      ),
    );
  }
}

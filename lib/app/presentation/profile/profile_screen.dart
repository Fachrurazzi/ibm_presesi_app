import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibm_presensi_app/app/presentation/login/login_screen.dart';
import 'package:ibm_presensi_app/core/helper/date_time_helper.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ibm_presensi_app/app/presentation/profile/profile_notifier.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends AppWidget<ProfileNotifier, void, void> {
  ProfileScreen({super.key}) : super(param1: null, param2: null);

  @override
  Widget bodyBuild(BuildContext context) {
    final prov = context.watch<ProfileNotifier>();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Konsisten dengan HomeScreen
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // --- 1. HEADER PROFILE (Rounded Header) ---
              SliverToBoxAdapter(child: _buildHeader(context, prov, theme)),

              // --- 2. FORM SECTION ---
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(height: 24),
                    _buildSectionLabel("Informasi Pribadi"),
                    const SizedBox(height: 12),
                    _buildCustomField(
                      controller: prov.nameController,
                      label: "Nama Lengkap",
                      icon: Icons.person_outline_rounded,
                      theme: theme,
                    ),
                    const SizedBox(height: 24),
                    _buildSectionLabel("Keamanan Akun"),
                    const SizedBox(height: 12),
                    _buildCustomField(
                      controller: prov.oldPassController,
                      label: "Password Lama",
                      icon: Icons.lock_open_rounded,
                      isPass: true,
                      obscure: prov.obscureOld,
                      onToggle: () => prov.toggleObscureOld(),
                      hint: "Isi jika ingin ganti password",
                      theme: theme,
                    ),
                    const SizedBox(height: 16),
                    _buildCustomField(
                      controller: prov.newPassController,
                      label: "Password Baru",
                      icon: Icons.vpn_key_outlined,
                      isPass: true,
                      obscure: prov.obscureNew,
                      onToggle: () => prov.toggleObscureNew(),
                      hint: "Minimal 8 karakter",
                      theme: theme,
                    ),
                    const SizedBox(height: 40),

                    // Tombol Simpan (Gradient Style)
                    _buildSaveButton(context, prov, theme),
                    const SizedBox(height: 16),

                    // Tombol Logout
                    _buildLogoutButton(context),
                    const SizedBox(height: 100),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(
      BuildContext context, ProfileNotifier prov, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        children: [
          const Text(
            "Pengaturan Profil",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
          ),
          const SizedBox(height: 24),
          _buildAvatarStack(context, prov, theme),
          const SizedBox(height: 20),
          Text(
            prov.position.isNotEmpty ? prov.position : "Karyawan IBM",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: theme.primaryColor,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Sejak: ${DateTimeHelper.formatString(dateTimeString: prov.joinDate, format: 'dd MMM yyyy')}",
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarStack(
      BuildContext context, ProfileNotifier prov, ThemeData theme) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: theme.primaryColor.withOpacity(0.1),
              width: 4,
            ),
          ),
          child: Hero(
            tag: 'profile_photo_main',
            child: CircleAvatar(
              radius: 55,
              backgroundColor: const Color(0xFFF8F9FA),
              backgroundImage: prov.imageFileLocal != null
                  ? FileImage(prov.imageFileLocal!) as ImageProvider
                  : (prov.imageUrlServer != null &&
                          prov.imageUrlServer!.isNotEmpty)
                      ? CachedNetworkImageProvider(prov.imageUrlServer!)
                      : null,
              child: (prov.imageFileLocal == null &&
                      (prov.imageUrlServer == null ||
                          prov.imageUrlServer!.isEmpty))
                  ? Icon(Icons.person_rounded,
                      size: 50, color: Colors.grey.shade300)
                  : null,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _showPickerOptions(context, prov),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.primaryColor,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
            ),
            child: const Icon(Icons.camera_alt_rounded,
                color: Colors.white, size: 18),
          ),
        ),
      ],
    );
  }

  Widget _buildCustomField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required ThemeData theme,
    bool isPass = false,
    bool obscure = false,
    VoidCallback? onToggle,
    String? hint,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: TextField(
        controller: controller,
        obscureText: isPass ? obscure : false,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade300, fontSize: 13),
          prefixIcon:
              Icon(icon, color: theme.primaryColor.withOpacity(0.7), size: 20),
          suffixIcon: isPass
              ? IconButton(
                  icon: Icon(
                    obscure
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    size: 18,
                  ),
                  onPressed: onToggle,
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget _buildSectionLabel(String text) => Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 14,
          color: Colors.blueGrey,
        ),
      );

  Widget _buildSaveButton(
      BuildContext context, ProfileNotifier prov, ThemeData theme) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: [theme.primaryColor, theme.primaryColor.withBlue(220)],
        ),
        boxShadow: [
          BoxShadow(
            color: theme.primaryColor.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: prov.isLoading ? null : () => prov.submitSave(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
        child: prov.isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                    color: Colors.white, strokeWidth: 2),
              )
            : const Text(
                "SIMPAN PERUBAHAN",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton.icon(
        onPressed: () => _onPressLogout(context),
        icon:
            const Icon(Icons.logout_rounded, color: Colors.redAccent, size: 18),
        label: const Text(
          "KELUAR DARI AKUN",
          style: TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.w900,
            fontSize: 12,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }

  void _showPickerOptions(BuildContext context, ProfileNotifier prov) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (_) => Container(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Ubah Foto Profil",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOption(
                  context,
                  Icons.image_rounded,
                  "Galeri",
                  () => prov.pickImage(ImageSource.gallery),
                ),
                _buildOption(
                  context,
                  Icons.camera_alt_rounded,
                  "Kamera",
                  () => prov.pickImage(ImageSource.camera),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOption(
      BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: Colors.blueGrey),
          ),
          const SizedBox(height: 8),
          Text(label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12))
        ],
      ),
    );
  }

  void _onPressLogout(BuildContext context) async {
    HapticFeedback.mediumImpact();
    bool? confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        title: const Text("Konfirmasi",
            style: TextStyle(fontWeight: FontWeight.w900)),
        content: const Text(
            "Apakah Anda yakin ingin keluar dari aplikasi IBM Presensi?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal", style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child:
                const Text("Ya, Keluar", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await SharedPreferencesHelper.logout();
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => LoginScreen()),
          (route) => false,
        );
      }
    }
  }

  @override
  void checkVariableAfterUi(BuildContext context) {
    final safeAreaTop = MediaQuery.of(context).padding.top;
    final screenWidth = MediaQuery.of(context).size.width;

    if (notifier.isUpdateSuccess) {
      notifier.isUpdateSuccess = false;
      HapticFeedback.lightImpact();
      ElegantNotification.success(
        width: screenWidth * 0.9,
        notificationMargin: safeAreaTop + 10,
        position: Alignment.topCenter,
        animation: AnimationType.fromTop,
        title: const Text("Berhasil",
            style: TextStyle(fontWeight: FontWeight.w900)),
        description: const Text("Profil diperbarui secara lokal & server."),
        showProgressIndicator: false,
        displayCloseButton: false,
        borderRadius: BorderRadius.circular(20),
      ).show(context);
    }

    if (notifier.errorMessage.isNotEmpty) {
      final msg = notifier.errorMessage;
      notifier.errorMessage = "";
      HapticFeedback.vibrate();
      ElegantNotification.error(
        width: screenWidth * 0.9,
        notificationMargin: safeAreaTop + 10,
        position: Alignment.topCenter,
        animation: AnimationType.fromTop,
        title:
            const Text("Gagal", style: TextStyle(fontWeight: FontWeight.w900)),
        description: Text(msg, maxLines: 4, overflow: TextOverflow.ellipsis),
        showProgressIndicator: false,
        borderRadius: BorderRadius.circular(20),
        displayCloseButton: false,
      ).show(context);
    }
  }

  @override
  void checkVariableBeforeUi(BuildContext context) {}

  @override
  AppBar? appBarBuild(BuildContext context) => null;
}

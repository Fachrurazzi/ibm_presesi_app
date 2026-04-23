  import 'dart:io';
  import 'package:cached_network_image/cached_network_image.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter/services.dart';
  import 'package:ibm_presensi_app/app/presentation/common/dashboard/dashboard_notifier.dart';
  import 'package:ibm_presensi_app/app/presentation/common/profile/profile_notifier.dart';
  import 'package:ibm_presensi_app/core/helper/date_time_helper.dart';
  import 'package:ibm_presensi_app/core/helper/global_helper.dart';
  import 'package:ibm_presensi_app/core/widget/app_widget.dart';
  import 'package:image_picker/image_picker.dart';
  import 'package:provider/provider.dart';

  class ProfileScreen extends AppWidget<ProfileNotifier, void, void> {
    ProfileScreen({super.key}) : super(param1: null, param2: null);

    @override
    Widget bodyBuild(BuildContext context) {
      final prov = context.watch<ProfileNotifier>();
      final theme = Theme.of(context);

      return Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  centerTitle: true,
                  title: const Text(
                    "Profil Saya",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                SliverToBoxAdapter(child: _buildHeader(context, prov, theme)),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      const SizedBox(height: 24),
                      _buildInfoCard(context, prov, theme),
                      const SizedBox(height: 24),
                      _buildSaveButton(context, prov, theme),
                      const SizedBox(height: 16),
                      _buildLogoutButton(context, prov),
                      const SizedBox(height: 40),
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
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
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
            _buildAvatarStack(context, prov, theme),
            const SizedBox(height: 16),
            Text(
              prov.userName,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              prov.userPosition,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Bergabung: ${DateTimeHelper.formatString(dateTimeString: prov.joinDate, format: 'dd MMMM yyyy')}",
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
                  color: theme.colorScheme.primary.withOpacity(0.1), width: 4),
            ),
            child: Hero(
              tag: 'avatar_profile_tag',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: SizedBox(
                  width: 110,
                  height: 110,
                  child: _buildImageContent(prov),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => _showPickerOptions(context, prov),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
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

    Widget _buildImageContent(ProfileNotifier prov) {
      if (prov.imageFileLocal != null) {
        return Image.file(prov.imageFileLocal!, fit: BoxFit.cover);
      }

      if (prov.imageUrlServer != null && prov.imageUrlServer!.isNotEmpty) {
        return CachedNetworkImage(
          imageUrl: prov.imageUrlServer!,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            color: Colors.grey.shade100,
            child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
          ),
          errorWidget: (context, url, error) => _buildAvatarError(),
        );
      }

      return _buildAvatarError();
    }

    Widget _buildAvatarError() {
      return Container(
        color: const Color(0xFFF8F9FA),
        child: Icon(Icons.person_rounded, size: 50, color: Colors.grey.shade300),
      );
    }

    Widget _buildInfoCard(
        BuildContext context, ProfileNotifier prov, ThemeData theme) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.grey.shade100),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Informasi Pribadi",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField(
              controller: prov.nameController,
              label: "Nama Lengkap",
              icon: Icons.person_outline_rounded,
              theme: theme,
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            const Text(
              "Sisa Cuti",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.beach_access_rounded,
                      color: Colors.orange),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${prov.user.remainingLeave} hari tersisa",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Total: ${prov.user.leaveQuota} hari",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget _buildTextField({
      required TextEditingController controller,
      required String label,
      required IconData icon,
      required ThemeData theme,
    }) {
      return TextField(
        controller: controller,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          prefixIcon: Icon(icon,
              color: theme.colorScheme.primary.withOpacity(0.7), size: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
          ),
          filled: true,
          fillColor: Colors.grey.shade50,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      );
    }

    Widget _buildSaveButton(
        BuildContext context, ProfileNotifier prov, ThemeData theme) {
      return Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.primary,
              theme.colorScheme.primary.withBlue(220)
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: prov.isLoading ? null : () => prov.submitUpdate(),
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

    Widget _buildLogoutButton(BuildContext context, ProfileNotifier prov) {
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
                  _buildOption(context, Icons.image_rounded, "Galeri",
                      () => prov.pickImage(ImageSource.gallery)),
                  _buildOption(context, Icons.camera_alt_rounded, "Kamera",
                      () => prov.pickImage(ImageSource.camera)),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget _buildOption(
      BuildContext context,
      IconData icon,
      String label,
      VoidCallback onTap,
    ) {
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
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ],
        ),
      );
    }

    void _onPressLogout(BuildContext context) async {
      HapticFeedback.mediumImpact();
      final confirm = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          title: const Text("Konfirmasi",
              style: TextStyle(fontWeight: FontWeight.w900)),
          content: const Text(
              "Apakah Anda yakin ingin keluar dari aplikasi IBM Presensi?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
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

      if (confirm == true && context.mounted) {
        final dashboardNotifier = context.read<DashboardNotifier>();
        await dashboardNotifier.logout(context);
      }
    }

    @override
    void checkVariableAfterUi(BuildContext context) {
      if (notifier.isUpdateSuccess) {
        notifier.clearSuccess();
        HapticFeedback.lightImpact();

        GlobalHelper.showSuccessNotification(
          context: context,
          title: "Berhasil",
          message: "Profil berhasil diperbarui",
        );
      }

      if (notifier.profileError.isNotEmpty) {
        final msg = notifier.profileError;
        notifier.clearError();
        HapticFeedback.vibrate();

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

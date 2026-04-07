import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/presentation/login/login_screen.dart';
import 'package:ibm_presensi_app/core/helper/date_time_helper.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ibm_presensi_app/app/presentation/profile/profile_notifier.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends AppWidget<ProfileNotifier, void, void> {
  ProfileScreen({super.key});

  @override
  Widget bodyBuild(BuildContext context) {
    final prov = context.watch<ProfileNotifier>();
    // Ambil tinggi layar untuk penyesuaian jarak
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Pengaturan Profil",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02), // Jarak dinamis
            _buildAvatarHeader(context, prov),
            SizedBox(height: screenHeight * 0.03), // Jarak dinamis
            _buildSectionHeader("Informasi Pribadi"),
            const SizedBox(height: 16),
            _buildCustomField(
              controller: prov.nameController,
              label: "Nama Lengkap",
              icon: Icons.person_rounded,
            ),
            SizedBox(height: screenHeight * 0.025),
            _buildSectionHeader("Keamanan Akun"),
            const SizedBox(height: 16),
            _buildCustomField(
              controller: prov.oldPassController,
              label: "Password Lama",
              icon: Icons.lock_rounded,
              isPass: true,
              obscure: prov.obscureOld,
              onToggle: () => prov.toggleObscureOld(),
              hint: "Isi jika ingin ganti password",
            ),
            const SizedBox(height: 16),
            _buildCustomField(
              controller: prov.newPassController,
              label: "Password Baru",
              icon: Icons.vpn_key_rounded,
              isPass: true,
              obscure: prov.obscureNew,
              onToggle: () => prov.toggleObscureNew(),
              hint: "Minimal 6 karakter",
            ),
            SizedBox(height: screenHeight * 0.04),
            _buildSaveButton(context, prov),

            const SizedBox(height: 12),
            TextButton.icon(
              onPressed: () => _onPressLogout(context),
              icon: const Icon(Icons.logout_rounded,
                  color: Colors.redAccent, size: 18),
              label: const Text("Keluar dari Akun",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 13)),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarHeader(BuildContext context, ProfileNotifier prov) {
    final theme = Theme.of(context);
    // Ukuran avatar menyesuaikan lebar layar agar tidak terlalu dominan di HP kecil
    double avatarSize = MediaQuery.of(context).size.width * 0.28;
    avatarSize = avatarSize.clamp(50, 60); // Tetap di kisaran radius 50-60

    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: theme.colorScheme.primary.withOpacity(0.15),
                    width: 2),
              ),
              child: CircleAvatar(
                key: ValueKey(prov.imageFileLocal?.path ?? prov.imageUrlServer),
                radius: avatarSize,
                backgroundColor: Colors.grey.shade100,
                backgroundImage: prov.imageFileLocal != null
                    ? FileImage(prov.imageFileLocal!)
                    : null,
                child: prov.imageFileLocal == null
                    ? ClipOval(
                        child: (prov.imageUrlServer != null &&
                                prov.imageUrlServer!.isNotEmpty)
                            ? CachedNetworkImage(
                                imageUrl: prov.imageUrlServer!,
                                fit: BoxFit.cover,
                                width: avatarSize * 2,
                                height: avatarSize * 2,
                                placeholder: (context, url) => const Center(
                                  child:
                                      CircularProgressIndicator(strokeWidth: 2),
                                ),
                                errorWidget: (context, url, error) =>
                                    _buildPlaceholderIcon(),
                              )
                            : _buildPlaceholderIcon(),
                      )
                    : null,
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
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2))
                    ]),
                child: const Icon(
                    Icons
                        .camera_alt_rounded, // Pakai icon kamera lebih intuitif
                    color: Colors.white,
                    size: 16),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        FittedBox(
          // Mencegah nama jabatan overflow
          fit: BoxFit.scaleDown,
          child: Text(prov.position,
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: theme.colorScheme.primary,
                  fontSize: 15)),
        ),
        const SizedBox(height: 2),
        _buildFormattedJoinDate(prov.joinDate),
      ],
    );
  }

// Widget Helper untuk Placeholder
  Widget _buildPlaceholderIcon() {
    return Container(
      width: 120,
      height: 120,
      color: Colors.grey.shade100,
      child: Icon(Icons.person, size: 60, color: Colors.grey.shade400),
    );
  }

  Widget _buildCustomField(
      {required TextEditingController controller,
      required String label,
      required IconData icon,
      bool isPass = false,
      bool obscure = false,
      VoidCallback? onToggle,
      String? hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isPass ? obscure : false,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, size: 20),
            suffixIcon: isPass
                ? IconButton(
                    icon: Icon(
                        obscure ? Icons.visibility_off : Icons.visibility,
                        size: 20),
                    onPressed: onToggle)
                : null,
            filled: true,
            fillColor: Colors.grey.shade50,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }

  Widget _buildFormattedJoinDate(String joinDate) {
    String display = "-";
    if (joinDate != '-' && joinDate.isNotEmpty) {
      final date = DateTime.tryParse(joinDate);
      if (date != null) {
        display = DateTimeHelper.formatDateTime(
            dateTime: date, format: 'dd MMMM yyyy');
      }
    }
    return Text("Bergabung sejak: $display",
        style: const TextStyle(fontSize: 12, color: Colors.grey));
  }

  void _showPickerOptions(BuildContext context, ProfileNotifier prov) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (_) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Ubah Foto Profil",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPickerBtn(context, Icons.photo_library_rounded, "Galeri",
                    () => prov.pickImage(ImageSource.gallery)),
                _buildPickerBtn(context, Icons.camera_alt_rounded, "Kamera",
                    () => prov.pickImage(ImageSource.camera)),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildPickerBtn(
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
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                shape: BoxShape.circle),
            child: Icon(icon, color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(height: 8),
          Text(label,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(title,
            style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 15)));
  }

  Widget _buildSaveButton(BuildContext context, ProfileNotifier prov) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: prov.isLoading ? null : () => prov.submitSave(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          elevation: 0,
        ),
        child: prov.isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                    color: Colors.white, strokeWidth: 2))
            : const Text("Simpan Perubahan",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
      ),
    );
  }

  void _onPressLogout(BuildContext context) async {
    bool? confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text("Konfirmasi"),
        content: const Text("Apakah Anda yakin ingin keluar?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal")),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text("Ya, Keluar",
                  style: TextStyle(color: Colors.red))),
        ],
      ),
    );

    if (confirm == true) {
      await SharedPreferencesHelper.logout();
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false);
      }
    }
  }

  @override
  void checkVariableAfterUi(BuildContext context) {
    if (notifier.snackbarMessage.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(notifier.snackbarMessage),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating));
      notifier.snackbarMessage = "";
      Future.delayed(const Duration(milliseconds: 1500), () {
        if (context.mounted) Navigator.pop(context);
      });
    }
    if (notifier.errorMessage.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(notifier.errorMessage),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating));
      notifier.errorMessage = "";
    }
  }

  @override
  void checkVariableBeforeUi(BuildContext context) {
    // KUNCI: Refresh data setiap kali masuk layar profil agar sinkron dengan SharedPreferences
    Future.microtask(() => notifier.init());
  }

  @override
  AppBar? appBarBuild(BuildContext context) => null;
}

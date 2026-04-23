import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibm_presensi_app/app/module/entity/user.dart';
import 'package:ibm_presensi_app/app/presentation/admin/user_management/user_management_notifier.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class UserManagementScreen
    extends AppWidget<UserManagementNotifier, void, void> {
  UserManagementScreen({super.key}) : super(param1: null, param2: null);

  @override
  Widget bodyBuild(BuildContext context) {
    final prov = context.watch<UserManagementNotifier>();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text("Kelola User",
            style: TextStyle(fontWeight: FontWeight.w900)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Cari user...",
                prefixIcon: const Icon(Icons.search_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: prov.search,
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: prov.refresh,
              child: prov.isLoading
                  ? _buildShimmerList()
                  : prov.users.isEmpty
                      ? _buildEmptyState()
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: prov.users.length,
                          itemBuilder: (context, index) => _buildUserCard(
                              context, prov.users[index], prov, theme),
                        ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddEditDialog(context, null, prov),
        child: const Icon(Icons.add_rounded),
      ),
    );
  }

  Widget _buildUserCard(BuildContext context, UserEntity user,
      UserManagementNotifier prov, ThemeData theme) {
    final avatarUrl = user.imageUrl ?? user.image ?? '';
    final displayName = user.name.isNotEmpty ? user.name : 'Karyawan';
    final displayPosition = user.positionName ?? user.position?.name ?? 'Staff';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage:
                avatarUrl.isNotEmpty ? NetworkImage(avatarUrl) : null,
            child: avatarUrl.isEmpty ? const Icon(Icons.person_rounded) : null,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  displayName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  user.email,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    displayPosition,
                    style: TextStyle(
                        fontSize: 10, color: theme.colorScheme.primary),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit_rounded, color: Colors.blue),
                onPressed: () => _showAddEditDialog(context, user, prov),
              ),
              IconButton(
                icon: const Icon(Icons.delete_rounded, color: Colors.red),
                onPressed: () => _showDeleteDialog(context, user, prov),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 8,
      itemBuilder: (_, __) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
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
              size: 80, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          const Text(
            "Belum Ada User",
            style:
                TextStyle(fontWeight: FontWeight.w900, color: Colors.blueGrey),
          ),
          const Text(
            "Tap + untuk menambah user",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  void _showAddEditDialog(
      BuildContext context, UserEntity? user, UserManagementNotifier prov) {
    final nameController = TextEditingController(text: user?.name ?? "");
    final emailController = TextEditingController(text: user?.email ?? "");

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(user == null ? "Tambah User" : "Edit User"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Nama"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (user == null) {
                // Create new user (placeholder - implement actual API call)
                prov.addUser(
                  UserEntity(
                    id: DateTime.now().millisecondsSinceEpoch,
                    name: nameController.text,
                    email: emailController.text,
                  ),
                );
              } else {
                // Update existing user
                prov.updateUser(
                  user.copyWith(
                    name: nameController.text,
                    email: emailController.text,
                  ),
                );
              }
            },
            child: const Text("Simpan"),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(
      BuildContext context, UserEntity user, UserManagementNotifier prov) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Hapus User"),
        content: Text("Hapus ${user.name}?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              prov.deleteUser(user.id);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text("Hapus"),
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

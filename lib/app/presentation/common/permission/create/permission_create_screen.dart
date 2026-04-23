import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ibm_presensi_app/app/presentation/common/permission/create/permission_create_notifier.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';

class PermissionCreateScreen
    extends AppWidget<PermissionCreateNotifier, void, void> {
  PermissionCreateScreen({super.key}) : super(param1: null, param2: null);

  @override
  Widget bodyBuild(BuildContext context) {
    final prov = context.watch<PermissionCreateNotifier>();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
          title: const Text("Ajukan Izin",
              style: TextStyle(fontWeight: FontWeight.w900)),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: const Icon(Icons.close_rounded),
              onPressed: () => Navigator.pop(context))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(24)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _buildTypeSelector(prov, theme),
              const SizedBox(height: 20),
              _buildDateField(context, prov),
              const SizedBox(height: 20),
              _buildReasonField(prov),
              const SizedBox(height: 20),
              _buildImagePicker(context, prov, theme),
              const SizedBox(height: 32),
              _buildSubmitButton(context, prov, theme),
            ])),
      ),
    );
  }

  Widget _buildTypeSelector(PermissionCreateNotifier prov, ThemeData theme) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text("Tipe Izin",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
      const SizedBox(height: 12),
      Wrap(
          spacing: 8,
          runSpacing: 8,
          children: prov.types
              .map((type) => ChoiceChip(
                  label: Text(type.label),
                  selected: prov.selectedType?.value == type.value,
                  onSelected: (_) => prov.selectType(type),
                  selectedColor: theme.colorScheme.primary.withOpacity(0.2)))
              .toList()),
    ]);
  }

  Widget _buildDateField(BuildContext context, PermissionCreateNotifier prov) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text("Tanggal Izin",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
      const SizedBox(height: 8),
      InkWell(
        onTap: () => prov.selectDate(context),
        child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200)),
            child: Row(children: [
              const Icon(Icons.calendar_today_rounded, color: Colors.grey),
              const SizedBox(width: 12),
              Text(
                  prov.dateController.text.isEmpty
                      ? "Pilih tanggal"
                      : prov.dateController.text,
                  style: TextStyle(
                      color: prov.dateController.text.isEmpty
                          ? Colors.grey
                          : Colors.black87,
                      fontWeight: FontWeight.w500))
            ])),
      ),
    ]);
  }

  Widget _buildReasonField(PermissionCreateNotifier prov) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text("Alasan Izin",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
      const SizedBox(height: 8),
      TextField(
          controller: prov.reasonController,
          maxLines: 4,
          decoration: InputDecoration(
              hintText: "Tuliskan alasan pengajuan izin...",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              filled: true,
              fillColor: Colors.grey.shade50),
          onChanged: (_) => prov.notifyListeners()),
    ]);
  }

  Widget _buildImagePicker(
      BuildContext context, PermissionCreateNotifier prov, ThemeData theme) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text("Bukti Pendukung (Opsional)",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
      const SizedBox(height: 12),
      if (prov.imageFile != null)
        Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.file(prov.imageFile!,
                    height: 150, width: double.infinity, fit: BoxFit.cover)),
            Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                    onPressed: () => prov.removeImage(),
                    icon: const Icon(Icons.close_rounded, color: Colors.white),
                    style:
                        IconButton.styleFrom(backgroundColor: Colors.black54))),
          ],
        )
      else
        Row(children: [
          Expanded(
              child: OutlinedButton.icon(
                  onPressed: () => _showPickerOptions(context, prov),
                  icon: const Icon(Icons.image_rounded),
                  label: const Text("Pilih Gambar"),
                  style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))))),
        ]),
    ]);
  }

  Widget _buildSubmitButton(
      BuildContext context, PermissionCreateNotifier prov, ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: prov.isLoading ? null : () => prov.submit(),
        style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        child: prov.isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text("KIRIM PENGAJUAN",
                style: TextStyle(
                    fontWeight: FontWeight.w900, color: Colors.white)),
      ),
    );
  }

  void _showPickerOptions(BuildContext context, PermissionCreateNotifier prov) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
        ListTile(
            leading: const Icon(Icons.photo_library_rounded),
            title: const Text("Galeri"),
            onTap: () {
              Navigator.pop(context);
              prov.pickImage(ImageSource.gallery);
            }),
        ListTile(
            leading: const Icon(Icons.camera_alt_rounded),
            title: const Text("Kamera"),
            onTap: () {
              Navigator.pop(context);
              prov.pickImage(ImageSource.camera);
            }),
      ])),
    );
  }

  @override
  void checkVariableAfterUi(BuildContext context) {
    if (notifier.isSuccess) {
      notifier.clearSuccess();
      GlobalHelper.showSuccessNotification(
          context: context,
          title: "Berhasil",
          message: "Pengajuan izin telah terkirim");
      Navigator.pop(context);
    }
    if (notifier.errorMessage.isNotEmpty) {
      final msg = notifier.errorMessage;
      notifier.clearError();
      GlobalHelper.showErrorNotification(
          context: context, title: "Gagal", message: msg);
    }
  }

  @override
  void checkVariableBeforeUi(BuildContext context) {}

  @override
  AppBar? appBarBuild(BuildContext context) => null;
}

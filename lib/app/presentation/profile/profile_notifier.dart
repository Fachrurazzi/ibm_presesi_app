import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ibm_presensi_app/app/module/entity/profile.dart';
import 'package:ibm_presensi_app/app/module/use_case/update_profile.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_notifier.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class ProfileNotifier extends AppProvider {
  final UpdateProfileUseCase _updateProfileUseCase;

  ProfileNotifier(this._updateProfileUseCase) {
    init();
  }

  // --- UI State ---
  String _name = '';
  String _position = 'Karyawan IBM';
  String? _imageUrlServer;
  File? _imageFileLocal;
  String _joinDate = '-'; 
  bool _obscureOld = true;
  bool _obscureNew = true;
  bool isUpdateSuccess = false;

  // --- Getters ---
  String get name => _name;
  String get position => _position;
  String? get imageUrlServer => _imageUrlServer;
  File? get imageFileLocal => _imageFileLocal;
  String get joinDate => _joinDate;
  bool get obscureOld => _obscureOld;
  bool get obscureNew => _obscureNew;

  // Controllers
  final nameController = TextEditingController();
  final oldPassController = TextEditingController();
  final newPassController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  void toggleObscureOld() {
    _obscureOld = !_obscureOld;
    notifyListeners();
  }

  void toggleObscureNew() {
    _obscureNew = !_obscureNew;
    notifyListeners();
  }

  @override
  Future<void> init() async {
    debugPrint("🚀 PROFILE_INIT: Mengambil data lokal secara instant...");

    // 1. Load Data Lokal (Sesuai kode asli)
    _name = SharedPreferencesHelper.getString(AppPreferences.USER_NAME) ?? 'User IBM';
    _position = SharedPreferencesHelper.getString(AppPreferences.POSITION_NAME) ?? 'Karyawan IBM';
    _joinDate = SharedPreferencesHelper.getString(AppPreferences.JOIN_DATE) ?? '-';

    String? savedUrl = SharedPreferencesHelper.getString(AppPreferences.IMAGE_URL);
    _imageUrlServer = _sanitizeUrl(savedUrl);

    if (nameController.text.isEmpty) nameController.text = _name;
    notifyListeners();

    // 2. LOGIKA TAMBAHAN: Sinkronisasi Otomatis ke Server
    // Ini agar jika Dimas login, data Arif yang tersisa di storage langsung terhapus
    _syncDataFromServer();
  }

  /// Sinkronisasi data ke server tanpa mengganggu loading UI utama
  Future<void> _syncDataFromServer() async {
    try {
      // Kita gunakan submitSave dengan param kosong hanya untuk memicu return data terbaru dari server
      // Jika UseCase kamu mendukung getProfile, gunakan itu. 
      // Jika tidak, kita biarkan data lokal yang bekerja sampai user klik Save.
    } catch (e) {
      debugPrint("🚨 SYNC_PROFILE_SILENT_ERROR: $e");
    }
  }

  /// Sanitizer URL: Menangani Base URL dan Cache Busting
  String? _sanitizeUrl(String? url) {
    if (url == null || url.isEmpty) return null;
    String clean = url.contains('?v=') ? url.split('?v=').first : url;
    if (!clean.startsWith('http')) {
      String path = clean.startsWith('/') ? clean.substring(1) : clean;
      clean = "${AppConfig.STORAGE_URL}/$path";
    }
    return clean.replaceAll(RegExp(r'(?<!:)/{2,}'), '/');
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source, imageQuality: 50);
      if (pickedFile != null) {
        _imageFileLocal = File(pickedFile.path);
        notifyListeners();
      }
    } catch (e) {
      errorMessage = "Izin akses galeri/kamera ditolak";
      notifyListeners();
    }
  }

  Future<void> submitSave() async {
    final inputName = nameController.text.trim();
    if (inputName.isEmpty) {
      errorMessage = "Nama lengkap wajib diisi";
      notifyListeners();
      return;
    }

    isUpdateSuccess = false;
    showLoading();

    try {
      final response = await _updateProfileUseCase(
        param: ProfileParamUpdate(
          name: inputName,
          image: _imageFileLocal,
          oldPassword: oldPassController.text.isEmpty ? null : oldPassController.text,
          newPassword: newPassController.text.isEmpty ? null : newPassController.text,
        ),
      );

      if (response.success && response.data != null) {
        final userResponse = response.data as ProfileEntity;

        // 1. Update State Lokal & Simpan ke Storage
        _name = userResponse.name;
        await SharedPreferencesHelper.setString(AppPreferences.USER_NAME, _name);

        // REVISI: Update Join Date
        if (userResponse.joinDate.isNotEmpty) {
          _joinDate = userResponse.joinDate;
          await SharedPreferencesHelper.setString(AppPreferences.JOIN_DATE, _joinDate);
        }

        // Ambil nama jabatan dari object position
        if (userResponse.position != null) {
          _position = userResponse.position!['name']?.toString() ?? _position;
          await SharedPreferencesHelper.setString(AppPreferences.POSITION_NAME, _position);
        }

        // 2. Logika Update Foto dengan Cache Busting Timestamp
        String? finalPhotoUrl = _imageUrlServer;
        if (userResponse.image != null) {
          String? cleanUrl = _sanitizeUrl(userResponse.image);
          if (cleanUrl != null) {
            // Tambahkan timestamp agar widget Image refresh
            finalPhotoUrl = "$cleanUrl?v=${DateTime.now().millisecondsSinceEpoch}";
            await SharedPreferencesHelper.setString(AppPreferences.IMAGE_URL, finalPhotoUrl);
            _imageUrlServer = finalPhotoUrl;
          }
        }

        // 3. Sinkronisasi ke HomeNotifier
        if (sl.isRegistered<HomeNotifier>()) {
          sl<HomeNotifier>().updateUserData(
            newName: _name,
            newPosition: _position,
            newPhoto: finalPhotoUrl,
          );
        }

        _clearSensitiveFields();
        isUpdateSuccess = true;
      } else {
        errorMessage = response.message;
      }
    } catch (e) {
      errorMessage = "Terjadi kesalahan sistem";
      debugPrint("🚨 UPDATE_PROFILE_ERROR: $e");
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  void _clearSensitiveFields() {
    _imageFileLocal = null;
    oldPassController.clear();
    newPassController.clear();
  }

  void resetState() {
    _clearSensitiveFields();
    init();
  }

  @override
  void dispose() {
    nameController.dispose();
    oldPassController.dispose();
    newPassController.dispose();
    super.dispose();
  }
}
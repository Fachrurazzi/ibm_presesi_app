import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_face_api/flutter_face_api.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ibm_presensi_app/app/module/use_case/photo_get_bytes.dart';
import 'package:ibm_presensi_app/app/module/use_case/photo_upload.dart'; // Import UseCase Upload
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class FaceRecognitionNotifier extends AppProvider {
  final PhotoGetBytesUseCase _photoGetBytesUseCase;
  final PhotoUploadUseCase _photoUploadUseCase; // Tambahkan UseCase Upload

  // Update Constructor
  FaceRecognitionNotifier(
      this._photoGetBytesUseCase, this._photoUploadUseCase) {
    init();
  }

  final FaceSDK _faceSDK = FaceSDK.instance;
  MatchFacesImage? mfImage1;
  MatchFacesImage? mfImage2;
  Image? _currentImage; // Foto dari hasil tangkapan kamera
  Image? _basePhotoWidget; // Foto dari database (API) untuk dipajang di layar
  double _percentMatch = 0.0;

  // PENANDA MODE PENDAFTARAN WAJAH
  bool _isRegistrationMode = false;

  Image? get currentImage => _currentImage;
  Image? get basePhotoWidget => _basePhotoWidget;
  double get percentMatch => _percentMatch;
  bool get isRegistrationMode => _isRegistrationMode; // Getter mode daftar

  @override
  Future<void> init() async {
    try {
      await _faceSDK.initialize(config: null);
      await _getBasePhoto();

      // Jika tidak ada error dan BUKAN mode daftar, langsung buka kamera
      if (errorMessage.isEmpty && !_isRegistrationMode) {
        getCurrentPhoto();
      }
    } catch (e) {
      errorMessage = "Gagal inisialisasi Face SDK: $e";
      notifyListeners();
    }
  }

  Future<void> _getBasePhoto() async {
    showLoading();

    final response = await _photoGetBytesUseCase();
    // Pastikan data tidak null sebelum diproses
    if (response.success && response.data != null) {
      _setImage(response.data!, ImageType.PRINTED, 1);
    } else {
      // Cek apakah error karena foto belum diatur di database
      if (response.message.toLowerCase().contains('belum diatur')) {
        _isRegistrationMode = true; // Aktifkan mode pendaftaran
        errorMessage = ''; // Kosongkan error agar UI tidak nampilin pesan merah
      } else {
        errorMessage = response.message;
      }
    }

    hideLoading();
  }

  void _setImage(Uint8List bytes, ImageType type, int flag) {
    final mdImage = MatchFacesImage(bytes, type);

    if (flag == 1) {
      mfImage1 = mdImage;
      _basePhotoWidget = Image.memory(bytes);
    } else {
      mfImage2 = mdImage;
      _currentImage = Image.memory(bytes);
    }
  }

  Future<void> getCurrentPhoto() async {
    // Reset state sebelum buka kamera agar UI kembali bersih
    _currentImage = null;
    _percentMatch = 0.0;
    notifyListeners();

    final response = await _faceSDK.startFaceCapture();
    final image = response.image;

    // Pastikan image dan bytes-nya benar-benar ada
    if (image != null) {
      // Gunakan ImageType.LIVE untuk mencegah kecurangan (spoofing)
      _setImage(image.image, ImageType.LIVE, 2);
    }

    if (_currentImage != null) {
      // CEK MODE: Jika sedang daftar, upload foto. Jika tidak, cocokkan wajah.
      if (_isRegistrationMode) {
        await _uploadFace(image!.image);
      } else {
        await _matchFaces();
      }
    } else {
      // Jika user menekan tombol 'Back' dan batal mengambil foto
      notifyListeners();
    }
  }

  // FUNGSI BARU: Upload Wajah ke Laravel
  Future<void> _uploadFace(Uint8List bytes) async {
    showLoading();

    // Ubah Uint8List menjadi File fisik sementara di HP agar bisa dikirim via API
    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/face_register.jpg').create();
    file.writeAsBytesSync(bytes);

    final response = await _photoUploadUseCase(param: file);

    if (response.success) {
      // Set 100% agar UI menganggap sukses dan otomatis pindah ke MapScreen
      _percentMatch = 100.0;
      snackbarMessage = "Wajah berhasil didaftarkan!";
    } else {
      _percentMatch = -1.0;
      snackbarMessage = response.message;
    }

    hideLoading();
  }

  Future<void> _matchFaces() async {
    // Safety check: Jangan lanjut jika salah satu gambar kosong
    if (mfImage1 == null || mfImage2 == null) {
      _percentMatch = -1.0;
      notifyListeners();
      return;
    }

    showLoading();
    _percentMatch = 0.0;

    final request = MatchFacesRequest([mfImage1!, mfImage2!]);
    final response = await _faceSDK.matchFaces(request);

    // Pastikan response tidak error (masalah server SDK)
    if (response.error != null) {
      errorMessage = "Gagal memproses wajah: ${response.error!.message}";
      _percentMatch = -1.0;
    } else {
      final split = await _faceSDK.splitComparedFaces(response.results, 0.75);
      final match = split.matchedFaces;

      if (match.isNotEmpty) {
        // Pembulatan agar tampilan di UI tidak terlalu panjang desimalnya
        _percentMatch =
            double.parse((match[0].similarity * 100).toStringAsFixed(2));
      } else {
        _percentMatch = -1.0;
      }
    }

    hideLoading();
  }
}

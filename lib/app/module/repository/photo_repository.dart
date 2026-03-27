import 'dart:io';
import 'dart:typed_data'; // Tambahkan ini untuk Uint8List
import 'package:ibm_presensi_app/core/network/data_state.dart';

abstract class PhotoRepository {
  // 1. Ambil URL Foto (Kembalian String URL)
  Future<DataState<String>> get();

  // 2. Ambil data gambar dalam bentuk Bytes (Biasanya untuk diolah atau di-cache)
  // TIPS: Ganti dynamic menjadi Uint8List agar lebih spesifik dan aman (Type-Safe)
  Future<DataState<Uint8List>> getBytes(String url);

  // 3. Upload file foto ke server Laravel
  // TIPS: Tambahkan tipe kembalian String (URL hasil upload) atau bool
  Future<DataState<String>> upload(File image);
}

import 'dart:io';

import 'package:ibm_presensi_app/core/network/data_state.dart';

abstract class PhotoRepository {
  Future<DataState<String>> get();
  Future<DataState<dynamic>> getBytes(String url);
  Future<DataState> upload(File image);
}

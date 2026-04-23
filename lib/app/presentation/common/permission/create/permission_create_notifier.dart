import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ibm_presensi_app/app/module/entity/permission.dart';
import 'package:ibm_presensi_app/app/module/use_case/permission_create_use_case.dart';
import 'package:ibm_presensi_app/app/module/use_case/permission_get_types_use_case.dart';
import 'package:ibm_presensi_app/app/presentation/common/dashboard/dashboard_notifier.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';
import 'package:intl/intl.dart';

class PermissionCreateNotifier extends AppProvider {
  final PermissionCreateUseCase _createUseCase;
  final PermissionGetTypesUseCase _getTypesUseCase;

  PermissionCreateNotifier(this._createUseCase, this._getTypesUseCase) {
    init();
  }

  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;

  String _errorMessage = "";
  @override
  String get errorMessage => _errorMessage;

  List<PermissionType> _types = [];
  List<PermissionType> get types => _types;

  PermissionType? _selectedType;
  PermissionType? get selectedType => _selectedType;

  final dateController = TextEditingController();
  final reasonController = TextEditingController();
  File? _imageFile;
  File? get imageFile => _imageFile;

  final ImagePicker _picker = ImagePicker();

  @override
  Future<void> init() async {
    await _loadTypes();
  }

  Future<void> _loadTypes() async {
    final result = await _getTypesUseCase(const NoParams());
    if (result is SuccessState<List<PermissionType>>) {
      _types = result.data ?? [];
      if (_types.isNotEmpty) _selectedType = _types.first;
    }
    notifyListeners();
  }

  void selectType(PermissionType? type) {
    _selectedType = type;
    notifyListeners();
  }

  Future<void> selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null) {
      dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      notifyListeners();
    }
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final picked = await _picker.pickImage(source: source, imageQuality: 70);
      if (picked != null) {
        _imageFile = File(picked.path);
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = "Gagal mengambil gambar";
      notifyListeners();
    }
  }

  void removeImage() {
    _imageFile = null;
    notifyListeners();
  }

  Future<void> submit() async {
    final date = dateController.text;
    final reason = reasonController.text.trim();

    _errorMessage = "";
    if (!_validate(date, reason)) return;

    showLoading();
    _isSuccess = false;

    final params = PermissionCreateParams(
      type: _selectedType?.value ?? 'LATE',
      date: date,
      reason: reason,
      imagePath: _imageFile?.path,
    );

    final result = await _createUseCase(params);

    if (result is SuccessState<PermissionEntity>) {
      if (sl.isRegistered<DashboardNotifier>())
        await sl<DashboardNotifier>().refreshAll();
      _isSuccess = true;
    } else {
      _errorMessage = result.message;
    }

    hideLoading();
    notifyListeners();
  }

  bool _validate(String date, String reason) {
    if (_selectedType == null) {
      _errorMessage = "Pilih tipe izin";
      notifyListeners();
      return false;
    }
    if (date.isEmpty) {
      _errorMessage = "Pilih tanggal izin";
      notifyListeners();
      return false;
    }
    if (reason.length < 10) {
      _errorMessage = "Alasan minimal 10 karakter";
      notifyListeners();
      return false;
    }
    return true;
  }

  @override
  void clearError() => setError("");
  void clearSuccess() => _isSuccess = false;

  @override
  void dispose() {
    dateController.dispose();
    reasonController.dispose();
    super.dispose();
  }
}

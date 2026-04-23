import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/user.dart';
import 'package:ibm_presensi_app/app/module/use_case/user_get_profile_use_case.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class UserManagementNotifier extends AppProvider {
  final UserGetProfileUseCase _getProfileUseCase;

  UserManagementNotifier(this._getProfileUseCase) {
    init();
  }

  List<UserEntity> _users = [];
  List<UserEntity> get users => _users;

  String _searchQuery = "";
  String get searchQuery => _searchQuery;

  @override
  Future<void> init() async {
    await loadUsers();
  }

  Future<void> loadUsers() async {
    showLoading();
    // TODO: Replace with actual get all users use case
    // final result = await _getAllUsersUseCase(const NoParams());
    // For now, simulate empty list
    await Future.delayed(const Duration(milliseconds: 500));
    _users = [];
    hideLoading();
    notifyListeners();
  }

  void search(String query) {
    _searchQuery = query;
    loadUsers();
    notifyListeners();
  }

  Future<void> addUser(UserEntity user) async {
    showLoading();
    // TODO: Implement create user
    await Future.delayed(const Duration(seconds: 1));
    _users.add(user);
    hideLoading();
    notifyListeners();
  }

  Future<void> updateUser(UserEntity user) async {
    showLoading();
    // TODO: Implement update user
    await Future.delayed(const Duration(seconds: 1));
    final index = _users.indexWhere((u) => u.id == user.id);
    if (index != -1) _users[index] = user;
    hideLoading();
    notifyListeners();
  }

  Future<void> deleteUser(int id) async {
    showLoading();
    // TODO: Implement delete user
    await Future.delayed(const Duration(seconds: 1));
    _users.removeWhere((u) => u.id == id);
    hideLoading();
    notifyListeners();
  }

  Future<void> refresh() => loadUsers();
  @override
  void clearError() => setError("");
}

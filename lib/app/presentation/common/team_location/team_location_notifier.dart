import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:ibm_presensi_app/app/module/entity/user_location.dart';
import 'package:ibm_presensi_app/app/module/use_case/get_user_locations_use_case.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class TeamLocationNotifier extends AppProvider {
  final GetAllUserLocationsUseCase _getAllLocationsUseCase;
  final GetTeamLocationsUseCase _getTeamLocationsUseCase;
  final bool _isAdmin;

  TeamLocationNotifier(
    this._getAllLocationsUseCase,
    this._getTeamLocationsUseCase,
    this._isAdmin,
  ) {
    init();
  }

  List<UserLocation> _users = [];
  List<UserLocation> get users => _users;

  UserLocation? _selectedUser;
  UserLocation? get selectedUser => _selectedUser;

  String _searchQuery = "";
  String get searchQuery => _searchQuery;

  List<UserLocation> get filteredUsers {
    if (_searchQuery.isEmpty) return _users;
    return _users
        .where((u) => u.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  final MapController mapController = MapController(
    initPosition: GeoPoint(latitude: -3.327125, longitude: 114.592480),
  );

  Timer? _refreshTimer;

  @override
  Future<void> init() async {
    await loadLocations();
    _startAutoRefresh();
  }

  Future<void> loadLocations() async {
    final result = _isAdmin
        ? await _getAllLocationsUseCase(const NoParams())
        : await _getTeamLocationsUseCase(const NoParams());

    if (result is SuccessState<List<UserLocation>>) {
      _users = result.data ?? [];

      // Pindah ke user pertama yang punya lokasi
      if (_selectedUser == null && _users.isNotEmpty) {
        _selectedUser =
            _users.firstWhere((u) => u.hasLocation, orElse: () => _users.first);
        await _goToSelectedUser();
      }
    } else {
      setError(result.message);
    }
    notifyListeners();
  }

  void selectUser(UserLocation user) async {
    _selectedUser = user;
    await _goToSelectedUser();
    notifyListeners();
  }

  Future<void> _goToSelectedUser() async {
    if (_selectedUser?.hasLocation == true) {
      await mapController.goToLocation(
        GeoPoint(
          latitude: _selectedUser!.lastLatitude!,
          longitude: _selectedUser!.lastLongitude!,
        ),
      );
    }
  }

  void search(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void _startAutoRefresh() {
    _refreshTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      loadLocations();
    });
  }

  Future<void> refresh() => loadLocations();

  @override
  void clearError() => setError("");

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }
}

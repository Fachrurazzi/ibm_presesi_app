import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/presentation/navbar/admin_navbar.dart';
import 'package:ibm_presensi_app/app/presentation/navbar/manager_navbar.dart';
import 'package:ibm_presensi_app/app/presentation/navbar/user_navbar.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';

class NavbarRouter {
  /// Determine which navbar to show based on user role
  static Widget getNavbarByRole() {
    final session = SharedPreferencesHelper.getUserSession();

    if (session == null) {
      return const SizedBox.shrink();
    }

    if (session.isAdmin) {
      return const AdminNavbar();
    }

    if (session.isManager) {
      return const ManagerNavbar();
    }

    // Default: User navbar
    return const UserNavbar();
  }

  /// Get home route based on role
  static String getHomeRoute() {
    final session = SharedPreferencesHelper.getUserSession();

    if (session == null) {
      return '/login';
    }

    if (session.isAdmin) {
      return '/admin-navbar';
    }

    if (session.isManager) {
      return '/manager-navbar';
    }

    return '/user-navbar';
  }

  /// Check if user has access to specific feature
  static bool canAccess(String feature) {
    final session = SharedPreferencesHelper.getUserSession();
    if (session == null) return false;
    return session.can(feature);
  }

  /// Get role display name
  static String getRoleDisplay() {
    final session = SharedPreferencesHelper.getUserSession();
    if (session == null) return '';
    return session.roleDisplay;
  }

  /// Check if current user is Admin
  static bool get isAdmin {
    final session = SharedPreferencesHelper.getUserSession();
    return session?.isAdmin ?? false;
  }

  /// Check if current user is Manager
  static bool get isManager {
    final session = SharedPreferencesHelper.getUserSession();
    return session?.isManager ?? false;
  }

  /// Check if current user is regular User
  static bool get isUser {
    final session = SharedPreferencesHelper.getUserSession();
    return session?.isUser ?? true;
  }
}

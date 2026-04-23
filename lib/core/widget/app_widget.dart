import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/dialog_helper.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:ibm_presensi_app/core/widget/error_app_widget.dart';
import 'package:ibm_presensi_app/core/widget/loading_app_widget.dart';
import 'package:provider/provider.dart';

abstract class AppWidget<T extends AppProvider, P1, P2>
    extends StatelessWidget {
  AppWidget({super.key, this.param1, this.param2});

  final P1? param1;
  final P2? param2;

  T? _notifier;
  T get notifier => _notifier!;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final instance = sl<T>(param1: param1, param2: param2);

    if (!instance.isInitialized && !instance.isDispose) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!instance.isDispose) {
          instance.init();
        }
      });
    }

    return ChangeNotifierProvider<T>.value(
      value: instance,
      child: Consumer<T>(
        builder: (context, value, child) {
          _notifier = value;

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted && !notifier.isDispose) {
              _handleSnackbar(context);
              checkVariableAfterUi(context);
            }
          });

          return _layout(context);
        },
      ),
    );
  }

  void _handleSnackbar(BuildContext context) {
    if (notifier.snackbarMessage.isNotEmpty) {
      DialogHelper.showSnackbar(
        context: context,
        text: notifier.snackbarMessage,
        backgroundColor: notifier.snackbarColor,
      );
      notifier.clearSnackbar();
    }
  }

  Widget _layout(BuildContext context) {
    checkVariableBeforeUi(context);
    final body = _buildBody(context);

    if (useScaffold) {
      return Scaffold(
        key: _scaffoldKey,
        appBar: appBarBuild(context),
        body: body,
        bottomNavigationBar: bottomNavigationBarBuild(context),
        floatingActionButton: floatingActionButtonBuild(context),
        drawer: drawerBuild(context),
        endDrawer: endDrawerBuild(context),
        backgroundColor: scaffoldBackgroundColor(context) ??
            Theme.of(context).scaffoldBackgroundColor,
      );
    }

    return body;
  }

  Widget _buildBody(BuildContext context) {
    if (notifier.isLoading && !notifier.isInitialized) {
      return LoadingAppWidget(
        key: const ValueKey('loading'),
        message: loadingMessage,
      );
    }

    if (notifier.hasError) {
      return ErrorAppWidget(
        key: const ValueKey('error'),
        description: notifier.errorMessage,
        errorType: notifier.errorType,
        onPressDefaultButton: () {
          notifier.clearError();
          notifier.init();
        },
      );
    }

    if (!notifier.isInitialized) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifier.markInitialized();
      });
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.05),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            )),
            child: child,
          ),
        );
      },
      child: KeyedSubtree(
        key: const ValueKey('content'),
        child: bodyBuild(context),
      ),
    );
  }

  // ========== HOOKS ==========
  void checkVariableBeforeUi(BuildContext context) {}
  void checkVariableAfterUi(BuildContext context) {}

  AppBar? appBarBuild(BuildContext context) => null;
  Widget bodyBuild(BuildContext context);

  Widget? bottomNavigationBarBuild(BuildContext context) => null;
  Widget? floatingActionButtonBuild(BuildContext context) => null;
  Widget? drawerBuild(BuildContext context) => null;
  Widget? endDrawerBuild(BuildContext context) => null;
  Color? scaffoldBackgroundColor(BuildContext context) => null;

  String get loadingMessage => "Menyiapkan Data...";
  bool get useScaffold => true;
}

import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/presentation/login/login_screen.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';

class ErrorAppWidget extends StatelessWidget {
  final String description;
  final void Function() onPressDefaultButton;
  final FilledButton? alternatifButton;
  const ErrorAppWidget({
    super.key,
    required this.description,
    required this.onPressDefaultButton,
    required this.alternatifButton,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            size: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            style: GlobalHelper.getTextStyle(
              context: context,
              appTextStyle: AppTextStyle.HEADLINE_SMALL,
            ),
          ),
          const SizedBox(height: 30),
          alternatifButton ??
              ((description.contains('401') ||
                      description.toLowerCase().contains('unauthenticated'))
                  ? FilledButton(
                      onPressed: () async {
                        await SharedPreferencesHelper.logout();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: const Text('Logout'))
                  : FilledButton.icon(
                      onPressed: onPressDefaultButton,
                      icon: const Icon(Icons.refresh),
                      label: const Text("Refresh"),
                    ))
        ],
      ),
    );
  }
}

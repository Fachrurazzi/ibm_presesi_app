import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';

class DialogHelper {
  static void showSnackbar({required BuildContext context, required text}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  static showBottomDialog(
      {required BuildContext context,
      required String title,
      required Widget content}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  Text(
                    title,
                    style: GlobalHelper.getTextStyle(
                      context: context,
                      appTextStyle: AppTextStyle.TITLE_MEDIUM,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  content
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

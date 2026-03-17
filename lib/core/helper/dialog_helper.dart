import 'package:flutter/material.dart';

class DialogHelper {
  static void showSnackbar({required BuildContext context, required text}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}

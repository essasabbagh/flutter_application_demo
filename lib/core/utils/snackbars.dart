import 'package:flutter/material.dart';

import 'package:flutter_application_demo/core/keys/keys.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
  String message, {
  Color? backgroundColor,
  SnackBarAction? action,
}) {
  scaffoldKey.currentState!.clearSnackBars();
  return scaffoldKey.currentState!.showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      action: action ??
          SnackBarAction(
            label: 'X', // Xx
            textColor: Colors.white,
            onPressed: scaffoldKey.currentState!.hideCurrentSnackBar,
          ),
    ),
  );
}

void showSuccessSnackbar(
  String message, {
  SnackBarAction? action,
}) {
  showSnackBar(
    message,
    backgroundColor: Colors.green.shade400,
    action: action,
  );
}

void showErrorSnackbar(
  String message, {
  SnackBarAction? action,
}) {
  showSnackBar(
    message,
    backgroundColor: Colors.red.shade400,
    action: action,
  );
}

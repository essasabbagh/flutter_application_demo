import 'package:flutter/material.dart';

import 'package:flutter_application_demo/core/keys/keys.dart';

void showAlert(
  Widget? title,
  Widget? content,
  VoidCallback onPressed,
) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (rootNavigatorKey.currentContext == null) return;
    showDialog(
      context: rootNavigatorKey.currentContext!,
      builder: (context) => AlertDialog(
        title: title,
        content: content,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // context.popFalse();
              Navigator.of(context).pop();
              onPressed();
            },
            child: const Text(
              'Ok',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            // child: Text(S.of(context).ok),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),

            // onPressed: () => context.popFalse(),
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  });
}

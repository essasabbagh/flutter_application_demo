import 'package:flutter/material.dart';

import 'package:flutter_application_demo/core/keys/keys.dart';

Future<dynamic> showOptions(List<Widget> children) {
  return showModalBottomSheet(
    useSafeArea: true,
    isDismissible: true,
    showDragHandle: true,
    context: rootNavigatorKey.currentContext!,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
    },
  );
}

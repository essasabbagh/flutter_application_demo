import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class DateHelper {
  static Widget dateHelper(String date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Icon(
          Icons.access_time_filled,
          size: 16,
        ),
        const SizedBox(width: 4.0),
        Text(
          DateFormat('dd/MM/yyyy').format(DateTime.parse(date)),
        ),
      ],
    );
  }
}

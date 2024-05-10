import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              color: Colors.white,
              size: 42,
            ),
            SizedBox(height: 16),
            Text(
              'لا يوجد بيانات !',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                // fontFamily: FontConstants.fontFamily,
              ),
            ),
          ],
        ),
      );
}

import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) => Center(
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(
            color!,
          ),
        ),
      );
}

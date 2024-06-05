import 'package:flutter/material.dart';

import 'package:share_plus/share_plus.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    super.key,
    required this.url,
    this.color,
  });

  final String url;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: color,
      icon: const Icon(Icons.ios_share),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      onPressed: () {
        final box = context.findRenderObject() as RenderBox?;

        Share.share(
          url,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
        );
      },
    );
  }
}

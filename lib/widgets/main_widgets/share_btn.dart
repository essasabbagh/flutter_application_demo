import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key, this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      // color: Colors.white,
      icon: const Icon(Icons.ios_share),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      onPressed: () {
        final box = context.findRenderObject() as RenderBox?;

        // Share.share(
        //   '${AppStrings.appBarTitle} ${url ?? AppStrings.shareUrl}',
        //   sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
        // );
      },
    );
  }
}

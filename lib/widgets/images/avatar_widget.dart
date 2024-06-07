import 'package:flutter/material.dart';

import 'package:flutter_application_demo/core/helpers/image_helper.dart';

/// ```dart
/// AvatarWidget(
///  imageUrl: 'https://example.com/avatar.png',
///  size: 80.0, // Customize the size if needed
/// )
/// ```
class AvatarWidget extends StatelessWidget {
  final String imageUrl;
  final double size;

  const AvatarWidget({
    super.key,
    required this.imageUrl,
    this.size = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      // backgroundImage: NetworkImage(imageUrl),
      backgroundImage: ImageHelper.cashedImageProvider(imageUrl),
    );
  }
}

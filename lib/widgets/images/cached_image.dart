import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_application_demo/widgets/loading/loading_widget.dart';

import 'placeholder_image.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
  });

  final double? width;
  final double? height;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: BoxFit.cover,
      imageUrl: imageUrl,
      errorWidget: (context, val, _) => PlaceHolderImage(
        height: height,
        width: width,
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          const LoadingWidget(),
    );
  }
}

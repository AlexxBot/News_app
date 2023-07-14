import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  const ImageWidget(
      {super.key, required this.imageUrl, this.height, this.width, this.fit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: imageUrl,
      fit: fit,
      imageBuilder: (context, imageProvider) {
        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fitHeight,
                )));
      },
      errorWidget: (context, url, error) {
        return const Center(child: Icon(Icons.image));
      },
      progressIndicatorBuilder: (context, url, progress) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      },
    );
  }
}

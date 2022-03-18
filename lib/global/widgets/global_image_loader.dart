import 'package:flutter/material.dart';

class GlobalImageLoader extends StatelessWidget {
  final String imageUrl;
  final String placeholder;
  final double? imageWidth;
  final double? imageHeight;
  final BoxFit fit;
  final Color? color;

  const GlobalImageLoader({
    Key? key,
    required this.imageUrl,
    this.placeholder = "assets/images/group_34520.svg",
    this.imageWidth,
    this.imageHeight,
    this.color,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imageHeight,
      width: imageWidth,
      child: Image.network(
        imageUrl,
        fit: fit,
        loadingBuilder: (ctx, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        errorBuilder: (context, error, stackTrace) =>
        const Text('errors occurred!'),
      ),
      //     CachedNetworkImage(
      //   fit: fit,
      //   imageUrl: "${AppUrl.IMAGE_BASE_URL}$imageUrl",
      //   color: color,
      //   placeholder: (context, url) =>
      //       //     Center(
      //       //   child: CircularProgressIndicator(),
      //       // ),
      //
      //   errorWidget: (context, url, error) => Container(),
      // ),
    );
  }
}

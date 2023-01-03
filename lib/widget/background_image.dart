import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? borderRadius;
  final BoxFit? fit;

  const BackgroundImage({
    Key? key,
    this.imageUrl,
    this.width,
    this.borderRadius,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl!),
            fit: fit == null ? BoxFit.cover : fit!,
          ),
          borderRadius:
              BorderRadius.circular(borderRadius == null ? 5 : borderRadius!)),
    );
  }
}

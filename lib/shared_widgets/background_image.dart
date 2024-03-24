import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? borderRadius;

  const BackgroundImage({
    Key? key,
    this.imageUrl,
    this.width,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl!),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(
          borderRadius == null ? 5 : borderRadius!,
        ),
      ),
    );
  }
}

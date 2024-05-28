import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  final double? radius;
  final String? thumbnailUrl;
  final String? localAsset;

  const CustomAvatar({
    super.key,
    this.radius,
    this.thumbnailUrl,
    this.localAsset,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.transparent,
      child: localAsset == null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(radius!),
              child: Image.network(thumbnailUrl!),
            )
          : Image.asset(localAsset!),
    );
  }
}

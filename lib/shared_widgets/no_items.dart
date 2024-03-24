import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/shared_widgets/custom_avatar.dart';

class VerticalNoItem extends StatelessWidget {
  final String? imageAsset;
  final String? errorMessage;
  final double? height;
  final double? radius;

  const VerticalNoItem({
    Key? key,
    this.imageAsset,
    this.errorMessage,
    this.height,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomAvatar(
              radius: radius!,
              localAsset: imageAsset!,
            ),
            verticalSpacing,
            Text(
              errorMessage!,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

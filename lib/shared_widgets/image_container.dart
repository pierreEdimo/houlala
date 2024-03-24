import 'package:flutter/material.dart';
import 'package:houlala/shared_widgets/background_image.dart';
import 'package:sizer/sizer.dart';

class ImageContainer extends StatelessWidget {
  final String? imageUrl;

  const ImageContainer({
    Key? key,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: BackgroundImage(
        imageUrl: imageUrl,
      ),
    );
  }
}

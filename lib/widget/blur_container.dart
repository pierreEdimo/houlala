import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BlurContainer extends StatelessWidget {
  final double? height;

  const BlurContainer({
    Key? key,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height == null ? 35.h : height!,
      width: 100.w,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.2),
      ),
    );
  }
}

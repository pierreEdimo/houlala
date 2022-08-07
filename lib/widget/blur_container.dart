import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BlurContainer extends StatelessWidget {
  const BlurContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 100.w,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.2),
      ),
    );
  }
}

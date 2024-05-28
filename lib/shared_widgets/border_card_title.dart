import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:sizer/sizer.dart';

class BorderedCardTitle extends StatelessWidget {
  final String? title;

  const BorderedCardTitle({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: Colors.grey.shade300))),
      child: Text(
        title!,
        style: titleStyle,
      ),
    );
  }
}

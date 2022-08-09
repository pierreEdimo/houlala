import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BorderedCardTitle extends StatelessWidget {
  final String? title;

  const BorderedCardTitle({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      margin: const EdgeInsets.only(bottom: 10.0),
      child:  Text(
        title!,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: "PoppinsBold"),
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: Colors.grey.shade300))),
    );
  }
}

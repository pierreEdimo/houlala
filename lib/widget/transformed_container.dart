import 'package:flutter/material.dart';

class TransformedContainer extends StatelessWidget {
  final Widget? child;
  final Color? color;

  const TransformedContainer({Key? key, this.child, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0.0, -20.0, 0.0),
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      decoration:  const BoxDecoration(
        color:  Color(0xffffffff),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: child!,
    );
  }
}

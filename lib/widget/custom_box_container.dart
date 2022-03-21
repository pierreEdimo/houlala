import 'package:flutter/material.dart';

class CustomBoxContainer extends StatelessWidget {
  final double? height;
  final Widget? child;
  const CustomBoxContainer({Key? key, this.height, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      padding: const EdgeInsets.all(5.0),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';

class CustomBoxContainer extends StatelessWidget {
  final Widget? child;
  const CustomBoxContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: child,
    );
  }
}

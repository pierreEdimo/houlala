import 'package:flutter/material.dart';

class StandardCustomContainer extends StatelessWidget {
  final Widget? child;

  const StandardCustomContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      child: child!,
    );
  }
}

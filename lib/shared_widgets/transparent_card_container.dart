import 'package:flutter/material.dart';

class TransparentCardContainer extends StatelessWidget {
  final Widget? child;

  const TransparentCardContainer({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: child,
    );
  }
}

import 'package:flutter/material.dart';

class TransparentCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? padding;

  const TransparentCard({
    Key? key,
    this.child,
    this.padding
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: child!,
      ),
    );
  }
}

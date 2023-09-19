import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? padding;
  final double? elevation;
  final Border? border;

  const CustomCard({
    Key? key,
    this.child,
    this.padding,
    this.elevation,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          5.0,
        ),
      ),
      elevation: elevation ?? 1,
      child: Container(
        padding: padding ?? const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          border: border ??
              Border.all(
                color: const Color(0xfff3f3f3),
              ),
        ),
        child: child!,
      ),
    );
  }
}

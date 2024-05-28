import 'package:flutter/material.dart';

class ElevationContainer extends StatelessWidget {
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final double? elevation;

  const ElevationContainer({
    super.key,
    this.child,
    this.borderRadius,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: borderRadius ?? BorderRadius.circular(5.0),
      elevation: elevation ?? 1,
      child: child!,
    );
  }
}

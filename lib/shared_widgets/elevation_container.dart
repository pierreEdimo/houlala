import 'package:flutter/material.dart';

class ElevationContainer extends StatelessWidget {
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final double? elevation;

  const ElevationContainer({
    Key? key,
    this.child,
    this.borderRadius,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: borderRadius ?? BorderRadius.circular(5.0),
      elevation: elevation ?? 1,
      child: child!,
    );
  }
}

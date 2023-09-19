import 'package:flutter/material.dart';

class BottomItem extends StatelessWidget {
  final Color? color;
  final Widget? icon;
  final Widget? selectedIcon;
  final double? size;
  final bool? selected;

  const BottomItem({
    Key? key,
    this.icon,
    this.color,
    this.size,
    this.selected,
    this.selectedIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(color: color, size: size ?? 25.0),
      child: selected! ? selectedIcon! : icon!,
    );
  }
}

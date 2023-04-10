import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  final Color? color;
  final bool? hasBorder;

  const CustomElevatedButton({
    Key? key,
    this.child,
    this.onPressed,
    this.color,
    this.hasBorder,
  }) : super(key: key);

  getColor() {
    if (hasBorder == null || !hasBorder! == false) {
      return Colors.grey.shade300;
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          const Color(0xff000000),
        ),
        elevation: MaterialStateProperty.all<double>(0.0),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: getColor(),
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          color == null ? const Color(0xffffffff) : color!,
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}

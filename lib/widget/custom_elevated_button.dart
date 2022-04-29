import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;

  const CustomElevatedButton({
    Key? key,
    this.child,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0.0),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(
            color: Color(0xFF000000),
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color(0xffffffff),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomButtonContainer extends StatelessWidget {
  final FaIcon? icon;
  final VoidCallback? onPressed;

  const CustomButtonContainer({
    Key? key,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Center(
        child: IconButton(
          iconSize: 18.0,
          icon: icon!,
          onPressed: onPressed,
        ),
      ),
    );
  }
}

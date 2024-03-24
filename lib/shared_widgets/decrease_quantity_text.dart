import 'package:flutter/material.dart';

class DecreaseQuantityText extends StatelessWidget {
  const DecreaseQuantityText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "-",
      style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
    );
  }
}

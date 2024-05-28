import 'package:flutter/material.dart';

class DecreaseQuantityText extends StatelessWidget {
  const DecreaseQuantityText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "-",
      style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
    );
  }
}

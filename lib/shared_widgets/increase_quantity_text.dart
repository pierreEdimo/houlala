import 'package:flutter/material.dart';

class InCreaseQuantityText extends StatelessWidget {
  const InCreaseQuantityText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "+",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28.0,
      ),
    );
  }
}

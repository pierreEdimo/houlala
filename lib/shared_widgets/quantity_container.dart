import 'package:flutter/material.dart';

class QuantityContainer extends StatelessWidget {
  final int? quantity;

  const QuantityContainer({
    super.key,
    this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      quantity.toString(),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
    );
  }
}

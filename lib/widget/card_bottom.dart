import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';

class CardBottom extends StatelessWidget {
  final int? price;
  final int? quantity;

  const CardBottom({
    Key? key,
    this.price,
    this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 15.0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1, color: Colors.grey.shade300),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              const Text(
                "Quantite: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(quantity.toString()),
            ],
          ),
          horizontalSpacing,
          Row(
            children: [
              const Text(
                "Prix: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('${price.toString()}FCFA'),
            ],
          )
        ],
      ),
    );
  }
}

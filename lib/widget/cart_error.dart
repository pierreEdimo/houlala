import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/widget/standard_custom_container.dart';

class CartError extends StatelessWidget {
  const CartError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StandardCustomContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            ImageIcon(
              AssetImage('images/cart.png'),
              size: 140,
            ),
            standardSizedBox,
            Text("Votre panier houlala est vide",
            textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}

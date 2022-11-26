import 'package:flutter/material.dart';
import 'package:houlala/widget/custom_avatar.dart';
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
            CustomAvatar(
              radius: 50,
              localAsset: "images/no-shopping-cart.png",
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Votre panier houlala est vide",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

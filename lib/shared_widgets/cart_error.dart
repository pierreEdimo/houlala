import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/shared_widgets/standard_custom_container.dart';

import 'custom_avatar.dart';

class CartError extends StatelessWidget {
  const CartError({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StandardCustomContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomAvatar(
              radius: 50,
              localAsset: "images/no-shopping-cart.png",
            ),
            verticalSpacing,
            const Text(
              "Votre panier houlala est vide",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

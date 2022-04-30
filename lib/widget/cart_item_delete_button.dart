import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/main.dart';
import 'package:houlala/widget/show_nack.dart';
import 'package:provider/provider.dart';
import '../model/cart-item.dart';
import '../service/cart_item_service.dart';

class CartItemDeleteButton extends StatelessWidget {
  final CartItem? item;

  const CartItemDeleteButton({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: const FaIcon(
        FontAwesomeIcons.trashCan,
        color: Colors.red,
      ),
      onTap: () async {
        final String? userId = await storage.read(key: "userId");
        if (userId != null) {
          Provider.of<CartItemService>(context, listen: false)
              .deleteCart(item!.id!);
        } else {
          Provider.of<CartItemService>(context, listen: false).deleteCartItem(
              item!);
        }
        showSnack(
            const Text("Produit a ete supprime du Panier"), context);
      },
    );
  }
}

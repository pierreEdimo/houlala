import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../model/cart_item.dart';

class CartItemDeleteButton extends StatelessWidget {
  final CartItem? item;
  final int? orderId;
  final String? locationId;

  const CartItemDeleteButton({
    Key? key,
    this.item,
    this.orderId,
    this.locationId,
  }) : super(key: key);

  /// Supprime les items de la Commande
  deleteItemFromOrder(BuildContext context) async {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: const FaIcon(
        FontAwesomeIcons.trashCan,
      ),
      onTap: () async => deleteItemFromOrder(context),
    );
  }
}

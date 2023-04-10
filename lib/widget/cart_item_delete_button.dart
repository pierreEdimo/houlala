import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/service/order_service.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../model/cart_item.dart';

class CartItemDeleteButton extends StatelessWidget {
  final CartItem? item;
  final String? orderId;
  final String? locationId;

  const CartItemDeleteButton({
    Key? key,
    this.item,
    this.orderId,
    this.locationId,
  }) : super(key: key);

  /// Supprime les items de la Commande
  deleteItemFromOrder(BuildContext context) async {
    String? userId = await storage.read(key: "userId");

    if (userId != null) {
      Provider.of<OrderService>(context, listen: false)
          .deleteFromOrder(item!.productSku!, orderId);
    } else {
      Provider.of<OrderService>(context, listen: false)
          .deleteItemFromOrder(locationId!, item!.productSku!);
    }
  }

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

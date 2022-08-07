import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/service/order_service.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../model/cart_item.dart';

class CartItemDeleteButton extends StatelessWidget {
  final CartItem? item;
  final String? orderId;

  const CartItemDeleteButton({
    Key? key,
    this.item,
    this.orderId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: const FaIcon(
        FontAwesomeIcons.trashCan,
        color: Color(0xffdf972f),
      ),
      onTap: () async {
        String? userId = await storage.read(key: "userId");

        if (userId != null) {
          Provider.of<OrderService>(context, listen: false)
              .deleteFromOrder(item!.productSku!, orderId);
        }
      },
    );
  }
}

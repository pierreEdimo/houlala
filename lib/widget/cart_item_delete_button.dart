import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../service/cart_item_service.dart';


class CartItemDeleteButton extends StatelessWidget {
  final String? id;

  const CartItemDeleteButton({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      child: const FaIcon(
        FontAwesomeIcons.trashCan,
        color: Colors.red,
      ),
      onTap: () => Provider.of<CartItemService>(
          context,
          listen: false)
          .deleteCart(id!),
    );
  }
}

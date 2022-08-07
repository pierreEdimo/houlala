import 'package:flutter/material.dart';
import 'package:houlala/model/order.dart';
import 'package:houlala/widget/checkout_button.dart';
import 'package:houlala/widget/standard_custom_container.dart';

class CartItemBottom extends StatelessWidget {
  final List<Order>? items;

  const CartItemBottom({Key? key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.0,
      child: StandardCustomContainer(
        child: CheckoutButton(
          orders: items!,
        ),
      ),
    );
  }
}

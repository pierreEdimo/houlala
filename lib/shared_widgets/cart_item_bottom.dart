import 'package:flutter/material.dart';
import 'package:houlala/model/offline_order.dart';
import 'package:houlala/model/order.dart';
import 'package:houlala/shared_widgets/standard_custom_container.dart';

import 'checkout_button.dart';

class CartItemBottom extends StatelessWidget {
  final List<Order>? items;
  final List<OfflineOrder>? offlineItems;

  const CartItemBottom({
    Key? key,
    this.items,
    this.offlineItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.0,
      child: StandardCustomContainer(
        child: items != null
            ? CheckoutButton(
                orders: items!,
              )
            : CheckoutButton(
                offlineOrders: offlineItems,
              ),
      ),
    );
  }
}

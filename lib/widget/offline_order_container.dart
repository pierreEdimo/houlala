import 'package:flutter/material.dart';
import 'package:houlala/model/offline_order.dart';
import 'package:houlala/widget/bordered_card.dart';
import 'package:houlala/widget/order_container.dart';

class OfflineOrderContainer extends StatelessWidget {
  final OfflineOrder? order;

  const OfflineOrderContainer({
    Key? key,
    this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BorderedCard(
      child: Column(
        children: [
          CardTitle(
            name: order!.locationName!,
          ),
          const SizedBox(
            height: 10.0,
          ),
          ListOFItems(
            confirmed: false,
            items: order!.cartItems!,
            orderId: "",
            locationId: order!.locationId!,
          ),
          CardBottom(
            quantity: order!.totalQuantity,
            price: order!.totalPrice,
          )
        ],
      ),
    );
  }
}

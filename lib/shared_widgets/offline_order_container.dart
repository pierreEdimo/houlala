
import 'package:flutter/material.dart';
import 'package:houlala/model/offline_order.dart';
import 'package:houlala/widget/custom_card.dart';
import 'package:houlala/widget/card_bottom.dart';
import 'package:houlala/widget/card_title.dart';
import 'package:houlala/widget/list_items.dart';

class OfflineOrderContainer extends StatelessWidget {
  final OfflineOrder? order;
  final String? status;

  const OfflineOrderContainer({
    Key? key,
    this.order,
    this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        children: [
          CardTitle(
            name: order!.locationName!,
          ),
          const SizedBox(
            height: 10.0,
          ),
          ListOfItems(
            status: status,
            confirmed: false,
            items: order!.cartItems!,
            orderId: 0,
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

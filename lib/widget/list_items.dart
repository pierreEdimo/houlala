import 'package:flutter/material.dart';
import 'package:houlala/model/cart_item.dart';
import 'package:houlala/widget/cart_item_container.dart';

class ListOfItems extends StatelessWidget {
  final List<CartItem>? items;
  final String? orderId;
  final bool? confirmed;
  final String? status;
  final String? locationId;

  const ListOfItems({
    Key? key,
    this.items,
    this.orderId,
    this.confirmed,
    this.status,
    this.locationId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      children: items!
          .map(
            (item) => CartItemContainer(
              status: status,
              cartItem: item,
              orderId: orderId!,
              confirmed: confirmed,
              locationId: locationId,
            ),
          )
          .toList(),
    );
  }
}

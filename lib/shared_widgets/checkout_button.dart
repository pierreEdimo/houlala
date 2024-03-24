import 'package:flutter/material.dart';

import '../model/offline_order.dart';
import '../model/order.dart';

class CheckoutButton extends StatelessWidget {
  final List<Order>? orders;
  final List<OfflineOrder>? offlineOrders;

  const CheckoutButton({
    Key? key,
    this.orders,
    this.offlineOrders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(); 
  }
}

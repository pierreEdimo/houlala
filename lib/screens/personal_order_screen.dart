import 'package:flutter/material.dart';
import 'package:houlala/service/order_service.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/no_items.dart';
import 'package:houlala/widget/order_container.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../model/order.dart';

class PersonalOrderScreen extends StatelessWidget {
  const PersonalOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithReturn(
        title: "Mes Commandes",
        elevation: 1,
        color: Colors.transparent,
      ),
      body: FutureBuilder(
        future:
            Provider.of<OrderService>(context).fetchCartItems(confirmed: true),
        builder: (BuildContext context, AsyncSnapshot<List<Order>> snapshot) {
          if (snapshot.hasData) {
            List<Order>? orders = snapshot.data;

            return orders!.isEmpty
                ? VerticalNoItem(
                    imageAsset: "images/no-shopping-cart.png",
                    height: 80.h,
                    errorMessage: "Vous n'avez pas encore effectue de commandes sur Houla la",
                    radius: 50,
                  )
                : ListView(
                    children: orders
                        .map(
                          (order) => OrderContainer(
                            order: order,
                            confirmed: true,
                          ),
                        )
                        .toList(),
                  );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

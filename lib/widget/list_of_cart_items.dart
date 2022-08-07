import 'package:flutter/material.dart';
import 'package:houlala/model/order.dart';
import 'package:houlala/service/auth_service.dart';
import 'package:houlala/service/order_service.dart';
import 'package:houlala/widget/cart_error.dart';
import 'package:houlala/widget/order_container.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:provider/provider.dart';

import 'cart_item_bottom.dart';

class ListOfCartItems extends StatelessWidget {
  const ListOfCartItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loggedState = Provider.of<AuthService>(context).getLoggedState();
    return loggedState == 'loggedIn'
        ? FutureBuilder(
            future: Provider.of<OrderService>(context)
                .fetchCartItems(confirmed: false),
            builder:
                (BuildContext context, AsyncSnapshot<List<Order>> snapshot) {
              if (snapshot.hasData) {
                List<Order>? orders = snapshot.data!;
                return StandardCustomContainer(
                  child: orders.isEmpty
                      ? const CartError()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ListView(
                                children: orders
                                    .map(
                                      (Order item) => OrderContainer(
                                        order: item,
                                        confirmed: false,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            CartItemBottom(
                              items: orders,
                            ),
                          ],
                        ),
                );
              } else if (snapshot.hasError) {
                return const StandardCustomContainer(
                  child: CartError(),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )
        : const Center(
            child: CartError(),
          );
  }
}

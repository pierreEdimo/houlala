import 'package:flutter/material.dart';
import 'package:houlala/service/cart_item_service.dart';
import 'package:houlala/widget/cart_error.dart';
import 'package:houlala/widget/cart_item_bottom.dart';
import 'package:houlala/widget/cart_item_container.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:provider/provider.dart';

import '../model/cart-item.dart';

class ListOfCartItems extends StatelessWidget {
  const ListOfCartItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<CartItemService>(context).fetchCartItems(),
      builder: (BuildContext context, AsyncSnapshot<List<CartItem>> snapshot) {
        if (snapshot.hasData) {
          List<CartItem> items = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: StandardCustomContainer(
                  child: items.isEmpty
                      ? const CartError()
                      : ListView(
                          children: items
                              .map(
                                (CartItem item) => CartItemContainer(
                                  cartItem: item,
                                ),
                              )
                              .toList(),
                        ),
                ),
              ),
              CartItemBottom(
                items: items,
              ),
            ],
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/model/cart_item.dart';
import 'package:houlala/service/cart_item_service.dart';
import 'package:houlala/widget/checkout_button.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:provider/provider.dart';
import '../model/CountAndPrice.dart';

class CartItemBottom extends StatelessWidget {
  final List<CartItem>? items;

  const CartItemBottom({Key? key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<CartItemService>(context).getTotalResult(items!),
      builder: (BuildContext context, AsyncSnapshot<CountAndPrice> snapshot) {
        if (snapshot.hasData) {
          CountAndPrice total = snapshot.data!;
          return SizedBox(
            height: 70.0,
            child: StandardCustomContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Totat: ",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        '${total.totalPrice} FCFA',
                        style: standardStyle,
                      )
                    ],
                  ),
                  CheckoutButton(
                    items: items!,
                    total: total,
                  )
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}

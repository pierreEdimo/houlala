import 'package:flutter/material.dart';
import 'package:houlala/model/cart-item.dart';
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
      future: Provider.of<CartItemService>(context).getCountAndPrice(),
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
                  Row(
                    children: [
                      const Text(
                        "Prix Totat: ",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        '${total.totalPrice} FCFA',
                        style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'PoppinsBold'),
                      )
                    ],
                  ),
                  CheckoutButton(
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

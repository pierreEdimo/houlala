import 'package:flutter/material.dart';
import 'package:houlala/service/cart_item_service.dart';
import 'package:houlala/widget/cart_item_delete_button.dart';
import 'package:houlala/widget/product_container.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../model/cart-item.dart';

class CartItemContainer extends StatelessWidget {
  final CartItem? cartItem;

  const CartItemContainer({
    Key? key,
    this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Stack(
        children: [
          ProductContainer(
            displayType: "cart-item",
            product: cartItem!.product!,
          ),
          SizedBox(
            width: 100.w,
            height: 205,
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  const SizedBox(
                    width: 11.0,
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            '${cartItem!.totalPrice!.toString()} FCFA',
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => Provider.of<CartItemService>(
                                            context,
                                            listen: false)
                                        .decreaseCartItem(cartItem!),
                                    child: cartItem!.quantity! <= 1
                                        ? CartItemDeleteButton(
                                            id: cartItem!.id,
                                          )
                                        : const Text(
                                            "-",
                                            style: TextStyle(
                                                fontSize: 28.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    cartItem!.quantity.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  InkWell(
                                    onTap: () => Provider.of<CartItemService>(
                                            context,
                                            listen: false)
                                        .increaseCartItem(cartItem!),
                                    child: const Text(
                                      "+",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              CartItemDeleteButton(
                                id: cartItem!.id!,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

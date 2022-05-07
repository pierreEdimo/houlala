import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/service/cart_item_service.dart';
import 'package:houlala/widget/cart_item_delete_button.dart';
import 'package:houlala/widget/decrease_quantity_text.dart';
import 'package:houlala/widget/increase_quantity_text.dart';
import 'package:houlala/widget/product_container.dart';
import 'package:houlala/widget/quantity_container.dart';
import 'package:houlala/widget/transparent_card_container.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../model/cart_item.dart';
import '../screens/product_detail_screen.dart';

class CartItemContainer extends StatelessWidget {
  final CartItem? cartItem;
  final String? horizontal;

  const CartItemContainer({
    Key? key,
    this.cartItem,
    this.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (horizontal) {
      case 'horizontal':
        return InkWell(
          onTap: () => Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            arguments: cartItem!.product!.name,
          ),
          child: TransparentCardContainer(
            child: Stack(
              children: [
                SizedBox(
                  width: 80.w,
                  child: ProductContainer(
                    displayType: "cart-item",
                    product: cartItem!.product!,
                  ),
                ),
                Container(
                  width: 80.w,
                  color: Colors.transparent,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Container()),
                      horizontalSpacing,
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text("quantite: "),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(cartItem!.quantity!.toString()),
                                ],
                              ),
                              verticalSpacing,
                              Row(
                                children: [
                                  const Text("prix: "),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    cartItem!.totalPrice!.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      default:
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: cartItem!.product!.name,
            );
          },
          child: TransparentCardContainer(
            child: Stack(
              children: [
                ProductContainer(
                  displayType: "cart-item",
                  product: cartItem!.product!,
                ),
                SizedBox(
                  width: 100.w,
                  height: 175,
                  child: TransparentCardContainer(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        horizontalSpacing,
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                standardSizedBox,
                                Text(
                                  '${cartItem!.totalPrice!.toString()} FCFA',
                                  style: const TextStyle(fontSize: 18.0),
                                ),
                                standardSizedBox,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () =>
                                              Provider.of<CartItemService>(
                                                      context,
                                                      listen: false)
                                                  .decreaseCartItem(cartItem!),
                                          child: cartItem!.quantity! <= 1
                                              ? CartItemDeleteButton(
                                                  item: cartItem!,
                                                )
                                              : const DecreaseQuantityText(),
                                        ),
                                        horizontalSpacing,
                                        QuantityContainer(
                                          quantity: cartItem!.quantity,
                                        ),
                                        horizontalSpacing,
                                        InkWell(
                                          onTap: () =>
                                              Provider.of<CartItemService>(
                                                      context,
                                                      listen: false)
                                                  .increaseCartItem(cartItem!),
                                          child: const InCreaseQuantityText(),
                                        )
                                      ],
                                    ),
                                    CartItemDeleteButton(
                                      item: cartItem!,
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
          ),
        );
    }
  }
}

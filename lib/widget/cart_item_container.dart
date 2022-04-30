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
import '../model/cart-item.dart';
import '../screens/product_detail_screen.dart';

class CartItemContainer extends StatelessWidget {
  final CartItem? cartItem;

  const CartItemContainer({
    Key? key,
    this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
          ProductDetailScreen.routeName,
          arguments: cartItem!.product!.id),
      child: TransparentCardContainer(
        child: Stack(
          children: [
            ProductContainer(
              displayType: "cart-item",
              product: cartItem!.product!,
            ),
            SizedBox(
              width: 100.w,
              height: 205,
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
                                      onTap: () => Provider.of<CartItemService>(
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

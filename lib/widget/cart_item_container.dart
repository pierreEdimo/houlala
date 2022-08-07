import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/main.dart';
import 'package:houlala/model/cart_item.dart';
import 'package:houlala/service/order_service.dart';
import 'package:houlala/widget/background_image.dart';
import 'package:houlala/widget/decrease_quantity_text.dart';
import 'package:houlala/widget/increase_quantity_text.dart';
import 'package:houlala/widget/quantity_container.dart';
import 'package:houlala/widget/transparent_card_container.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../screens/product_detail_screen.dart';
import 'cart_item_delete_button.dart';

class CartItemContainer extends StatelessWidget {
  final CartItem? cartItem;
  final bool? confirmed;
  final String? orderId;
  final String? status;

  const CartItemContainer({
    Key? key,
    this.cartItem,
    this.confirmed,
    this.orderId,
    this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case 'confirmation':
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: cartItem!.name);
          },
          child: TransparentCardContainer(
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 45.w,
                      height: 225,
                      child: BackgroundImage(
                        imageUrl: cartItem!.imageUrl!,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Text(
                        cartItem!.name!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'PoppinsBold',
                            fontSize: 22.0),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 100.w,
                  height: 225,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(top: 30.0, left: 22.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${cartItem!.price.toString()} FCFA',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              Text(
                                cartItem!.quantity.toString(),
                                style: const TextStyle(
                                  fontSize: 18.0,
                                ),
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
              arguments: cartItem!.name,
            );
          },
          child: TransparentCardContainer(
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 45.w,
                      height: 225,
                      child: BackgroundImage(
                        imageUrl: cartItem!.imageUrl!,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Text(
                        cartItem!.name!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'PoppinsBold',
                            fontSize: 22.0),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 100.w,
                  height: 175,
                  child: !confirmed!
                      ? TransparentCardContainer(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Flexible(
                                child: Container(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${cartItem!.price!.toString()} FCFA',
                                        style: const TextStyle(fontSize: 18.0),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  String? userId = await storage
                                                      .read(key: "userId");

                                                  if (userId != null) {
                                                    Provider.of<OrderService>(
                                                            context,
                                                            listen: false)
                                                        .updateQuantity(
                                                            'decrease',
                                                            cartItem!
                                                                .productSku!,
                                                            orderId);
                                                  }
                                                },
                                                child: cartItem!.quantity! <= 1
                                                    ? CartItemDeleteButton(
                                                        orderId: orderId,
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
                                                onTap: () async {
                                                  String? userId = await storage
                                                      .read(key: "userId");

                                                  if (userId != null) {
                                                    Provider.of<OrderService>(
                                                            context,
                                                            listen: false)
                                                        .updateQuantity(
                                                            'increase',
                                                            cartItem!
                                                                .productSku!,
                                                            orderId);
                                                  }
                                                },
                                                child:
                                                    const InCreaseQuantityText(),
                                              )
                                            ],
                                          ),
                                          CartItemDeleteButton(
                                            orderId: orderId,
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
                        )
                      : TransparentCardContainer(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(),
                              ),
                              const SizedBox(
                                width: 25.0,
                              ),
                              Flexible(
                                child: Container(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${cartItem!.price!.toString()} FCFA',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 18.0),
                                      ),
                                      Text(cartItem!.quantity.toString())
                                    ],
                                  ),
                                ),
                              )
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

import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/main.dart';
import 'package:houlala/model/cart_item.dart';
import 'package:houlala/model/product_detail_args.dart';
import 'package:houlala/service/order_service.dart';
import 'package:houlala/widget/decrease_quantity_text.dart';
import 'package:houlala/widget/image_container.dart';
import 'package:houlala/widget/increase_quantity_text.dart';
import 'package:houlala/widget/product_title.dart';
import 'package:houlala/widget/quantity_container.dart';
import 'package:houlala/widget/transparent_card_container.dart';
import 'package:provider/provider.dart';
import '../screens/product_detail_screen.dart';
import 'cart_item_delete_button.dart';

class CartItemContainer extends StatelessWidget {
  final CartItem? cartItem;
  final bool? confirmed;
  final int? orderId;
  final String? status;
  final String? locationId;

  const CartItemContainer(
      {Key? key,
      this.cartItem,
      this.confirmed,
      this.orderId,
      this.status,
      this.locationId})
      : super(key: key);

  /// Reduis la quantite de produits du panier
  decreaseQuantity(BuildContext context) async {
    String? userId = await storage.read(key: "userId");

    if (userId != null) {
      Provider.of<OrderService>(context, listen: false)
          .updateQuantity('decrease', cartItem!.productSku!, orderId);
    } else {
      Provider.of<OrderService>(context, listen: false)
          .decreaseItemQuantity(locationId!, cartItem!.productSku!);
    }
  }

  /// augmente la quantite de produits du panier
  increaseQuantity(BuildContext context) async {
    String? userId = await storage.read(key: "userId");

    if (userId != null) {
      Provider.of<OrderService>(context, listen: false)
          .updateQuantity('increase', cartItem!.productSku!, orderId);
    } else {
      Provider.of<OrderService>(context, listen: false)
          .increaseItemQuantity(locationId!, cartItem!.productSku!);
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case 'confirmation':
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: ProductDetailArgs(
                name: cartItem!.name,
                sku: cartItem!.productSku,
              ),
            );
          },
          child: TransparentCardContainer(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageContainer(
                  imageUrl: cartItem!.imageUrl!,
                ),
                horizontalSpacing,
                SizedBox(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductTitle(
                          title: cartItem!.name!,
                          maxLines: 2,
                        ),
                        verticalSpacing,
                        Text(
                          '${cartItem!.price.toString()}FCFA',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 18.0),
                        ),
                        verticalSpacing,
                        Text(
                          cartItem!.quantity.toString(),
                          style: const TextStyle(fontSize: 18.0),
                        )
                      ]),
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
              arguments: ProductDetailArgs(
                name: cartItem!.name, sku: cartItem!.productSku),
            );
          },
          child: TransparentCardContainer(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageContainer(
                  imageUrl: cartItem!.imageUrl!,
                ),
                horizontalSpacing,
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitle(
                        title: cartItem!.name!,
                        maxLines: 2,
                      ),
                      verticalSpacing,
                      !confirmed!
                          ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${cartItem!.price!.toString()}FCFA',
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () async =>
                                        decreaseQuantity(context),
                                    child: cartItem!.quantity! <= 1
                                        ? CartItemDeleteButton(
                                      orderId: orderId,
                                      item: cartItem!,
                                      locationId: locationId,
                                    )
                                        : const DecreaseQuantityText(),
                                  ),
                                  horizontalSizedBox,
                                  QuantityContainer(
                                    quantity: cartItem!.quantity!,
                                  ),
                                  horizontalSizedBox,
                                  GestureDetector(
                                    onTap: () async =>
                                        increaseQuantity(context),
                                    child: const InCreaseQuantityText(),
                                  )
                                ],
                              ),
                              CartItemDeleteButton(
                                orderId: orderId,
                                item: cartItem!,
                                locationId: locationId,
                              )
                            ],
                          )
                        ],
                      )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${cartItem!.price!.toString()}FCFA',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 18.0),
                                ),
                                verticalSpacing,
                                Text(
                                  cartItem!.quantity.toString(),
                                  style: const TextStyle(fontSize: 18.0),
                                )
                              ],
                            )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
    }
  }
}

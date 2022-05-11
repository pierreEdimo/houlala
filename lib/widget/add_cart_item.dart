import 'package:flutter/material.dart';
import 'package:houlala/model/add_cart_item.dart';
import 'package:houlala/service/cart_item_service.dart';
import 'package:provider/provider.dart';

addToCart(
  BuildContext context,
  int quantity,
  String? userId,
  String? productId,
  int totalPrice,
    String? pageId,
) async {
  AddCartItem newCart = AddCartItem(
      userId: userId,
      productId: productId,
      quantity: quantity,
      pageId: pageId,
      totalPrice: totalPrice);

  await Provider.of<CartItemService>(context, listen: false).addToCart(newCart);
}

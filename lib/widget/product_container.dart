import 'dart:io';

import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/main.dart';
import 'package:houlala/model/add_order.dart';
import 'package:houlala/model/cart_item.dart';
import 'package:houlala/model/product.dart';
import 'package:houlala/service/order_service.dart';
import 'package:houlala/service/product_service.dart';
import 'package:houlala/widget/background_image.dart';
import 'package:houlala/widget/custom_card.dart';
import 'package:houlala/widget/custom_elevated_button.dart';
import 'package:houlala/widget/elevation_container.dart';
import 'package:houlala/widget/product_title.dart';
import 'package:houlala/widget/show_nack.dart';
import 'package:houlala/widget/transparent_card.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class ProductContainer extends StatelessWidget {
  final Product? product;
  final String? displayType;

  const ProductContainer({
    Key? key,
    this.product,
    this.displayType,
  }) : super(key: key);

  /// ajoute les produits dans le panier
  addProductToCart(int price, int quantity, BuildContext context) async {
    String? userId = await storage.read(key: "userId");

    if (userId != null) {
      List<CartItem>? cartItems = <CartItem>[];

      CartItem item = CartItem(
          productSku: product!.productSku!,
          price: price,
          quantity: quantity,
          name: product!.name,
          imageUrl: product!.imageUrl,
          initialPrice: product!.sellingPrice!);

      cartItems.add(item);

      AddOrder newOrder = AddOrder(
          userId: userId,
          locationId: product!.locationId!,
          cartItems: cartItems);

      Response response =
          await Provider.of<OrderService>(context, listen: false)
              .addOrder(newOrder);

      if (response.statusCode == HttpStatus.created) {
        showSnack(const Text("Produit a ete ajoute dans le panier "), context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    late int quantity = 1;
    int price = quantity > 1
        ? Provider.of<ProductService>(context).getTotalPrice()
        : product!.sellingPrice!;
    switch (displayType) {
      case 'favories':
        return CustomCard(
          padding: EdgeInsets.zero,
          child: Row(
            children: [
              Expanded(
                child: BackgroundImage(
                  imageUrl: product!.imageUrl!,
                ),
              ),
              horizontalSpacing,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: ProductTitle(
                        title: product!.name!,
                        maxLines: 2,
                      ),
                    ),
                    Text(
                      '${price.toString()} FCFA',
                    ),
                    verticalSpacing,
                    CustomElevatedButton(
                      child: const Text("Ajouter au Panier"),
                      onPressed: () async =>
                          addProductToCart(price, quantity, context),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      default:
        return TransparentCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: ElevationContainer(
                  child: BackgroundImage(
                    imageUrl: product!.imageUrl!,
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: ProductTitle(
                  title: product!.name!,
                  maxLines: 1,
                ),
              ),
              Text(
                '${product!.sellingPrice!.toString()} FCFA',
              ),
            ],
          ),
        );
    }
  }
}

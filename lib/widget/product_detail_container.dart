import 'dart:io';

import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/model/add_order.dart';
import 'package:houlala/model/cart_item.dart';
import 'package:houlala/model/offline_order.dart';
import 'package:houlala/service/order_service.dart';
import 'package:houlala/model/product.dart';
import 'package:houlala/service/product_service.dart';
import 'package:houlala/widget/custom_elevated_button.dart';
import 'package:houlala/widget/decrease_quantity_text.dart';
import 'package:houlala/widget/increase_quantity_text.dart';
import 'package:houlala/widget/markdown_container.dart';
import 'package:houlala/widget/quantity_container.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import '../main.dart';
import 'book_marker.dart';

class ProductDetailContainer extends StatefulWidget {
  final String? sku;

  const ProductDetailContainer({Key? key, this.sku}) : super(key: key);

  @override
  State<ProductDetailContainer> createState() => _ProductDetailContainerState();
}

class _ProductDetailContainerState extends State<ProductDetailContainer> {
  late int quantity = 1;

  /// Ajoute les produits dans le panier
  addToCart(Product foundProduct, int price) async {
    String? userId = await storage.read(key: "userId");

    if (userId != null) {
      CartItem newItem = CartItem(
        price: price,
        productSku: foundProduct.productSku,
        quantity: quantity,
        imageUrl: foundProduct.imageUrl,
        name: foundProduct.name,
        initialPrice: foundProduct.sellingPrice,
      );
      List<CartItem> items = <CartItem>[];
      items.add(newItem);

      AddOrder newOrder = AddOrder(
        userId: userId,
        locationId: foundProduct.locationId,
        cartItems: items,
      );

      Response response =
          await Provider.of<OrderService>(context, listen: false)
              .addOrder(newOrder);
      if (response.statusCode == HttpStatus.created) {
      }
    } else {
      CartItem item = CartItem(
        productSku: foundProduct.productSku,
        price: price,
        name: foundProduct.name,
        imageUrl: foundProduct.imageUrl,
        quantity: quantity,
        initialPrice: foundProduct.sellingPrice,
      );

      List<CartItem> items = <CartItem>[];
      items.add(item);

      OfflineOrder order = OfflineOrder(
        locationName: foundProduct.locationName,
        locationId: foundProduct.locationId,
        cartItems: items,
        totalQuantity: quantity,
        totalPrice: price,
      );

      Provider.of<OrderService>(context, listen: false).addOfflineOrder(order);
    }
  }

  //reduit la quantite de produit dans le panier
  decreaseQuantity(BuildContext context, int sellingPrice) {
    setState(() {
      if (quantity > 1) {
        quantity -= 1;
      }
    });
    Provider.of<ProductService>(context, listen: false)
        .calculatePrice(sellingPrice, quantity);
  }

//augmente la quantite de produit dans le panier
  inCreaseQuantity(BuildContext context, int sellingPrice) {
    setState(() {
      quantity += 1;
    });
    Provider.of<ProductService>(context, listen: false)
        .calculatePrice(sellingPrice, quantity);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          Provider.of<ProductService>(context).fetchSingleProduct(widget.sku!),
      builder: (context, AsyncSnapshot<Product> snapshot) {
        if (snapshot.hasData) {
          Product foundProduct = snapshot.data!;
          int price = quantity > 1
              ? Provider.of<ProductService>(context).getTotalPrice()
              : foundProduct.sellingPrice!;
          return SingleChildScrollView(
            child: Column(
              children: [
                StandardCustomContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            image: DecorationImage(
                              image: NetworkImage(foundProduct.imageUrl!),
                              fit: BoxFit.cover,
                            )),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        children: [
                          const Text("Vendeur:"),
                          const SizedBox(width: 10),
                          Text(
                            foundProduct.locationName!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "PoppinsBold"),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${price.toString()} XAF",
                            style: const TextStyle(
                                fontSize: 18, fontFamily: 'PoppinsBold'),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () => decreaseQuantity(
                                      context, foundProduct.sellingPrice!),
                                  child: const DecreaseQuantityText(),
                                ),
                                const SizedBox(
                                  width: 25.0,
                                ),
                                QuantityContainer(
                                  quantity: quantity,
                                ),
                                const SizedBox(
                                  width: 25.0,
                                ),
                                InkWell(
                                  onTap: () => inCreaseQuantity(
                                      context, foundProduct.sellingPrice!),
                                  child: const InCreaseQuantityText(),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      CustomElevatedButton(
                        hasBorder: false,
                        onPressed: () async => addToCart(foundProduct, price),
                        color: Colors.orangeAccent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const ImageIcon(
                              AssetImage('images/shopping.png'),
                            ),
                            horizontalSpacing,
                            const Text("Ajouter au panier")
                          ],
                        ),
                      ),
                      verticalSpacing,
                      BookMarker(
                        foundProduct: foundProduct,
                      ),
                      verticalSpacing,
                      MarkdownContainer(
                        data: utf8.decode(
                          foundProduct.description!.runes.toList(),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

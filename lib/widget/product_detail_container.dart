import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/model/add_item.dart';
import 'package:houlala/model/add_order.dart';
import 'package:houlala/service/order_service.dart';
import 'package:houlala/widget/blur_container.dart';
import 'package:houlala/model/product.dart';
import 'package:houlala/service/product_service.dart';
import 'package:houlala/widget/background_image.dart';
import 'package:houlala/widget/custom_elevated_button.dart';
import 'package:houlala/widget/decrease_quantity_text.dart';
import 'package:houlala/widget/increase_quantity_text.dart';
import 'package:houlala/widget/markdown_container.dart';
import 'package:houlala/widget/product_detail_app_bar.dart';
import 'package:houlala/widget/quantity_container.dart';
import 'package:houlala/widget/show_nack.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:houlala/widget/transformed_container.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../main.dart';

class ProductDetailContainer extends StatefulWidget {
  final String? name;

  const ProductDetailContainer({Key? key, this.name}) : super(key: key);

  @override
  State<ProductDetailContainer> createState() => _ProductDetailContainerState();
}

class _ProductDetailContainerState extends State<ProductDetailContainer> {
  late int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<ProductService>(context)
            .fetchSingleProduct(widget.name!),
        builder: (context, AsyncSnapshot<Product> snapshot) {
          if (snapshot.hasData) {
            Product foundProduct = snapshot.data!;
            int price = quantity > 1
                ? Provider.of<ProductService>(context).getTotalPrice()
                : foundProduct.sellingPrice!;
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: 35.h,
                              child: BackgroundImage(
                                borderRadius: 0,
                                imageUrl: foundProduct.imageUrl!,
                              ),
                            ),
                            const BlurContainer(),
                            SizedBox(
                              height: 30.h,
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  foundProduct.name!,
                                  style: detailTitleStyle,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: !kIsWeb ? null : 70.0,
                              child: ProductDetailAppBar(
                                product: foundProduct,
                              ),
                            ),
                          ],
                        ),
                        TransformedContainer(
                          color: const Color(0xf2f2f2f2),
                          child: StandardCustomContainer(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(),
                                    Container(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (quantity > 1) {
                                                  quantity -= 1;
                                                }
                                              });
                                              Provider.of<ProductService>(
                                                      context,
                                                      listen: false)
                                                  .calculatePrice(
                                                      foundProduct
                                                          .sellingPrice!,
                                                      quantity);
                                            },
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
                                            onTap: () {
                                              setState(() {
                                                quantity += 1;
                                              });
                                              Provider.of<ProductService>(
                                                      context,
                                                      listen: false)
                                                  .calculatePrice(
                                                      foundProduct
                                                          .sellingPrice!,
                                                      quantity);
                                            },
                                            child: const InCreaseQuantityText(),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                verticalSpacing,
                                MarkdownContainer(
                                  data: foundProduct.description!,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17.0,
                    vertical: 5.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Prix Total",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            price.toString() + "FCFA",
                            style: standardStyle,
                          ),
                        ],
                      ),
                      CustomElevatedButton(
                        onPressed: () async {
                          String? userId = await storage.read(key: "userId");

                          if (userId != null) {
                            AddItem newItem = AddItem(
                              price: price,
                              productSku: foundProduct.productSku,
                              quantity: quantity,
                              initialPrice: foundProduct.sellingPrice
                            );

                            List<AddItem> items = <AddItem>[];

                            items.add(newItem);

                            AddOrder newOrder = AddOrder(
                                userId: userId,
                                locationId: foundProduct.locationId,
                                cartItems: items);

                            Response response = await Provider.of<OrderService>(
                                    context,
                                    listen: false)
                                .addOrder(newOrder);

                            if (response.statusCode == 201) {
                              showSnack(
                                  const Text("Article a ete ajoute au Panier"),
                                  context);
                            }
                          } else {
                            showSnack(
                                const Text("Article a ete ajoute au Panier"),
                                context);
                          }
                        },
                        child: Text(
                          "Ajouter au Panier",
                          style: standardStyle,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

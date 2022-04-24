import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/model/found_product.dart';
import 'package:houlala/service/product_service.dart';
import 'package:houlala/widget/add_cart_item.dart';
import 'package:houlala/widget/background_image.dart';
import 'package:houlala/widget/custom_elevated_button.dart';
import 'package:houlala/widget/display_dialog.dart';
import 'package:houlala/widget/product_detail_app_bar.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:houlala/widget/transformed_container.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class ProductDetailContainer extends StatefulWidget {
  final String? id;

  const ProductDetailContainer({Key? key, this.id}) : super(key: key);

  @override
  State<ProductDetailContainer> createState() => _ProductDetailContainerState();
}

class _ProductDetailContainerState extends State<ProductDetailContainer> {
  late int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future:
            Provider.of<ProductService>(context).fetchSingleProduct(widget.id!),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            FoundProduct foundProduct = snapshot.data!;
            int price = quantity > 1
                ? Provider.of<ProductService>(context).getTotalPrice()
                : foundProduct.product!.initialPrice!;
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: BackgroundImage(
                                imageUrl: foundProduct.product!.imageUrl!,
                              ),
                            ),
                            ProductDetailAppBar(
                              product: foundProduct,
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
                                    Flexible(
                                      child: Text(
                                        foundProduct.product!.name!,
                                        style: detailTitleStyle,
                                      ),
                                    ),
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
                                                      foundProduct.product!
                                                          .initialPrice!,
                                                      quantity);
                                            },
                                            child: const Text(
                                              "-",
                                              style: TextStyle(
                                                  fontSize: 28.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 25.0,
                                          ),
                                          Text(
                                            quantity.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
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
                                                      foundProduct.product!
                                                          .initialPrice!,
                                                      quantity);
                                            },
                                            child: const Text(
                                              "+",
                                              style: TextStyle(
                                                fontSize: 28.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Markdown(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: const ClampingScrollPhysics(),
                                  data: foundProduct.product!.description!,
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
                    horizontal: 15.0,
                    vertical: 10.0,
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
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                fontFamily: 'PoppinsBold'),
                          ),
                        ],
                      ),
                      CustomElevatedButton(
                        onPressed: () async {
                          String? userId = await storage.read(key: "userId");

                          if (userId != null) {
                            addToCart(
                              context,
                              quantity,
                              userId,
                              foundProduct.product!.id!,
                              price,
                            );
                          } else {
                            showErrorDialog(context, "Erreur",
                                "Desole vous devez etre connecte pour achter des produits sur Houlala");
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

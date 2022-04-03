import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/model/product.dart';
import 'package:houlala/service/product_service.dart';
import 'package:houlala/widget/background_image.dart';
import 'package:houlala/widget/custom_elevated_button.dart';
import 'package:houlala/widget/product_detail_app_bar.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:houlala/widget/transformed_container.dart';
import 'package:provider/provider.dart';

class ProductDetailContainer extends StatefulWidget {
  final String? uri;
  final String? id;

  const ProductDetailContainer({Key? key, this.uri, this.id}) : super(key: key);

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
            .fetchSingleProduct(widget.uri!),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            Product product = snapshot.data!;
            int price = quantity > 1
                ? Provider.of<ProductService>(context).getTotalPrice()
                : product.initialPrice!;
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
                                imageUrl: product.imageUrl!,
                              ),
                            ),
                            ProductDetailAppBar(),
                          ],
                        ),
                        TransformedContainer(
                          color: const Color(0xf2f2f2f2),
                          child: StandardCustomContainer(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      product.name!,
                                      style: detailTitleStyle,
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
                                                      product.initialPrice!,
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
                                                      product.initialPrice!,
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
                                  data: product.description!,
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
                        onPressed: () => {},
                        child: const Text(
                          "Ajouter au Panier",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'PoppinsBold',
                              fontSize: 18.0),
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

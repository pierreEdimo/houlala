import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/controllers/product_controller.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/models/product/product_model.dart';
import 'package:houlala/shared_widgets/custom_body_container.dart';
import 'package:houlala/widget/custom_elevated_button.dart';
import 'package:houlala/widget/decrease_quantity_text.dart';
import 'package:houlala/widget/increase_quantity_text.dart';
import 'package:houlala/widget/markdown_container.dart';
import 'package:houlala/widget/quantity_container.dart';
import '../widget/custom_button_container.dart';
import 'package:heroicons/heroicons.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  static const routeName = '/product_detail';

  const ProductDetailScreen({super.key});

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  final ValueNotifier<bool> isLoading$ = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _updateLoading();
  }

  void _updateLoading() {
    Future.delayed(const Duration(seconds: 1), () async {
      isLoading$.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ProductController productController = ProductController(ref);
    ProductModel? selectedProduct = productController.selectedProduct;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomButtonContainer(
          icon: const FaIcon(FontAwesomeIcons.angleLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: isLoading$,
        builder: (context, value, child) {
          if (value != true) {
            return CustomBodyContainer(
              loading: false,
              error: productController.hasError,
              errorMessage: productController.errorMessage,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        selectedProduct!.name!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Container(
                        height: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                                image: NetworkImage(selectedProduct.imageUrl!),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(height: 20.0),
                      RichText(
                          text: TextSpan(
                              text: 'Vendu par: ',
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                            TextSpan(
                              text: selectedProduct.locationName,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )
                          ])),
                      const SizedBox(height: 8.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${selectedProduct.sellingPrice} XAF",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  productController.decreaseProductQuantity();
                                },
                                child: const DecreaseQuantityText(),
                              ),
                              const SizedBox(width: 25.0),
                              QuantityContainer(
                                  quantity: selectedProduct.availableQuantity),
                              const SizedBox(width: 25.0),
                              InkWell(
                                onTap: () {
                                  productController.increaseProductQuantity();
                                },
                                child: const InCreaseQuantityText(),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      CustomElevatedButton(
                        hasBorder: false,
                        onPressed: () {},
                        color: Colors.orangeAccent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const HeroIcon(HeroIcons.shoppingBag),
                            horizontalSpacing,
                            const Text('Ajouter au panier')
                          ],
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      CustomElevatedButton(
                        onPressed: () => productController
                            .bookMarkProduct(selectedProduct.id!),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            selectedProduct.bookMarked!
                                ? const HeroIcon(
                                    HeroIcons.heart,
                                    style: HeroIconStyle.solid,
                                    color: Colors.red,
                                  )
                                : const HeroIcon(
                                    HeroIcons.heart,
                                  ),
                            horizontalSpacing,
                            const Text('Ajouter aux Favoris')
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      MarkdownContainer(
                        data: utf8.decode(
                            selectedProduct.description!.runes.toList()),
                      )
                    ],
                  ),
                ),
              ),
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

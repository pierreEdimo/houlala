import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:houlala/controllers/product_controller.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/models/product/product_model.dart';
import 'package:houlala/shared_widgets/grid_product.dart';
import 'package:houlala/shared_widgets/custom_column_container.dart';
import 'package:houlala/shared_widgets/markdown_container.dart';
import '../models/location/location_model.dart';

class PageHomeContainer extends ConsumerWidget {
  final LocationModel? pageModel;

  const PageHomeContainer({super.key, this.pageModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductController productController = ProductController(ref);
    List<ProductModel> productList = productController
        .getProductssListsByLocationWithLimit(pageModel!.name!, 4);

    return Column(
      children: [
        CustomColumnContainer(
          title:  Text(
            'A propos',
            style: GoogleFonts.jetBrainsMono(
              textStyle: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold
              )
            ),
          ),
          child: MarkdownContainer(
            data: utf8.decode(pageModel!.shortDescription!.runes.toList()),
          ),
        ),
        standardSizedBox,
        CustomColumnContainer(
          title: Text(
            'Quelques produits par ${pageModel!.name!}',
            style: GoogleFonts.jetBrainsMono(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0
              )
            ),
          ),
          child: GridOfProducts(
            shrinkWrap: true,
            productList: productList,
            physics: const ClampingScrollPhysics(),
          ),
        )
      ],
    );
  }
}

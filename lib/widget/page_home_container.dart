import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:houlala/controllers/product_controller.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/models/product/product_model.dart';
import 'package:houlala/shared_widgets/product_container.dart';
import 'package:houlala/widget/custom_column_container.dart';
import 'package:houlala/widget/markdown_container.dart';
import '../models/location/location_model.dart';

class PageHomeContainer extends ConsumerWidget {
  final LocationModel? pageModel;

  const PageHomeContainer({Key? key, this.pageModel}) : super(key: key);

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
            style: GoogleFonts.poppins(
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
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0
              )
            ),
          ),
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            childAspectRatio: 1 / 1.2,
            children: productList
                .map(
                  (product) => ProductContainer(
                    productModel: product,
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}

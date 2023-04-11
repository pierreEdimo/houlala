import 'package:flutter/material.dart';
import 'package:houlala/widget/product_container.dart';

import '../model/product.dart';
import '../screens/product_detail_screen.dart';
import 'no_items.dart';

class GridList extends StatelessWidget {
  final List<Product>? products;
  final int? crossAxisCount;
  final double? widthRatio;
  final double? heightRatio;
  final String? textError;
  final double? height;
  final String? displayType;

  const GridList({
    Key? key,
    this.products,
    this.heightRatio,
    this.widthRatio,
    this.crossAxisCount,
    this.textError,
    this.height,
    this.displayType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return products!.isEmpty
        ? VerticalNoItem(
      height: height,
      radius: 60,
      imageAsset: 'images/stock.png',
      errorMessage: textError,
    )
        : GridView.count(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const ClampingScrollPhysics(),
      crossAxisCount: crossAxisCount!,
      scrollDirection: Axis.vertical,
      childAspectRatio: (widthRatio! / heightRatio!),
      children: products!
          .map(
            (Product product) => InkWell(
          onTap: () => Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            arguments: product.name!,
          ),
          child: ProductContainer(
            product: product,
            displayType: displayType,
          ),
        ),
      )
          .toList(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:houlala/models/product/product_model.dart';
import 'package:houlala/shared_widgets/grid_product.dart';

class ProductColumn extends StatelessWidget {
  final Widget? title;
  final List<ProductModel>? productList;

  const ProductColumn({
    super.key,
    this.title,
    this.productList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        title!,
        const SizedBox(height: 10.0),
        GridOfProducts(
          shrinkWrap: true,
          productList: productList,
          physics: const ClampingScrollPhysics(),
        )
      ],
    );
  }
}

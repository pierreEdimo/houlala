import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:houlala/models/product/product_model.dart';
import 'package:houlala/shared_widgets/product_container.dart';

class GridOfProducts extends StatelessWidget {
  final List<ProductModel>? productList;
  final bool? shrinkWrap;
  final ScrollPhysics? physics;

  const GridOfProducts({
    super.key,
    this.productList,
    @Default(false) this.shrinkWrap,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: shrinkWrap!,
      physics: physics,
      childAspectRatio: 1 / 1.2,
      children: productList!
          .map(
            (product) => ProductContainer(
              productModel: product,
            ),
          )
          .toList(),
    );
  }
}

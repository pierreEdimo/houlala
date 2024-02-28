import 'package:flutter/material.dart';
import 'package:houlala/models/product/product_model.dart';
import 'package:houlala/shared_widgets/product_column.dart';

class SearchProductBody extends StatelessWidget {
  final List<ProductModel>? productList;

  const SearchProductBody({
    super.key,
    this.productList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: ProductColumn(
        title: Text('${productList!.length} produits trouves'),
        productList: productList,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:houlala/widget/grid_of_products.dart';

class PageProductContainer extends StatelessWidget {
  final String? uri;

  const PageProductContainer({Key? key, this.uri}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridOfProducts(
      scrollDirection: Axis.vertical,
      crossAxisCount: 2,
      uri: uri!,
      heightRatio: 1.35,
      widthRatio: 1,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:houlala/widget/grid_of_products.dart';

class PageProductContainer extends StatelessWidget {
  final String? uri;
  final String? textError;

  const PageProductContainer({
    Key? key,
    this.uri,
    this.textError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridOfProducts(
      height: MediaQuery.of(context).size.height * 0.25,
      textError: textError,
      scrollDirection: Axis.vertical,
      uri: uri!,
      heightRatio: 1.35,
      widthRatio: 1,
      crossAxisCount: 2,
    );
  }
}

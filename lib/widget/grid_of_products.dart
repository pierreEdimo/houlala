import 'package:flutter/material.dart';
import 'package:houlala/service/product_service.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';
import 'filter_products_in_page.dart';
import 'grid_list.dart';

class GridOfProducts extends StatelessWidget {
  final String? uri;
  final int? crossAxisCount;
  final double? widthRatio;
  final double? heightRatio;
  final Widget? child;
  final String? textError;
  final double? height;
  final String? displayType;
  final String? origin;

  const GridOfProducts(
      {Key? key,
      this.uri,
      this.crossAxisCount,
      this.widthRatio,
      this.heightRatio,
      this.child,
      this.textError,
      this.displayType,
      this.origin,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<ProductService>(context).fetchProducts(uri!),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Product> products = snapshot.data!;

            switch (origin) {
              case "Location":
                return FilterProductsInPage(
                  products: products,
                  crossAxisCount: crossAxisCount,
                  height: height,
                  textError: textError,
                  heightRatio: heightRatio,
                  widthRatio: widthRatio,
                  displayType: displayType,
                );
              default:
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    child != null ? child! : Container(),
                    GridList(
                      products: products,
                      displayType: displayType,
                      heightRatio: heightRatio,
                      widthRatio: widthRatio,
                      crossAxisCount: crossAxisCount,
                      height: height,
                      textError: textError,
                    )
                  ],
                );
            }
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}




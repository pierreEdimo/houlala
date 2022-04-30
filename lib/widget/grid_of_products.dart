import 'package:flutter/material.dart';
import 'package:houlala/screens/product_detail_screen.dart';
import 'package:houlala/service/product_service.dart';
import 'package:houlala/widget/product_container.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';

class GridOfProducts extends StatelessWidget {
  final String? uri;
  final Axis? scrollDirection;
  final int? crossAxisCount;
  final double? widthRatio;
  final double? heightRatio;
  final Widget? child;
  final String? textError;
  final double? height;
  final String? displayType;

  const GridOfProducts(
      {Key? key,
      this.uri,
      this.scrollDirection,
      this.crossAxisCount,
      this.widthRatio,
      this.heightRatio,
      this.child,
      this.textError,
      this.displayType,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<ProductService>(context).fetchProducts(uri!),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Product> products = snapshot.data!;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                child != null ? child! : Container(),
                scrollDirection! == Axis.horizontal
                    ? Expanded(
                        child: GridList(
                        products: products,
                        heightRatio: heightRatio,
                        widthRatio: widthRatio,
                        scrollDirection: scrollDirection,
                        crossAxisCount: crossAxisCount,
                        height: height,
                        textError: textError,
                      ))
                    : GridList(
                        products: products,
                        displayType: displayType,
                        heightRatio: heightRatio,
                        widthRatio: widthRatio,
                        scrollDirection: scrollDirection,
                        crossAxisCount: crossAxisCount,
                        height: height,
                        textError: textError,
                      )
              ],
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}

class GridList extends StatelessWidget {
  final List<Product>? products;
  final Axis? scrollDirection;
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
    this.scrollDirection,
    this.textError,
    this.height,
    this.displayType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return products!.isEmpty
        ? SizedBox(
            height: height,
            child: Center(
              child: Text(
                textError!,
                textAlign: TextAlign.center,
              ),
            ),
          )
        : GridView.count(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            crossAxisCount: crossAxisCount!,
            scrollDirection: scrollDirection!,
            childAspectRatio: (widthRatio! / heightRatio!),
            children: products!
                .map(
                  (Product product) => InkWell(
                    onTap: () => Navigator.of(context).pushNamed(
                      ProductDetailScreen.routeName,
                      arguments: product.id!,
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

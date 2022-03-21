import 'package:flutter/material.dart';
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

  const GridOfProducts({
    Key? key,
    this.uri,
    this.scrollDirection,
    this.crossAxisCount,
    this.widthRatio,
    this.heightRatio,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<ProductService>(context).fetchProducts(uri!),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
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
                      ))
                    : GridList(
                        products: products,
                        heightRatio: heightRatio,
                        widthRatio: widthRatio,
                        scrollDirection: scrollDirection,
                        crossAxisCount: crossAxisCount,
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

  const GridList({
    Key? key,
    this.products,
    this.heightRatio,
    this.widthRatio,
    this.crossAxisCount,
    this.scrollDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return products!.isEmpty
        ? SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: const Center(
              child: Text(
                "il n'y a pas encore de produits \n "
                "svp reessayez plutard",
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
                  (Product product) => ProductContainer(
                    product: product,
                  ),
                )
                .toList(),
          );
  }
}

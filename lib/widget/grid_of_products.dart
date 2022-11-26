import 'package:flutter/material.dart';
import 'package:houlala/screens/product_detail_screen.dart';
import 'package:houlala/service/product_service.dart';
import 'package:houlala/widget/custom_avatar.dart';
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
  final String? origin;

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
                  scrollDirection: scrollDirection,
                  displayType: displayType,
                );
              default:
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomAvatar(
                    radius: 50,
                    localAsset: "images/stock.png",
                  ),
                  Text(
                    textError!,
                    textAlign: TextAlign.center,
                  ),
                ],
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

class FilterProductsInPage extends StatefulWidget {
  final List<Product>? products;
  final String? displayType;
  final double? heightRatio;
  final double? widthRatio;
  final Axis? scrollDirection;
  final double? height;
  final String? textError;
  final int? crossAxisCount;

  const FilterProductsInPage({
    Key? key,
    this.products,
    this.displayType,
    this.heightRatio,
    this.widthRatio,
    this.scrollDirection,
    this.height,
    this.textError,
    this.crossAxisCount,
  }) : super(key: key);

  @override
  State<FilterProductsInPage> createState() => _FilterProductsInPageState();
}

class _FilterProductsInPageState extends State<FilterProductsInPage> {
  List<Product>? filteredProducts = <Product>[];

  @override
  void initState() {
    super.initState();
    filteredProducts = widget.products;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.8),
          child: TextFormField(
            textInputAction: TextInputAction.search,
            onChanged: (value) {
              setState(() {
                filteredProducts = widget.products!
                    .where((element) => element.name!
                        .toLowerCase()
                        .contains(value.toLowerCase()))
                    .toList();
              });
            },
            decoration: InputDecoration(
                hintText: "Rechercher",
                fillColor: const Color(0xfff2f2f2),
                filled: true,
                hintStyle: const TextStyle(
                  color: Color(0xff000000),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none
                  )
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xff000000),
                )),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        GridList(
          products: filteredProducts,
          displayType: widget.displayType,
          heightRatio: widget.heightRatio,
          widthRatio: widget.widthRatio,
          scrollDirection: widget.scrollDirection,
          crossAxisCount: widget.crossAxisCount,
          height: widget.height,
          textError: widget.textError,
        )
      ],
    );
  }
}

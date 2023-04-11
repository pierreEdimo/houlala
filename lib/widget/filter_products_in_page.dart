import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';

import '../model/product.dart';
import 'grid_list.dart';

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
        verticalSpacing,
        Padding(
          padding: const EdgeInsets.all(5.0),
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
                fillColor: lightgrey,
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                filled: true,
                hintStyle: const TextStyle(
                  color: Color(0xff000000),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide:
                  const BorderSide(width: 0, style: BorderStyle.none),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xff000000),
                )),
          ),
        ),
        verticalSpacing,
        GridList(
          products: filteredProducts,
          displayType: widget.displayType,
          heightRatio: widget.heightRatio,
          widthRatio: widget.widthRatio,
          crossAxisCount: widget.crossAxisCount,
          height: widget.height,
          textError: widget.textError,
        )
      ],
    );
  }
}

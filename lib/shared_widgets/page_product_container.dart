import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houlala/controllers/product_controller.dart';
import 'package:houlala/models/page_result_args/page_result_args.dart';
import 'package:houlala/models/product/product_model.dart';
import 'package:houlala/screens/page_result_screen.dart';
import '../helper/constants.dart';
import 'product_container.dart';

class PageProductContainer extends ConsumerWidget {
  final String? locationName;

  const PageProductContainer({super.key, this.locationName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductController productController = ProductController(ref);
    List<ProductModel> productList =
        productController.getProductListsByLocation(locationName!);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.search,
            onFieldSubmitted: (value) => Navigator.of(context).pushNamed(
              PageResultScreen.routeName,
              arguments:
                  PageResultArgs(locationName: locationName, keyWord: value),
            ),
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
          const SizedBox(height: 20.0),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            childAspectRatio: 1 / 1.2,
            children: productList
                .map((product) => ProductContainer(
                      productModel: product,
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:houlala/model/product_detail_args.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/product_detail_container.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product_detail';

  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productDetails = ModalRoute.of(context)!.settings.arguments as ProductDetailArgs;
    return  Scaffold(
      appBar:  AppBarWithReturn(
        color: Colors.transparent,
        elevation: 1,
        title: "${productDetails.name}",
      ),
      body: ProductDetailContainer(
        sku: productDetails.sku,
      ),
    );
  }
}

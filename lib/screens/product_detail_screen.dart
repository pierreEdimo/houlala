import 'package:flutter/material.dart';
import 'package:houlala/widget/product_detail_container.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product_detail';

  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(context)!.settings.arguments as String;
    return  Scaffold(
      body: ProductDetailContainer(
        name: name,
      ),
    );
  }
}

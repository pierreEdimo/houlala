import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houlala/providers/product_provider.dart';
import 'package:houlala/screens/product_detail_screen.dart';

import '../models/product/product_model.dart';

class ProductController {
  WidgetRef ref;

  ProductController(this.ref);

  List<ProductModel> getProductListsByLocationId(String locationId) {
    return ref
        .watch(productStateNotifierProvider)
        .productList
        .where((element) => identical(element.locationId, locationId))
        .toList();
  }

  List<ProductModel> getProductListsByCategoryName(String name) {
    return ref
        .watch(productStateNotifierProvider)
        .productList
        .where((element) =>
            element.categoryName!.toLowerCase().compareTo(name.toLowerCase()) ==
            0)
        .toList();
  }

  void selectProduct(String sku, BuildContext context) {
    ref.read(productStateNotifierProvider.notifier).selectProduct(sku);
    Navigator.of(context).pushNamed(ProductDetailScreen.routeName);
  }

  ProductModel? get selectedProduct {
    return ref.watch(productStateNotifierProvider).selectedProduct;
  }

  bool get hasError {
    return ref.watch(productStateNotifierProvider).error;
  }

  bool get isLoading {
    return ref.watch(productStateNotifierProvider).loading;
  }

  String get errorMessage {
    return ref.watch(productStateNotifierProvider).errorMessage;
  }

  void increaseProductQuantity() {
    ref.read(productStateNotifierProvider.notifier).increaseProductQuantity();
  }

  void decreaseProductQuantity() {
    ref.read(productStateNotifierProvider.notifier).decreaseProductQuantity();
  }

  void bookMarkProduct(int id) {
    ref.read(productStateNotifierProvider.notifier).bookMarkProduct(id);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houlala/providers/product_provider.dart';
import 'package:houlala/screens/product_detail_screen.dart';

import '../models/product/product_model.dart';

class ProductController {
  WidgetRef ref;

  ProductController(this.ref);

  List<ProductModel> getProductListsByLocationId(String locationId) {
    return productList
        .where((element) => identical(element.locationId, locationId))
        .toList();
  }

  List<ProductModel> getProductListsByLocation(String locationName) {
    return productList
        .where((element) =>
            element.locationName!
                .toLowerCase()
                .compareTo(locationName.toLowerCase()) ==
            0)
        .toList();
  }

  List<ProductModel> getProductssListsByLocationWithLimit(
      String locationName, int limit) {
    return getProductListsByLocation(locationName).take(limit).toList();
  }

  List<ProductModel> getFilteredProductByLocation(
      String locationName, String keyWord) {
    return getProductListsByLocation(locationName)
        .where((element) =>
            element.name!.toLowerCase().contains(keyWord.toLowerCase()))
        .toList();
  }

  List<ProductModel> getFilteredProductByName(String searchWord) {
    return productList
        .where((element) =>
            element.name!.toLowerCase().contains(searchWord.toLowerCase()))
        .toList();
  }

  List<ProductModel> getProductListsByCategoryName(String name) {
    return productList
        .where((element) =>
            element.categoryName!.toLowerCase().compareTo(name.toLowerCase()) ==
            0)
        .toList();
  }

  List<ProductModel> getProductListsByCategoryNameAndSubCategoryName(
      String name, String subCategoryName) {
    return getProductListsByCategoryName(name)
        .where((element) =>
            element.subCategoryName!
                .toLowerCase()
                .compareTo(subCategoryName.toLowerCase()) ==
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

  List<ProductModel> get productList {
    return ref.watch(productStateNotifierProvider).productList;
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

import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houlala/models/product/product_model.dart';
import 'package:houlala/repositories/product/product_repository.dart';
import 'package:houlala/state/product/product_model.state.dart';
import 'package:http/http.dart';

final productRepositoryProvider =
    Provider<ProductRepository>((ref) => ProductRepository());

final productStateNotifierProvider =
    StateNotifierProvider<ProductStateNotifier, ProductModelState>(
        (ref) => ProductStateNotifier(ref.watch(productRepositoryProvider)));

class ProductStateNotifier extends StateNotifier<ProductModelState> {
  final ProductRepository productRepository;

  ProductStateNotifier(this.productRepository) : super(ProductModelState()) {
    loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      state = state.copyWith(loading: true);
      List<ProductModel> productList = await productRepository.fetchProducts();
      state = state.copyWith(productList: productList, loading: false);
    } catch (e) {
      state = state.copyWith(
          error: true,
          errorMessage:
              "impossible d'avoir acces aux produits. svp reessayez plutard");
    }
  }

  Future<void> selectProduct(String sku) async {
    try {
      ProductModel selectedProduct =
          await productRepository.fetchSingleProduct(sku);
      state = state.copyWith(selectedProduct: selectedProduct, loading: false);
    } catch (e) {
      state = state.copyWith(
          error: true,
          errorMessage:
              "Le produit n'a pas ete retouve, svp reessayez plutard");
    }
  }

  Future<void> increaseProductQuantity() async {
    ProductModel selectedProduct = state.selectedProduct!;
    int updatedQuantity = selectedProduct.availableQuantity! + 1;
    selectedProduct =
        selectedProduct.copyWith(availableQuantity: updatedQuantity);
    state = state.copyWith(selectedProduct: selectedProduct);
  }

  Future<void> decreaseProductQuantity() async {
    int updatedQuantity = 1;
    ProductModel selectedProduct = state.selectedProduct!;
    if (selectedProduct.availableQuantity! > 1) {
      updatedQuantity = selectedProduct.availableQuantity! - 1;
    }
    selectedProduct =
        selectedProduct.copyWith(availableQuantity: updatedQuantity);
    state = state.copyWith(selectedProduct: selectedProduct);
  }

  Future<void> bookMarkProduct(int id) async {
    try {
      Response response = await productRepository.bookMarkProduct(id);
      if (response.statusCode != HttpStatus.internalServerError) {
        ProductModel selectedProduct = state.selectedProduct!;
        selectedProduct =
            selectedProduct.copyWith(bookMarked: !selectedProduct.bookMarked!);
        state = state.copyWith(selectedProduct: selectedProduct);
      }
    } catch (e) {
      state = state.copyWith(
          error: true,
          errorMessage:
              "impossible d'ajouter le produit  aux favoris. svp reessayez plutard");
    }
  }
}

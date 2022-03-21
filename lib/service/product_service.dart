import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:houlala/model/product.dart';
import 'package:http/http.dart';

class ProductService extends ChangeNotifier {
  late int _totalPrice = 0;

  Future<List<Product>> fetchProducts(String uri) async {
    var url = Uri.parse(uri);
    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<Product> products =
          body.map((dynamic product) => Product.fromJson(product)).toList();
      return products;
    } else {
      throw "No Categories";
    }
  }

  Future<Product> fetchSingleProduct(String uri) async {
    var url = Uri.parse(uri);

    Response response = await get(url);

    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw "No Product found";
    }
  }

  int getTotalPrice() {
    return _totalPrice;
  }

  void calculatePrice(int productPrice, int quantity) {
    if (quantity > 1) {
      _totalPrice = productPrice * quantity;
      notifyListeners();
    }
  }
}

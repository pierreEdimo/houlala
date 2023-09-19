import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/model/product.dart';
import 'package:http/http.dart';

import '../main.dart';

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
      throw "No Products";
    }
  }

  Future<Product> fetchSingleProduct(String sku) async {
    String? userId = await storage.read(key: "userId");

    var url =
        Uri.parse('${dotenv.env['PRODUCT_URL']}/$sku/users/$userId');

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

  Future<void> bookMarkProduct(int id) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};

    String? userId = await storage.read(key: "userId");

    var url = Uri.parse(
        "${dotenv.env['PRODUCT_URL']}/favorites/$id/users/$userId");
    await post(
      url,
      headers: headers,
    );
    notifyListeners();
  }
}

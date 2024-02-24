import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/main.dart';
import 'package:houlala/models/product/product_model.dart';
import 'package:houlala/repositories/product/product_repository.interface.dart';
import 'package:http/http.dart';
import 'package:http/src/response.dart';

class ProductRepository implements ProductRepositoryInterface {
  @override
  Future<Response> bookMarkProduct(int id) async {
    String? userId = await storage.read(key: 'userId');
    Response response = await post(
        Uri.parse('${dotenv.env['PRODUCT_URL']}/favorites/$id/users/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json'
        });
    return response;
  }

  @override
  Future<List<ProductModel>> fetchProducts() async {
    final Response response =
        await get(Uri.parse('${dotenv.env['PRODUCT_URL']}'));

    if (response.statusCode == HttpStatus.ok) {
      List<dynamic> body = jsonDecode(response.body);

      List<ProductModel> products = body
          .map((dynamic product) => ProductModel.fromJson(product))
          .toList();
      return products;
    } else {
      throw "there are no products available";
    }
  }

  @override
  Future<ProductModel> fetchSingleProduct(String sku) async {
    String? userId = await storage.read(key: "userId");

    Response response =
        await get(Uri.parse('${dotenv.env['PRODUCT_URL']}/$sku/users/$userId'));

    if (response.statusCode == 200) {
      return ProductModel.fromJson(jsonDecode(response.body));
    } else {
      throw "there are no products found";
    }
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/helper/user_token.helper.dart';
import 'package:houlala/models/product/product_model.dart';
import 'package:houlala/models/user_token/user_token.dart';
import 'package:houlala/repositories/product/product_repository.interface.dart';
import 'package:http/http.dart';

class ProductRepository implements ProductRepositoryInterface {
  @override
  Future<Response> bookMarkProduct(int id) async {
    UserToken? userToken = await UserTokenHelper.getUserToken()!;
    Response response = await post(
        Uri.parse(
            '${dotenv.env['PRODUCT_URL']}/favorites/$id/users/${userToken!.userId}'),
        headers: <String, String>{'Content-Type': 'application/json'});
    return response;
  }

  @override
  Future<List<ProductModel>> fetchProducts() async {
    return _fetchProducts('${dotenv.env['PRODUCT_URL']}');
  }

  @override
  Future<List<ProductModel>> fetchBookMarkedProducts() async {
    UserToken? userToken = await UserTokenHelper.getUserToken()!;
    return _fetchProducts(
        '${dotenv.env['PRODUCT_URL']}/favorites/${userToken!.userId}');
  }

  @override
  Future<ProductModel> fetchSingleProduct(String sku) async {
    UserToken? userToken = await UserTokenHelper.getUserToken()!;
    Response response = await get(Uri.parse(
        '${dotenv.env['PRODUCT_URL']}/$sku/users/${userToken?.userId}'));
    if (response.statusCode == 200) {
      return ProductModel.fromJson(jsonDecode(response.body));
    } else {
      throw "there are no products found";
    }
  }

  Future<List<ProductModel>> _fetchProducts(String url) async {
    final Response response = await get(Uri.parse(url));

    if (response.statusCode == HttpStatus.ok) {
      List<dynamic> body = jsonDecode(response.body);

      List<ProductModel> products = body
          .map((dynamic product) => ProductModel.fromJson(product))
          .toList();
      return products;
    } else {
      throw "no products";
    }
  }
}

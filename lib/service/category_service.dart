import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:houlala/model/product_category.dart';
import 'package:houlala/model/product_sub_category.dart';
import 'package:houlala/model/store_category.dart';
import 'package:http/http.dart';

class CategoryService extends ChangeNotifier {
  Future<List<CategoryModel>> fetchAllCategories(String uri) async {
    var url = Uri.parse(uri);
    Response response = await get(url);
    print(response.statusCode);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<CategoryModel> categories = body
          .map((dynamic category) => CategoryModel.fromJson(category))
          .toList();
      return categories;
    } else {
      throw "No Categories";
    }
  }

  Future<List<StoreCategory>> fetchAllDiscoveryCategories(String uri) async {
    var url = Uri.parse(uri);
    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<StoreCategory> categories = body
          .map((dynamic category) => StoreCategory.fromJson(category))
          .toList();
      return categories;
    } else {
      throw "No Categories";
    }
  }

  Future<List<ProductSubCategory>> fetchSubCategories(String uri) async {
    var url = Uri.parse(uri);
    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<ProductSubCategory> categories = body
          .map((dynamic category) => ProductSubCategory.fromJson(category))
          .toList();
      return categories;
    } else {
      throw "No Categories";
    }
  }
}

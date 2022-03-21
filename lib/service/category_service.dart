import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:houlala/model/category.dart';
import 'package:http/http.dart';

class CategoryService extends ChangeNotifier {
  Future<List<CategoryModel>> fetchAllCategories(String uri) async {
    var url = Uri.parse(uri);
    Response response = await get(url);

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
}

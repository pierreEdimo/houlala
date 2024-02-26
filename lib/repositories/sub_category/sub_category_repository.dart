import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/models/sub_category/sub_category_model.dart';
import 'package:houlala/repositories/sub_category/sub_category_repository.interface.dart';
import 'package:http/http.dart';

class SubCategoryRepository implements SubCategoryRepositoryInterface {
  @override
  Future<List<SubCategoryModel>> fetchAllSubCategories() async {
    final Response response =
        await get(Uri.parse('${dotenv.env['SUBCATEGORY_URL']}'));

    if (response.statusCode == HttpStatus.ok) {
      List<dynamic> body = jsonDecode(response.body);

      List<SubCategoryModel> categories = body
          .map((dynamic category) => SubCategoryModel.fromJson(category))
          .toList();
      return categories;
    } else {
      throw 'there are no sub-categories available';
    }
  }
}

import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/repositories/category/category_repository.interface.dart';
import 'package:http/http.dart';

import '../../models/product_category/category_model.dart';

class CategoryRepository implements CategoryRepositoryInterface {

  @override
  Future<List<CategoryModel>> fetchAllCategories() async {
    Response response = await get(Uri.parse('${dotenv.env['CATEGORY_URL']}'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<CategoryModel> categories = body
          .map((dynamic category) => CategoryModel.fromJson(category))
          .toList();

      return categories;
    } else {
      throw "Aucunes categories n'a ete trouvee";
    }
  }
}

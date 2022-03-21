import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:houlala/model/page.dart';
import 'package:http/http.dart';

class PageService extends ChangeNotifier {
  Future<List<PageModel>> fetchAllPages(String uri) async {
    var url = Uri.parse(uri);
    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<PageModel> pages =
          body.map((dynamic page) => PageModel.fromJson(page)).toList();
      return pages;
    } else {
      throw "No Categories";
    }
  }

  Future<PageModel> fetchSingleProduct(String uri) async {
    var url = Uri.parse(uri);

    Response response = await get(url);

    if (response.statusCode == 200) {
      return PageModel.fromJson(jsonDecode(response.body));
    } else {
      throw "No Product found";
    }
  }
}


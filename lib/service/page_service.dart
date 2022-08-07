import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:houlala/model/location.dart';
import 'package:http/http.dart';

class LocationService extends ChangeNotifier {
  Future<List<LocationModel>> fetchLocations(String uri) async {
    var url = Uri.parse(uri);
    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<LocationModel> pages =
          body.map((dynamic page) => LocationModel.fromJson(page)).toList();
      return pages;
    } else {
      throw "No Categories";
    }
  }

  Future<LocationModel> fetchSingleLocation(String uri) async {
    var url = Uri.parse(uri);

    Response response = await get(url);

    if (response.statusCode == 200) {
      return LocationModel.fromJson(jsonDecode(response.body));
    } else {
      throw "No Page found";
    }
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/model/add_order.dart';
import 'package:http/http.dart';

class OrderService extends ChangeNotifier {
  Future<Response> addOrder(AddOrder newOrder) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsEncode;
    jsEncode = jsonEncode(newOrder);
    var url = Uri.parse('${dotenv.env['ORDER_URL']}');
    Response response = await post(
      url,
      headers: headers,
      body: jsEncode,
    );
    print(response.statusCode);
    notifyListeners();
    return response;
  }
}

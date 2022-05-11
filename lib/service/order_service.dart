import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/model/add_order.dart';
import 'package:houlala/model/order.dart';
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
    notifyListeners();
    return response;
  }

  Future<List<Order>> fetchOrders(String uri) async {
    var url = Uri.parse(uri);
    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<Order> orders =
          body.map((dynamic order) => Order.fromJson(order)).toList();
      return orders;
    } else {
      throw "No Posts";
    }
  }
}

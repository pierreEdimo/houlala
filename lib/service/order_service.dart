import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/main.dart';
import 'package:houlala/model/add_order.dart';
import 'package:houlala/model/order.dart';
import 'package:houlala/model/user_information.dart';
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

  Future<Response> confirmCommand(UserInformation information) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsEncode;
    jsEncode = jsonEncode(information);
    var url = Uri.parse('${dotenv.env['ORDER_URL']}/confirm');
    Response response = await put(
      url,
      headers: headers,
      body: jsEncode,
    );
    notifyListeners();
    return response;
  }

  Future<List<Order>> fetchCartItems({String? uri, bool? confirmed}) async {
    var url = Uri();
    String? userId = await storage.read(key: "userId");

    if (!confirmed!) {
      if (uri == null) {
        url = Uri.parse('${dotenv.env['ORDER_URL']}/carts?userId=$userId');
      }
    } else {
      url = Uri.parse('${dotenv.env['ORDER_URL']}/confirmed?userId=$userId');
    }

    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<Order> posts =
          body.map((dynamic post) => Order.fromJson(post)).toList();
      return posts;
    } else {
      throw "No Comments";
    }
  }

  Future<void> updateQuantity(
      String? situation, String? productSku, String? orderId) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};

    var url = Uri();
    switch (situation) {
      case 'decrease':
        url = Uri.parse(
            '${dotenv.env['ORDER_URL']}/cartItems/decrease/$orderId/sku/$productSku');
        break;
      case 'increase':
      default:
        url = Uri.parse(
            '${dotenv.env['ORDER_URL']}/cartItems/increase/$orderId/sku/$productSku');
        break;
    }

    await put(
      url,
      headers: headers,
    );

    notifyListeners();
  }

  Future<void> deleteFromOrder(String? productSku, String? orderId) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};

    var url = Uri.parse(
        '${dotenv.env['ORDER_URL']}/cartItems/$orderId/sku/$productSku');

    await delete(url, headers: headers);

    notifyListeners();
  }
}

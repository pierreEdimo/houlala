import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/boxes.dart';
import 'package:houlala/main.dart';
import 'package:houlala/model/add_order.dart';
import 'package:houlala/model/cart_item.dart';
import 'package:houlala/model/offline_order.dart';
import 'package:houlala/model/order.dart';
import 'package:houlala/model/user_information.dart';
import 'package:http/http.dart';

import '../model/add_unregistered_user_order.dart';

class OrderService extends ChangeNotifier {
  final _orderBox = HiveBoxes.getOrders();

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

  Future<Response> confirmUnregisteredUserOrder(UnregisteredUserOrder? newOrder) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsEncode;
    jsEncode = jsonEncode(newOrder);
    var url = Uri.parse('${dotenv.env['ORDER_URL']}/unregistereds');
    Response response = await post(
      url,
      headers: headers,
      body: jsEncode,
    );
    print(response.statusCode);
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

  Future<List<OfflineOrder>> getOfflineOrders() async {
    List<OfflineOrder>? orders = <OfflineOrder>[];
    orders = _orderBox.values.toList();
    return orders;
  }

  void addOfflineOrder(OfflineOrder order) {
    late int? totalQuantity = 0;
    late int? totalPrice = 0;

    try {
      Iterable<OfflineOrder>? existingOrder = <OfflineOrder>[];

      existingOrder = _orderBox.values
          .toList()
          .where((element) => element.locationId == order.locationId);

      if (existingOrder.isEmpty) {
        _orderBox.add(order);
      } else {
        List<CartItem> carts = existingOrder.first.cartItems!
            .where((element) =>
                element.productSku == order.cartItems!.first.productSku)
            .toList();

        if (carts.isEmpty) {
          existingOrder.first.cartItems!.add(order.cartItems!.first);
        } else {
          for (var item in existingOrder.first.cartItems!) {
            if (item.productSku == order.cartItems!.first.productSku) {
              item.quantity = item.quantity! + order.cartItems!.first.quantity!;
              item.price = item.price! + order.cartItems!.first.price!;
            }
          }
        }
      }

      for (var item in existingOrder.first.cartItems!) {
        totalPrice = totalPrice! + item.price!;
        totalQuantity = totalQuantity! + item.quantity!;
      }

      existingOrder.first.totalPrice = totalPrice;
      existingOrder.first.totalQuantity = totalQuantity;

      existingOrder.first.save();
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void deleteItemFromOrder(String locationId, String productSku) {
    OfflineOrder? existingOrder;
    late int? totalQuantity = 0;
    late int? totalPrice = 0;

    existingOrder = _orderBox.values
        .toList()
        .where((element) => element.locationId == locationId)
        .first;

    existingOrder.cartItems!
        .removeWhere((element) => element.productSku == productSku);

    for (var item in existingOrder.cartItems!) {
      totalPrice = totalPrice! - item.price!;
      totalQuantity = totalQuantity! - item.quantity!;
    }

    existingOrder.totalQuantity = totalQuantity! * -1;
    existingOrder.totalPrice = totalPrice! * -1;

    existingOrder.save();

    if (existingOrder.cartItems!.isEmpty) {
      existingOrder.delete();
    }
    notifyListeners();
  }

  void increaseItemQuantity(String locationId, String productSku) {
    OfflineOrder? existingOrder;
    late int? totalQuantity = 0;
    late int? totalPrice = 0;

    existingOrder = _orderBox.values
        .toList()
        .where((element) => element.locationId == locationId)
        .first;

    late int? quantity = existingOrder!.cartItems!
        .singleWhere((element) => element.productSku == productSku)
        .quantity!;

    late int? updatedPrice = existingOrder!.cartItems!
        .singleWhere((element) => element.productSku == productSku)
        .price;

    quantity += 1;
    updatedPrice = updatedPrice! +
        existingOrder.cartItems!
            .singleWhere((element) => element.productSku == productSku)
            .initialPrice!;

    existingOrder.cartItems!
        .singleWhere((element) => element.productSku == productSku)
        .quantity = quantity;

    existingOrder.cartItems!
        .singleWhere((element) => element.productSku == productSku)
        .price = updatedPrice;

    for (var item in existingOrder.cartItems!) {
      totalPrice = totalPrice! + item.price!;
      totalQuantity = totalQuantity! + item.quantity!;
    }

    existingOrder.totalQuantity = totalQuantity!;
    existingOrder.totalPrice = totalPrice!;
    existingOrder.save();

    notifyListeners();
  }

  void decreaseItemQuantity(String locationId, String productSku) {
    OfflineOrder? existingOrder;
    late int? totalQuantity = 0;
    late int? totalPrice = 0;

    existingOrder = _orderBox.values
        .toList()
        .where((element) => element.locationId == locationId)
        .first;

    late int? quantity = existingOrder!.cartItems!
        .singleWhere((element) => element.productSku == productSku)
        .quantity!;

    late int? updatedPrice = existingOrder!.cartItems!
        .singleWhere((element) => element.productSku == productSku)
        .price!;

    quantity -= 1;
    updatedPrice = updatedPrice -
        existingOrder.cartItems!
            .singleWhere((element) => element.productSku == productSku)
            .initialPrice!;

    existingOrder.cartItems!
        .singleWhere((element) => element.productSku == productSku)
        .quantity = quantity;

    existingOrder.cartItems!
        .singleWhere((element) => element.productSku == productSku)
        .price = updatedPrice;

    for (var item in existingOrder.cartItems!) {
      totalPrice = totalPrice! - item.price! * -1;
      totalQuantity = totalQuantity! - item.quantity! * -1;
    }

    existingOrder.totalQuantity = totalQuantity!;
    existingOrder.totalPrice = totalPrice!;
    existingOrder.save();

    notifyListeners();
  }

  void deleteAfterOrder(List<OfflineOrder> orders){
    for(var order in orders){
      order.delete();
    }
    notifyListeners();
  }
}

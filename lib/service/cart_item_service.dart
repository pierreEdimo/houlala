import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/main.dart';
import 'package:houlala/model/CountAndPrice.dart';
import 'package:houlala/model/add_cart_item.dart';
import 'package:houlala/model/cart-item.dart';
import 'package:houlala/model/update_cart.dart';
import 'package:http/http.dart';

class CartItemService extends ChangeNotifier {
  late int? totalPrice = 0;

  Future<void> addToCart(AddCartItem cartItem) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsEncode;
    jsEncode = jsonEncode(cartItem);
    var url = Uri.parse('${dotenv.env['CART_URL']}');
    await post(
      url,
      headers: headers,
      body: jsEncode,
    );

    notifyListeners();
  }

  Future<int> getCountItem() async {
    String? userId = await storage.read(key: "userId");

    var url = Uri.parse('${dotenv.env['CART_URL']}/cartItemCount/$userId');

    Response response = await get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw "No Product found";
    }
  }

  Future<List<CartItem>> fetchCartItems() async {
    var userId = await storage.read(key: "userId");
    var url =
        Uri.parse('${dotenv.env['CART_URL']}/getCartsFromUsers?userId=$userId');
    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<CartItem> cartItems =
          body.map((dynamic post) => CartItem.fromJson(post)).toList();
      return cartItems;
    } else {
      throw "Il n'a aucuns article dans le panier";
    }
  }

  Future<void> increaseCartItem(CartItem item) async {
    item.quantity = item.quantity! + 1;
    item.totalPrice = item.product!.initialPrice! * item.quantity!;

    UpdateCart newCart =
        UpdateCart(quantity: item.quantity, totalPrice: item.totalPrice);

    await _editCartItem(item.id!, newCart);

    notifyListeners();
  }

  Future<void> decreaseCartItem(CartItem item) async {
    if (item.quantity! > 1) {
      item.quantity = item.quantity! - 1;
      item.totalPrice = item.product!.initialPrice! * item.quantity!;

      UpdateCart newCart =
          UpdateCart(quantity: item.quantity, totalPrice: item.totalPrice);

      await _editCartItem(item.id!, newCart);

      notifyListeners();
    }
  }

  Future<void> _editCartItem(String id, UpdateCart newCart) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsEncode;
    jsEncode = jsonEncode(newCart);
    var url = Uri.parse('${dotenv.env['CART_URL']}/$id');
    await patch(
      url,
      headers: headers,
      body: jsEncode,
    );

    notifyListeners();
  }

  Future<void> deleteCart(String id) async {
    //var jwt = await storage.read(key: 'jwt');
    var url = Uri.parse('${dotenv.env['CART_URL']}/$id');
    Map<String, String> headers = {'Content-Type': 'application/json'};
    await delete(
      url,
      headers: headers,
    );
    notifyListeners();
  }

  Future<CountAndPrice> getCountAndPrice() async {
    var userId = await storage.read(key: "userId");
    var url = Uri.parse(
        '${dotenv.env['CART_URL']}/getTotalCountAndTotalPrice/$userId');

    Response response = await get(url);

    if (response.statusCode == 200) {
      return CountAndPrice.fromJson(jsonDecode(response.body));
    } else {
      throw "No Product found";
    }
  }
}

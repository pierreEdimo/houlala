import 'package:houlala/model/add_cart_item.dart';
import 'package:houlala/model/user_information.dart';

import 'address.dart';

class AddOrder {
  AddOrder({
    this.user,
    required this.cartItems,
    this.totalPrice,
    this.status,
    this.payMentMode,
    this.orderOptions,
    this.address,
    this.totalQuantity,
  });

  final UserInformation? user;
  final List<AddCartItem> cartItems;
  final int? totalPrice;
  final String? status;
  final String? payMentMode;
  final String? orderOptions;
  final Address? address;
  final int? totalQuantity;

  factory AddOrder.fromJson(Map<String, dynamic> json) => AddOrder(
        user: UserInformation.fromJson(
          json["userInformation"],
        ),
        cartItems: List<AddCartItem>.from(
          json["cartItems"].map(
            (x) => AddCartItem.fromJson(x),
          ),
        ),
        totalPrice: json["totalPrice"],
        status: json["status"],
        payMentMode: json["payMentMode"],
        orderOptions: json["orderOptions"],
        address: Address.fromJson(json["address"]),
        totalQuantity: json['totalQuantity'],
      );

  Map<String, dynamic> toJson() => {
        "userInformation": user,
        "cartItems": List<dynamic>.from(cartItems.map((x) => x.toJson())),
        "totalPrice": totalPrice,
        "status": status,
        "payMentMode": payMentMode,
        "orderOptions": orderOptions,
        "address": address!.toJson(),
        "totalQuantity": totalQuantity,
      };
}

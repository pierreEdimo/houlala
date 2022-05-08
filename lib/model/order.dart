import 'package:houlala/model/user_information.dart';

import 'cart_item.dart';

class Order {
  final UserInformation? user;
  final int? totalPrice;
  final int? totalQuantity;
  final List<CartItem> cartItems;
  final DateTime? createdAt;

  Order({this.user,
    this.totalPrice,
    this.totalQuantity,
    required this.cartItems,
    this.createdAt});

  factory Order.fromJson(Map<String, dynamic> json) =>
      Order(
          user: UserInformation.fromJson(json['userInformation']),
          totalPrice: json['totalPrice'],
          totalQuantity: json['totalQuantity'],
          createdAt: DateTime.parse(json['createdAt']),
          cartItems: List<CartItem>.from(
            json["cartItems"].map(
                  (x) => CartItem.fromJson(x),
            ),
          )
      );
}

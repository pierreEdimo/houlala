import 'package:houlala/model/simplefied_location.dart';

import 'cart_item.dart';

class Order {
  final int? id;
  final String? status;
  final bool? confirmed;
  final String? paymentMode;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? totalQuantity;
  final int? totalPrice;
  final SimplifiedLocation? location;
  final List<CartItem>? cartItems;

  Order({
    this.id,
    this.status,
    this.confirmed,
    this.paymentMode,
    this.createdAt,
    this.updatedAt,
    this.totalQuantity,
    this.totalPrice,
    this.location,
    this.cartItems,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json['id'],
        status: json['status'],
        confirmed: json['confirmed'],
        paymentMode: json['payMentMode'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        totalQuantity: json['totalQuantity'],
        totalPrice: json['totalPrice'],
        location: SimplifiedLocation.fromJson(json['location']),
        cartItems: List<CartItem>.from(
            json['cartItems'].map((x) => CartItem.fromJson(x))),
      );
}

import 'package:houlala/model/cart_item.dart';

class AddOrder {
  AddOrder({
    this.userId,
    this.locationId,
    this.cartItems,
  });

  final String? userId;
  final String? locationId;
  final List<CartItem>? cartItems;

  factory AddOrder.fromJson(Map<String, dynamic> json) => AddOrder(
    userId: json["userId"],
    locationId: json["locationUniqueId"],
    cartItems: List<CartItem>.from(json["cartItems"].map((x) => CartItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "locationUniqueId": locationId,
    "cartItems": List<dynamic>.from(cartItems!.map((x) => x.toJson())),
  };
}


import 'add_item.dart';

class AddOrder {
  AddOrder({
    this.userId,
    this.locationId,
    this.cartItems,
  });

  final String? userId;
  final String? locationId;
  final List<AddItem>? cartItems;

  factory AddOrder.fromJson(Map<String, dynamic> json) => AddOrder(
    userId: json["userId"],
    locationId: json["locationId"],
    cartItems: List<AddItem>.from(json["cartItems"].map((x) => AddItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "locationId": locationId,
    "cartItems": List<dynamic>.from(cartItems!.map((x) => x.toJson())),
  };
}


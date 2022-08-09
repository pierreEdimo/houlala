import 'package:houlala/model/cart_item.dart';
import 'package:houlala/model/user_information.dart';


class UnregisteredUserOrder {
  final String? locationId;
  final UserInformation? userInformation;
  final List<CartItem>? cartItems;

  UnregisteredUserOrder({
    this.locationId,
    this.cartItems,
    this.userInformation,
  });

  factory UnregisteredUserOrder.fromJson(Map<String, dynamic> json) =>
      UnregisteredUserOrder(
          locationId: json['locationId'],
          userInformation: UserInformation.fromJson(json['userInformation']),
          cartItems: List<CartItem>.from(
              json["cartItems"].map((x) => CartItem.fromJson(x))));

  Map<String, dynamic> toJson() => {
    "locationId": locationId,
    "userInformation": userInformation!.toJson(),
    "cartItems": List<dynamic>.from(cartItems!.map((e) => e.toJson()))

  };
}

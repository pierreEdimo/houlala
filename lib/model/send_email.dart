import 'package:houlala/model/user_information.dart';

import 'cart_item.dart';

class SendEmail {
  final String? to;
  final String? subject;
  final SimplifiedOrder? order;
  final UserInformation? userInformation;

  SendEmail({
    this.to,
    this.subject,
    this.order,
    this.userInformation,
  });

  factory SendEmail.fromJson(Map<String, dynamic> json) => SendEmail(
        to: json["to"],
        subject: json["subject"],
        order: SimplifiedOrder.fromJson(json['order']),
        userInformation: UserInformation.fromJson(json['userInformation']),
      );

  Map<String, dynamic> toJson() => {
        "to": to,
        "subject": subject,
        "order": order!.toJson(),
        "userInformation": userInformation!.toJson()
      };
}

class SimplifiedOrder {
  final String? status;
  final String? payMentMode;
  final int? totalQuantity;
  final int? totalPrice;
  final List<CartItem>? cartItems;

  SimplifiedOrder(
      {this.status,
      this.payMentMode,
      this.totalPrice,
      this.totalQuantity,
      this.cartItems});

  factory SimplifiedOrder.fromJson(Map<String, dynamic> json) =>
      SimplifiedOrder(
          status: json["status"],
          payMentMode: json["payMentMode"],
          totalPrice: json["totalPrice"],
          totalQuantity: json["totalQuantity"],
          cartItems: List<CartItem>.from(
              json['cartItems'].map((x) => CartItem.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "status": status,
        "payMentMode": payMentMode,
        "totalPrice": totalPrice,
        "totalQuantity": totalQuantity,
        "cartItems": List<dynamic>.from(cartItems!.map((e) => e.toJson()))
      };
}

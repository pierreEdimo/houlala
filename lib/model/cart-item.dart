import 'package:houlala/model/product.dart';

class CartItem {
  final String? id;
  final String? userId;
  int? quantity;
  int? totalPrice;
  final Product? product;

  CartItem({
    this.id,
    this.userId,
    this.quantity,
    this.totalPrice,
    this.product,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json['_id'] as String,
        userId: json['userId'] as String,
        quantity: json['quantity'] as int,
        totalPrice: json['totalPrice'] as int,
        product: Product.fromJson(json['product']),
      );
}

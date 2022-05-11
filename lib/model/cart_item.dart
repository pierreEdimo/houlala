import 'package:houlala/model/product.dart';
import 'package:hive/hive.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 1)
class CartItem extends HiveObject{
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? userId;

  @HiveField(2)
  int? quantity;

  @HiveField(3)
  int? totalPrice;

  @HiveField(4)
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

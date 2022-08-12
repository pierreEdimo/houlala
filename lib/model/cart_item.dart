import 'package:hive/hive.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 2)
class CartItem extends HiveObject {
  @HiveField(0)
  final String? productSku;

  @HiveField(1)
  late int? price;

  @HiveField(2)
  final String? name;

  @HiveField(3)
  final String? imageUrl;

  @HiveField(4)
  late int? quantity;

  @HiveField(5)
  late int? initialPrice;

  CartItem({
    this.productSku,
    this.price,
    this.name,
    this.imageUrl,
    this.quantity,
    this.initialPrice,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
      productSku: json['productSku'],
      price: json['price'],
      name: json['product'],
      imageUrl: json['imageUrl'],
      quantity: json['quantity'],
      initialPrice: json['initialPrice']);

  Map<String, dynamic> toJson() => {
        "productSku": productSku,
        "price": price,
        "product": name,
        "imageUrl": imageUrl,
        "quantity": quantity,
        "initialPrice": initialPrice,
      };
}

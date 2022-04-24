
class AddCartItem {
  final String? productId;
  final String? userId;
  final int? totalPrice;
  final int? quantity;

  AddCartItem({
    this.productId,
    this.userId,
    this.totalPrice,
    this.quantity,
  });

  factory AddCartItem.fromJson(Map<String, dynamic> json) => AddCartItem(
        productId: json['product'] as String,
        userId:  json['userId'] as String,
        quantity: json['quantity '] as int,
        totalPrice: json['totalPrice'] as int,
      );

  Map<String, dynamic> toJson() => {
        "product": productId,
        "userId": userId,
        "quantity": quantity,
        "totalPrice": totalPrice
      };
}

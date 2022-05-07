class AddCartItem {
  final String? productId;
  final String? userId;
  final int? totalPrice;
  final int? quantity;
  final String? productName;
  final String? pageId;

  AddCartItem({
    this.productId,
    this.userId,
    this.totalPrice,
    this.quantity,
    this.productName,
    this.pageId,
  });

  factory AddCartItem.fromJson(Map<String, dynamic> json) => AddCartItem(
        productId: json['product'] as String,
        userId: json['userId'] as String,
        quantity: json['quantity '] as int,
        totalPrice: json['totalPrice'] as int,
        productName: json['productName'] as String,
        pageId: json['pageId'] as String,
      );

  Map<String, dynamic> toJson() => {
        "product": productId,
        "userId": userId,
        "quantity": quantity,
        "totalPrice": totalPrice,
        "productName": productName,
        "pageId": pageId,
      };
}

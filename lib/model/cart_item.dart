class CartItem {
  final String? productSku;
  final int? price;
  final String? name;
  final String? imageUrl;
  final int? quantity;

  CartItem({
    this.productSku,
    this.price,
    this.name,
    this.imageUrl,
    this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        productSku: json['productSku'],
        price: json['price'],
        name: json['product'],
        imageUrl: json['imageUrl'],
        quantity: json['quantity'],
      );
}

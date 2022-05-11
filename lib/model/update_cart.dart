class UpdateCart {
  final int? totalPrice;
  final int? quantity;

  UpdateCart({this.totalPrice, this.quantity});

  factory UpdateCart.fromJson(Map<String, dynamic> json) => UpdateCart(
        totalPrice: json['totalPrice'] as int,
        quantity: json['quantity'] as int,
      );

  Map<String, dynamic> toJson() => {
        "totalPrice": totalPrice,
        "quantity": quantity,
      };
}

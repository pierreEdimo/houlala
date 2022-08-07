class AddItem {
  AddItem({
    this.productSku,
    this.quantity,
    this.price,
    this.initialPrice,
  });

  final String? productSku;
  final int? quantity;
  final int? price;
  final int? initialPrice;

  factory AddItem.fromJson(Map<String, dynamic> json) => AddItem(
        productSku: json["productSku"],
        quantity: json["quantity"],
        price: json["price"],
        initialPrice: json["initialPrice"],
      );

  Map<String, dynamic> toJson() => {
        "productSku": productSku,
        "quantity": quantity,
        "price": price,
        "initialPrice": initialPrice,
      };
}

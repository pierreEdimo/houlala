class Product {
  final String? id;
  final String? name;
  final String? description;
  final int? weight;
  final int? initialPrice;
  final String? imageUrl;
  late int quantity = 1;

  Product(
      {this.name,
      this.description,
      this.weight,
      this.initialPrice,
      this.imageUrl,
      this.id});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['_id'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        weight: json['weight'] as int,
        initialPrice: json['initialPrice'] as int,
        imageUrl: json['imageUrl'] as String,
      );

  void incrementQuantity() {
    quantity += 1;
  }
}

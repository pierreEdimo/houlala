class Product {
  final int? id;
  final String? name;
  final String? description;
  final int? weight;
  final int? sellingPrice;
  final String? imageUrl;
  late int quantity = 1;
  final String? locationId;
  late bool? bookMarked;
  final String? productSku;
  late int? availableQuantity = 0;
  final String? locationName;

  Product(
      {this.name,
      this.description,
      this.weight,
      this.sellingPrice,
      this.imageUrl,
      this.locationId,
      this.id,
      this.bookMarked,
      this.locationName,
      this.productSku});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        weight: json['weight'],
        sellingPrice: json['sellingPrice'],
        imageUrl: json['imageUrl'],
        locationId: json['locationUniqueId'],
        bookMarked: json['bookMarked'],
        productSku: json['productSku'],
        locationName: json['locationName'],
      );
}

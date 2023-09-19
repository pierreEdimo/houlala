class ProductSubCategory {
  final String? label;
  final int? id;
  final String? imageUrl;

  ProductSubCategory({
    this.label,
    this.id,
    this.imageUrl,
  });

  factory ProductSubCategory.fromJson(Map<String, dynamic> json) =>
      ProductSubCategory(
        label: json["label"],
        id: json["id"],
        imageUrl: json["imageUrl"],
      );
}

class ProductSubCategory {
  final String? label;
  final String? id;

  ProductSubCategory({
    this.label,
    this.id,
  });

  factory ProductSubCategory.fromJson(Map<String, dynamic> json) =>
      ProductSubCategory(
        label: json["label"],
        id: json["_id"],
      );
}

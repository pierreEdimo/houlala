class ProductSubCategory {
  final String? label;
  final String? id;
  final String? thumbNailUrl;

  ProductSubCategory({
    this.label,
    this.id,
    this.thumbNailUrl,
  });

  factory ProductSubCategory.fromJson(Map<String, dynamic> json) =>
      ProductSubCategory(
        label: json["label"],
        id: json["_id"],
        thumbNailUrl: json["thumbNailUrl"],
      );
}

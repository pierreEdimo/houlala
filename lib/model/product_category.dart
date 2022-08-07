class CategoryModel {
  final String? id;
  final String? name;
  final String? imageUrl;

  CategoryModel({
    this.id,
    this.name,
    this.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['_id'] as String,
        name: json['name'] as String,
        imageUrl: json['imageUrl'] as String,
      );
}

class CategoryModel {
  final int? id;
  final String? name;
  final String? imageUrl;

  CategoryModel({
    this.id,
    this.name,
    this.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'] as int,
        name: json['name'] as String,
        imageUrl: json['imageUrl'] as String,
      );
}

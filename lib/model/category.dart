class CategoryModel {
  final String? id;
  final String? name;
  final String? imageUrl;
  final String? description;
  final String? categoryTyoe;

  CategoryModel(
      {this.id,
      this.name,
      this.imageUrl,
      this.description,
      this.categoryTyoe});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['_id'] as String,
        name: json['name'] as String,
        imageUrl: json['imageUrl'] as String,
        description: json['description'] as String,
        categoryTyoe: json['categoryType'] as String,
      );
}

import 'package:houlala/model/category_type.dart';

class CategoryModel {
  final String? id;
  final String? name;
  final String? imageUrl;
  final String? description;
  final CategoryType? categoryType;

  CategoryModel({
    this.id,
    this.name,
    this.imageUrl,
    this.description,
    this.categoryType,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['_id'] as String,
        name: json['name'] as String,
        imageUrl: json['imageUrl'] as String,
        description: json['description'] as String, 
        categoryType: CategoryType.fromJson(json['categoryType'])
      );
}

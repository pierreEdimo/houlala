import 'package:hive/hive.dart';
import 'package:houlala/model/product_page.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product {
  @HiveField(7)
  final String? id;
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? description;
  @HiveField(2)
  final int? weight;
  @HiveField(3)
  final int? initialPrice;
  @HiveField(4)
  final String? imageUrl;
  @HiveField(5)
  late int quantity = 1;
  @HiveField(6)
  final Page? page;

  Product(
      {this.name,
      this.description,
      this.weight,
      this.initialPrice,
      this.imageUrl,
      this.page,
      this.id});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json['_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      weight: json['weight'] as int,
      initialPrice: json['initialPrice'] as int,
      imageUrl: json['imageUrl'] as String,
      page: Page.fromJson(json['page']));
}


import 'package:freezed_annotation/freezed_annotation.dart';


part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel{
  const factory ProductModel({
    int? id, 
    String? name, 
    String? description, 
    int? weight, 
    int? sellingPrice, 
    String? imageUrl, 
    @Default(1) int? quantity,
    String? locationId,
    bool? bookMarked,
    String? productSku,
    @Default(1) int? availableQuantity,
    String? locationName,
    String? categoryName
}) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}
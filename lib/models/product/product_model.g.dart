// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      weight: json['weight'] as int?,
      sellingPrice: json['sellingPrice'] as int?,
      imageUrl: json['imageUrl'] as String?,
      quantity: json['quantity'] as int? ?? 1,
      locationId: json['locationId'] as String?,
      bookMarked: json['bookMarked'] as bool?,
      productSku: json['productSku'] as String?,
      availableQuantity: json['availableQuantity'] as int? ?? 1,
      locationName: json['locationName'] as String?,
      categoryName: json['categoryName'] as String?,
      subCategoryName: json['subCategoryName'] as String?,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'weight': instance.weight,
      'sellingPrice': instance.sellingPrice,
      'imageUrl': instance.imageUrl,
      'quantity': instance.quantity,
      'locationId': instance.locationId,
      'bookMarked': instance.bookMarked,
      'productSku': instance.productSku,
      'availableQuantity': instance.availableQuantity,
      'locationName': instance.locationName,
      'categoryName': instance.categoryName,
      'subCategoryName': instance.subCategoryName,
    };

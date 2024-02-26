// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubCategoryModelImpl _$$SubCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SubCategoryModelImpl(
      id: json['id'] as int?,
      label: json['label'] as String?,
      imageUrl: json['imageUrl'] as String?,
      categoryName: json['categoryName'] as String?,
    );

Map<String, dynamic> _$$SubCategoryModelImplToJson(
        _$SubCategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'imageUrl': instance.imageUrl,
      'categoryName': instance.categoryName,
    };

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_category_model.freezed.dart';
part 'sub_category_model.g.dart';

@freezed
class SubCategoryModel with _$SubCategoryModel {
  const factory SubCategoryModel(
      {int? id,
      String? label,
      String? imageUrl,
      String? categoryName}) = _SubCategoryModel;

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) => _$SubCategoryModelFromJson(json);
}

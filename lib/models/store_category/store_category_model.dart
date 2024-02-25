import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_category_model.freezed.dart';
part 'store_category_model.g.dart';

@freezed
class StoreCategoryModel with _$StoreCategoryModel {
  const factory StoreCategoryModel({
    int? id,
    String? name,
    String? thumbNail,
  }) = _StoreCategoryModel;

  factory StoreCategoryModel.fromJson(Map<String, dynamic> json) => _$StoreCategoryModelFromJson(json);
}

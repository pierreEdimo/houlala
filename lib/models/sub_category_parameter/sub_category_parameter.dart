import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_category_parameter.freezed.dart';

@freezed
class SubCategoryParameter with _$SubCategoryParameter {
  const factory SubCategoryParameter({
    String? label,
    int? id,
    String? categoryName,
  }) = _SubCategoryParameter;
}

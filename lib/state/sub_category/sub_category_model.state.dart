import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/sub_category/sub_category_model.dart';

part 'sub_category_model.state.freezed.dart';

@freezed
class SubCategoryModelState with _$SubCategoryModelState {
  factory SubCategoryModelState({
    @Default([]) List<SubCategoryModel> categoryList,
    @Default(false) bool loading,
    @Default('') String errorMessage,
    @Default(false) bool error
  }) = _SubCategoryModelState;
}
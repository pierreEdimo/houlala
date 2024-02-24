import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/product_category/category_model.dart';

part 'p_category_model.state.freezed.dart';

@freezed
class PCategoryModelState with _$PCategoryModelState {
  factory PCategoryModelState(
      {@Default([]) List<CategoryModel> categoryList,
      @Default(false) bool loading,
      @Default('') String errorMessage,
      @Default(false) bool error}) = _CategoryModelState;
}

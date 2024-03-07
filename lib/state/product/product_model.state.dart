import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/product/product_model.dart';


part 'product_model.state.freezed.dart';

@freezed
class ProductModelState with _$ProductModelState{
  factory ProductModelState({
    @Default([]) List<ProductModel> productList,
    @Default(false) bool loading,
    @Default('') String errorMessage,
    @Default(false) bool error,
    @Default(null) ProductModel? selectedProduct,
    @Default([]) List<ProductModel> bookmarkedList,
}) = _ProductModelState;
}
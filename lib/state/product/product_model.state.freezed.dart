// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductModelState {
  List<ProductModel> get productList => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;
  ProductModel? get selectedProduct => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductModelStateCopyWith<ProductModelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelStateCopyWith<$Res> {
  factory $ProductModelStateCopyWith(
          ProductModelState value, $Res Function(ProductModelState) then) =
      _$ProductModelStateCopyWithImpl<$Res, ProductModelState>;
  @useResult
  $Res call(
      {List<ProductModel> productList,
      bool loading,
      String errorMessage,
      bool error,
      ProductModel? selectedProduct});

  $ProductModelCopyWith<$Res>? get selectedProduct;
}

/// @nodoc
class _$ProductModelStateCopyWithImpl<$Res, $Val extends ProductModelState>
    implements $ProductModelStateCopyWith<$Res> {
  _$ProductModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productList = null,
    Object? loading = null,
    Object? errorMessage = null,
    Object? error = null,
    Object? selectedProduct = freezed,
  }) {
    return _then(_value.copyWith(
      productList: null == productList
          ? _value.productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedProduct: freezed == selectedProduct
          ? _value.selectedProduct
          : selectedProduct // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res>? get selectedProduct {
    if (_value.selectedProduct == null) {
      return null;
    }

    return $ProductModelCopyWith<$Res>(_value.selectedProduct!, (value) {
      return _then(_value.copyWith(selectedProduct: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductModelStateImplCopyWith<$Res>
    implements $ProductModelStateCopyWith<$Res> {
  factory _$$ProductModelStateImplCopyWith(_$ProductModelStateImpl value,
          $Res Function(_$ProductModelStateImpl) then) =
      __$$ProductModelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ProductModel> productList,
      bool loading,
      String errorMessage,
      bool error,
      ProductModel? selectedProduct});

  @override
  $ProductModelCopyWith<$Res>? get selectedProduct;
}

/// @nodoc
class __$$ProductModelStateImplCopyWithImpl<$Res>
    extends _$ProductModelStateCopyWithImpl<$Res, _$ProductModelStateImpl>
    implements _$$ProductModelStateImplCopyWith<$Res> {
  __$$ProductModelStateImplCopyWithImpl(_$ProductModelStateImpl _value,
      $Res Function(_$ProductModelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productList = null,
    Object? loading = null,
    Object? errorMessage = null,
    Object? error = null,
    Object? selectedProduct = freezed,
  }) {
    return _then(_$ProductModelStateImpl(
      productList: null == productList
          ? _value._productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedProduct: freezed == selectedProduct
          ? _value.selectedProduct
          : selectedProduct // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
    ));
  }
}

/// @nodoc

class _$ProductModelStateImpl implements _ProductModelState {
  _$ProductModelStateImpl(
      {final List<ProductModel> productList = const [],
      this.loading = false,
      this.errorMessage = '',
      this.error = false,
      this.selectedProduct = null})
      : _productList = productList;

  final List<ProductModel> _productList;
  @override
  @JsonKey()
  List<ProductModel> get productList {
    if (_productList is EqualUnmodifiableListView) return _productList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productList);
  }

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final bool error;
  @override
  @JsonKey()
  final ProductModel? selectedProduct;

  @override
  String toString() {
    return 'ProductModelState(productList: $productList, loading: $loading, errorMessage: $errorMessage, error: $error, selectedProduct: $selectedProduct)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelStateImpl &&
            const DeepCollectionEquality()
                .equals(other._productList, _productList) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.selectedProduct, selectedProduct) ||
                other.selectedProduct == selectedProduct));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_productList),
      loading,
      errorMessage,
      error,
      selectedProduct);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelStateImplCopyWith<_$ProductModelStateImpl> get copyWith =>
      __$$ProductModelStateImplCopyWithImpl<_$ProductModelStateImpl>(
          this, _$identity);
}

abstract class _ProductModelState implements ProductModelState {
  factory _ProductModelState(
      {final List<ProductModel> productList,
      final bool loading,
      final String errorMessage,
      final bool error,
      final ProductModel? selectedProduct}) = _$ProductModelStateImpl;

  @override
  List<ProductModel> get productList;
  @override
  bool get loading;
  @override
  String get errorMessage;
  @override
  bool get error;
  @override
  ProductModel? get selectedProduct;
  @override
  @JsonKey(ignore: true)
  _$$ProductModelStateImplCopyWith<_$ProductModelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'p_category_model.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PCategoryModelState {
  List<CategoryModel> get categoryList => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PCategoryModelStateCopyWith<PCategoryModelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PCategoryModelStateCopyWith<$Res> {
  factory $PCategoryModelStateCopyWith(
          PCategoryModelState value, $Res Function(PCategoryModelState) then) =
      _$PCategoryModelStateCopyWithImpl<$Res, PCategoryModelState>;
  @useResult
  $Res call(
      {List<CategoryModel> categoryList,
      bool loading,
      String errorMessage,
      bool error});
}

/// @nodoc
class _$PCategoryModelStateCopyWithImpl<$Res, $Val extends PCategoryModelState>
    implements $PCategoryModelStateCopyWith<$Res> {
  _$PCategoryModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryList = null,
    Object? loading = null,
    Object? errorMessage = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      categoryList: null == categoryList
          ? _value.categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryModelStateImplCopyWith<$Res>
    implements $PCategoryModelStateCopyWith<$Res> {
  factory _$$CategoryModelStateImplCopyWith(_$CategoryModelStateImpl value,
          $Res Function(_$CategoryModelStateImpl) then) =
      __$$CategoryModelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CategoryModel> categoryList,
      bool loading,
      String errorMessage,
      bool error});
}

/// @nodoc
class __$$CategoryModelStateImplCopyWithImpl<$Res>
    extends _$PCategoryModelStateCopyWithImpl<$Res, _$CategoryModelStateImpl>
    implements _$$CategoryModelStateImplCopyWith<$Res> {
  __$$CategoryModelStateImplCopyWithImpl(_$CategoryModelStateImpl _value,
      $Res Function(_$CategoryModelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryList = null,
    Object? loading = null,
    Object? errorMessage = null,
    Object? error = null,
  }) {
    return _then(_$CategoryModelStateImpl(
      categoryList: null == categoryList
          ? _value._categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
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
    ));
  }
}

/// @nodoc

class _$CategoryModelStateImpl implements _CategoryModelState {
  _$CategoryModelStateImpl(
      {final List<CategoryModel> categoryList = const [],
      this.loading = false,
      this.errorMessage = '',
      this.error = false})
      : _categoryList = categoryList;

  final List<CategoryModel> _categoryList;
  @override
  @JsonKey()
  List<CategoryModel> get categoryList {
    if (_categoryList is EqualUnmodifiableListView) return _categoryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryList);
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
  String toString() {
    return 'PCategoryModelState(categoryList: $categoryList, loading: $loading, errorMessage: $errorMessage, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryModelStateImpl &&
            const DeepCollectionEquality()
                .equals(other._categoryList, _categoryList) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categoryList),
      loading,
      errorMessage,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryModelStateImplCopyWith<_$CategoryModelStateImpl> get copyWith =>
      __$$CategoryModelStateImplCopyWithImpl<_$CategoryModelStateImpl>(
          this, _$identity);
}

abstract class _CategoryModelState implements PCategoryModelState {
  factory _CategoryModelState(
      {final List<CategoryModel> categoryList,
      final bool loading,
      final String errorMessage,
      final bool error}) = _$CategoryModelStateImpl;

  @override
  List<CategoryModel> get categoryList;
  @override
  bool get loading;
  @override
  String get errorMessage;
  @override
  bool get error;
  @override
  @JsonKey(ignore: true)
  _$$CategoryModelStateImplCopyWith<_$CategoryModelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

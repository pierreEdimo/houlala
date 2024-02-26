// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_screen_arguments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PageScreenArguments {
  String? get categoryName => throw _privateConstructorUsedError;
  int? get categoryId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PageScreenArgumentsCopyWith<PageScreenArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageScreenArgumentsCopyWith<$Res> {
  factory $PageScreenArgumentsCopyWith(
          PageScreenArguments value, $Res Function(PageScreenArguments) then) =
      _$PageScreenArgumentsCopyWithImpl<$Res, PageScreenArguments>;
  @useResult
  $Res call({String? categoryName, int? categoryId});
}

/// @nodoc
class _$PageScreenArgumentsCopyWithImpl<$Res, $Val extends PageScreenArguments>
    implements $PageScreenArgumentsCopyWith<$Res> {
  _$PageScreenArgumentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(_value.copyWith(
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageScreenArgumentsImplCopyWith<$Res>
    implements $PageScreenArgumentsCopyWith<$Res> {
  factory _$$PageScreenArgumentsImplCopyWith(_$PageScreenArgumentsImpl value,
          $Res Function(_$PageScreenArgumentsImpl) then) =
      __$$PageScreenArgumentsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? categoryName, int? categoryId});
}

/// @nodoc
class __$$PageScreenArgumentsImplCopyWithImpl<$Res>
    extends _$PageScreenArgumentsCopyWithImpl<$Res, _$PageScreenArgumentsImpl>
    implements _$$PageScreenArgumentsImplCopyWith<$Res> {
  __$$PageScreenArgumentsImplCopyWithImpl(_$PageScreenArgumentsImpl _value,
      $Res Function(_$PageScreenArgumentsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(_$PageScreenArgumentsImpl(
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$PageScreenArgumentsImpl implements _PageScreenArguments {
  const _$PageScreenArgumentsImpl({this.categoryName, this.categoryId});

  @override
  final String? categoryName;
  @override
  final int? categoryId;

  @override
  String toString() {
    return 'PageScreenArguments(categoryName: $categoryName, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageScreenArgumentsImpl &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryName, categoryId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PageScreenArgumentsImplCopyWith<_$PageScreenArgumentsImpl> get copyWith =>
      __$$PageScreenArgumentsImplCopyWithImpl<_$PageScreenArgumentsImpl>(
          this, _$identity);
}

abstract class _PageScreenArguments implements PageScreenArguments {
  const factory _PageScreenArguments(
      {final String? categoryName,
      final int? categoryId}) = _$PageScreenArgumentsImpl;

  @override
  String? get categoryName;
  @override
  int? get categoryId;
  @override
  @JsonKey(ignore: true)
  _$$PageScreenArgumentsImplCopyWith<_$PageScreenArgumentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

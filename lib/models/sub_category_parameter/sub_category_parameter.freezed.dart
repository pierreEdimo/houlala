// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_category_parameter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubCategoryParameter {
  String? get label => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubCategoryParameterCopyWith<SubCategoryParameter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCategoryParameterCopyWith<$Res> {
  factory $SubCategoryParameterCopyWith(SubCategoryParameter value,
          $Res Function(SubCategoryParameter) then) =
      _$SubCategoryParameterCopyWithImpl<$Res, SubCategoryParameter>;
  @useResult
  $Res call({String? label, int? id, String? categoryName});
}

/// @nodoc
class _$SubCategoryParameterCopyWithImpl<$Res,
        $Val extends SubCategoryParameter>
    implements $SubCategoryParameterCopyWith<$Res> {
  _$SubCategoryParameterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? id = freezed,
    Object? categoryName = freezed,
  }) {
    return _then(_value.copyWith(
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubCategoryParameterImplCopyWith<$Res>
    implements $SubCategoryParameterCopyWith<$Res> {
  factory _$$SubCategoryParameterImplCopyWith(_$SubCategoryParameterImpl value,
          $Res Function(_$SubCategoryParameterImpl) then) =
      __$$SubCategoryParameterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? label, int? id, String? categoryName});
}

/// @nodoc
class __$$SubCategoryParameterImplCopyWithImpl<$Res>
    extends _$SubCategoryParameterCopyWithImpl<$Res, _$SubCategoryParameterImpl>
    implements _$$SubCategoryParameterImplCopyWith<$Res> {
  __$$SubCategoryParameterImplCopyWithImpl(_$SubCategoryParameterImpl _value,
      $Res Function(_$SubCategoryParameterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? id = freezed,
    Object? categoryName = freezed,
  }) {
    return _then(_$SubCategoryParameterImpl(
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SubCategoryParameterImpl implements _SubCategoryParameter {
  const _$SubCategoryParameterImpl({this.label, this.id, this.categoryName});

  @override
  final String? label;
  @override
  final int? id;
  @override
  final String? categoryName;

  @override
  String toString() {
    return 'SubCategoryParameter(label: $label, id: $id, categoryName: $categoryName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubCategoryParameterImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, id, categoryName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubCategoryParameterImplCopyWith<_$SubCategoryParameterImpl>
      get copyWith =>
          __$$SubCategoryParameterImplCopyWithImpl<_$SubCategoryParameterImpl>(
              this, _$identity);
}

abstract class _SubCategoryParameter implements SubCategoryParameter {
  const factory _SubCategoryParameter(
      {final String? label,
      final int? id,
      final String? categoryName}) = _$SubCategoryParameterImpl;

  @override
  String? get label;
  @override
  int? get id;
  @override
  String? get categoryName;
  @override
  @JsonKey(ignore: true)
  _$$SubCategoryParameterImplCopyWith<_$SubCategoryParameterImpl>
      get copyWith => throw _privateConstructorUsedError;
}

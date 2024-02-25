// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StoreCategoryModel _$StoreCategoryModelFromJson(Map<String, dynamic> json) {
  return _StoreCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$StoreCategoryModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get thumbNail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreCategoryModelCopyWith<StoreCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreCategoryModelCopyWith<$Res> {
  factory $StoreCategoryModelCopyWith(
          StoreCategoryModel value, $Res Function(StoreCategoryModel) then) =
      _$StoreCategoryModelCopyWithImpl<$Res, StoreCategoryModel>;
  @useResult
  $Res call({int? id, String? name, String? thumbNail});
}

/// @nodoc
class _$StoreCategoryModelCopyWithImpl<$Res, $Val extends StoreCategoryModel>
    implements $StoreCategoryModelCopyWith<$Res> {
  _$StoreCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? thumbNail = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbNail: freezed == thumbNail
          ? _value.thumbNail
          : thumbNail // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreCategoryModelImplCopyWith<$Res>
    implements $StoreCategoryModelCopyWith<$Res> {
  factory _$$StoreCategoryModelImplCopyWith(_$StoreCategoryModelImpl value,
          $Res Function(_$StoreCategoryModelImpl) then) =
      __$$StoreCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, String? thumbNail});
}

/// @nodoc
class __$$StoreCategoryModelImplCopyWithImpl<$Res>
    extends _$StoreCategoryModelCopyWithImpl<$Res, _$StoreCategoryModelImpl>
    implements _$$StoreCategoryModelImplCopyWith<$Res> {
  __$$StoreCategoryModelImplCopyWithImpl(_$StoreCategoryModelImpl _value,
      $Res Function(_$StoreCategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? thumbNail = freezed,
  }) {
    return _then(_$StoreCategoryModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbNail: freezed == thumbNail
          ? _value.thumbNail
          : thumbNail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreCategoryModelImpl implements _StoreCategoryModel {
  const _$StoreCategoryModelImpl({this.id, this.name, this.thumbNail});

  factory _$StoreCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreCategoryModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? thumbNail;

  @override
  String toString() {
    return 'StoreCategoryModel(id: $id, name: $name, thumbNail: $thumbNail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreCategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.thumbNail, thumbNail) ||
                other.thumbNail == thumbNail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, thumbNail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreCategoryModelImplCopyWith<_$StoreCategoryModelImpl> get copyWith =>
      __$$StoreCategoryModelImplCopyWithImpl<_$StoreCategoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _StoreCategoryModel implements StoreCategoryModel {
  const factory _StoreCategoryModel(
      {final int? id,
      final String? name,
      final String? thumbNail}) = _$StoreCategoryModelImpl;

  factory _StoreCategoryModel.fromJson(Map<String, dynamic> json) =
      _$StoreCategoryModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get thumbNail;
  @override
  @JsonKey(ignore: true)
  _$$StoreCategoryModelImplCopyWith<_$StoreCategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

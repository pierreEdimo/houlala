// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_result_args.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PageResultArgs {
  String? get locationName => throw _privateConstructorUsedError;
  String? get keyWord => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PageResultArgsCopyWith<PageResultArgs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageResultArgsCopyWith<$Res> {
  factory $PageResultArgsCopyWith(
          PageResultArgs value, $Res Function(PageResultArgs) then) =
      _$PageResultArgsCopyWithImpl<$Res, PageResultArgs>;
  @useResult
  $Res call({String? locationName, String? keyWord});
}

/// @nodoc
class _$PageResultArgsCopyWithImpl<$Res, $Val extends PageResultArgs>
    implements $PageResultArgsCopyWith<$Res> {
  _$PageResultArgsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationName = freezed,
    Object? keyWord = freezed,
  }) {
    return _then(_value.copyWith(
      locationName: freezed == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      keyWord: freezed == keyWord
          ? _value.keyWord
          : keyWord // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageResultArgsImplCopyWith<$Res>
    implements $PageResultArgsCopyWith<$Res> {
  factory _$$PageResultArgsImplCopyWith(_$PageResultArgsImpl value,
          $Res Function(_$PageResultArgsImpl) then) =
      __$$PageResultArgsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? locationName, String? keyWord});
}

/// @nodoc
class __$$PageResultArgsImplCopyWithImpl<$Res>
    extends _$PageResultArgsCopyWithImpl<$Res, _$PageResultArgsImpl>
    implements _$$PageResultArgsImplCopyWith<$Res> {
  __$$PageResultArgsImplCopyWithImpl(
      _$PageResultArgsImpl _value, $Res Function(_$PageResultArgsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationName = freezed,
    Object? keyWord = freezed,
  }) {
    return _then(_$PageResultArgsImpl(
      locationName: freezed == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      keyWord: freezed == keyWord
          ? _value.keyWord
          : keyWord // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PageResultArgsImpl implements _PageResultArgs {
  const _$PageResultArgsImpl({this.locationName, this.keyWord});

  @override
  final String? locationName;
  @override
  final String? keyWord;

  @override
  String toString() {
    return 'PageResultArgs(locationName: $locationName, keyWord: $keyWord)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageResultArgsImpl &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.keyWord, keyWord) || other.keyWord == keyWord));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locationName, keyWord);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PageResultArgsImplCopyWith<_$PageResultArgsImpl> get copyWith =>
      __$$PageResultArgsImplCopyWithImpl<_$PageResultArgsImpl>(
          this, _$identity);
}

abstract class _PageResultArgs implements PageResultArgs {
  const factory _PageResultArgs(
      {final String? locationName,
      final String? keyWord}) = _$PageResultArgsImpl;

  @override
  String? get locationName;
  @override
  String? get keyWord;
  @override
  @JsonKey(ignore: true)
  _$$PageResultArgsImplCopyWith<_$PageResultArgsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

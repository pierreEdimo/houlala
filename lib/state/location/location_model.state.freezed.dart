// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_model.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocationModelState {
  List<LocationModel> get locationList => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationModelStateCopyWith<LocationModelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationModelStateCopyWith<$Res> {
  factory $LocationModelStateCopyWith(
          LocationModelState value, $Res Function(LocationModelState) then) =
      _$LocationModelStateCopyWithImpl<$Res, LocationModelState>;
  @useResult
  $Res call(
      {List<LocationModel> locationList,
      bool loading,
      String errorMessage,
      bool error});
}

/// @nodoc
class _$LocationModelStateCopyWithImpl<$Res, $Val extends LocationModelState>
    implements $LocationModelStateCopyWith<$Res> {
  _$LocationModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationList = null,
    Object? loading = null,
    Object? errorMessage = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      locationList: null == locationList
          ? _value.locationList
          : locationList // ignore: cast_nullable_to_non_nullable
              as List<LocationModel>,
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
abstract class _$$LocationModelStateImplCopyWith<$Res>
    implements $LocationModelStateCopyWith<$Res> {
  factory _$$LocationModelStateImplCopyWith(_$LocationModelStateImpl value,
          $Res Function(_$LocationModelStateImpl) then) =
      __$$LocationModelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<LocationModel> locationList,
      bool loading,
      String errorMessage,
      bool error});
}

/// @nodoc
class __$$LocationModelStateImplCopyWithImpl<$Res>
    extends _$LocationModelStateCopyWithImpl<$Res, _$LocationModelStateImpl>
    implements _$$LocationModelStateImplCopyWith<$Res> {
  __$$LocationModelStateImplCopyWithImpl(_$LocationModelStateImpl _value,
      $Res Function(_$LocationModelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationList = null,
    Object? loading = null,
    Object? errorMessage = null,
    Object? error = null,
  }) {
    return _then(_$LocationModelStateImpl(
      locationList: null == locationList
          ? _value._locationList
          : locationList // ignore: cast_nullable_to_non_nullable
              as List<LocationModel>,
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

class _$LocationModelStateImpl implements _LocationModelState {
  _$LocationModelStateImpl(
      {final List<LocationModel> locationList = const [],
      this.loading = false,
      this.errorMessage = '',
      this.error = false})
      : _locationList = locationList;

  final List<LocationModel> _locationList;
  @override
  @JsonKey()
  List<LocationModel> get locationList {
    if (_locationList is EqualUnmodifiableListView) return _locationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locationList);
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
    return 'LocationModelState(locationList: $locationList, loading: $loading, errorMessage: $errorMessage, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationModelStateImpl &&
            const DeepCollectionEquality()
                .equals(other._locationList, _locationList) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_locationList),
      loading,
      errorMessage,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationModelStateImplCopyWith<_$LocationModelStateImpl> get copyWith =>
      __$$LocationModelStateImplCopyWithImpl<_$LocationModelStateImpl>(
          this, _$identity);
}

abstract class _LocationModelState implements LocationModelState {
  factory _LocationModelState(
      {final List<LocationModel> locationList,
      final bool loading,
      final String errorMessage,
      final bool error}) = _$LocationModelStateImpl;

  @override
  List<LocationModel> get locationList;
  @override
  bool get loading;
  @override
  String get errorMessage;
  @override
  bool get error;
  @override
  @JsonKey(ignore: true)
  _$$LocationModelStateImplCopyWith<_$LocationModelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

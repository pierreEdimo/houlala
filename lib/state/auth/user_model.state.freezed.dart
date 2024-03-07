// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserModelState {
  UserModel? get connectedUser => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserModelStateCopyWith<UserModelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelStateCopyWith<$Res> {
  factory $UserModelStateCopyWith(
          UserModelState value, $Res Function(UserModelState) then) =
      _$UserModelStateCopyWithImpl<$Res, UserModelState>;
  @useResult
  $Res call(
      {UserModel? connectedUser,
      bool loading,
      bool error,
      String errorMessage});

  $UserModelCopyWith<$Res>? get connectedUser;
}

/// @nodoc
class _$UserModelStateCopyWithImpl<$Res, $Val extends UserModelState>
    implements $UserModelStateCopyWith<$Res> {
  _$UserModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectedUser = freezed,
    Object? loading = null,
    Object? error = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      connectedUser: freezed == connectedUser
          ? _value.connectedUser
          : connectedUser // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get connectedUser {
    if (_value.connectedUser == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.connectedUser!, (value) {
      return _then(_value.copyWith(connectedUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelStateImplCopyWith<$Res>
    implements $UserModelStateCopyWith<$Res> {
  factory _$$UserModelStateImplCopyWith(_$UserModelStateImpl value,
          $Res Function(_$UserModelStateImpl) then) =
      __$$UserModelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserModel? connectedUser,
      bool loading,
      bool error,
      String errorMessage});

  @override
  $UserModelCopyWith<$Res>? get connectedUser;
}

/// @nodoc
class __$$UserModelStateImplCopyWithImpl<$Res>
    extends _$UserModelStateCopyWithImpl<$Res, _$UserModelStateImpl>
    implements _$$UserModelStateImplCopyWith<$Res> {
  __$$UserModelStateImplCopyWithImpl(
      _$UserModelStateImpl _value, $Res Function(_$UserModelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectedUser = freezed,
    Object? loading = null,
    Object? error = null,
    Object? errorMessage = null,
  }) {
    return _then(_$UserModelStateImpl(
      connectedUser: freezed == connectedUser
          ? _value.connectedUser
          : connectedUser // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserModelStateImpl implements _UserModelState {
  _$UserModelStateImpl(
      {this.connectedUser = null,
      this.loading = false,
      this.error = false,
      this.errorMessage = ''});

  @override
  @JsonKey()
  final UserModel? connectedUser;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool error;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'UserModelState(connectedUser: $connectedUser, loading: $loading, error: $error, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelStateImpl &&
            (identical(other.connectedUser, connectedUser) ||
                other.connectedUser == connectedUser) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, connectedUser, loading, error, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelStateImplCopyWith<_$UserModelStateImpl> get copyWith =>
      __$$UserModelStateImplCopyWithImpl<_$UserModelStateImpl>(
          this, _$identity);
}

abstract class _UserModelState implements UserModelState {
  factory _UserModelState(
      {final UserModel? connectedUser,
      final bool loading,
      final bool error,
      final String errorMessage}) = _$UserModelStateImpl;

  @override
  UserModel? get connectedUser;
  @override
  bool get loading;
  @override
  bool get error;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$UserModelStateImplCopyWith<_$UserModelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

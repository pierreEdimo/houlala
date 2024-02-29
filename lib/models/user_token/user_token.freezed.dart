// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserToken _$UserTokenFromJson(Map<String, dynamic> json) {
  return _UserToken.fromJson(json);
}

/// @nodoc
mixin _$UserToken {
  String? get userName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserTokenCopyWith<UserToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTokenCopyWith<$Res> {
  factory $UserTokenCopyWith(UserToken value, $Res Function(UserToken) then) =
      _$UserTokenCopyWithImpl<$Res, UserToken>;
  @useResult
  $Res call({String? userName, String? email, String? token});
}

/// @nodoc
class _$UserTokenCopyWithImpl<$Res, $Val extends UserToken>
    implements $UserTokenCopyWith<$Res> {
  _$UserTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = freezed,
    Object? email = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserTokenImplCopyWith<$Res>
    implements $UserTokenCopyWith<$Res> {
  factory _$$UserTokenImplCopyWith(
          _$UserTokenImpl value, $Res Function(_$UserTokenImpl) then) =
      __$$UserTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? userName, String? email, String? token});
}

/// @nodoc
class __$$UserTokenImplCopyWithImpl<$Res>
    extends _$UserTokenCopyWithImpl<$Res, _$UserTokenImpl>
    implements _$$UserTokenImplCopyWith<$Res> {
  __$$UserTokenImplCopyWithImpl(
      _$UserTokenImpl _value, $Res Function(_$UserTokenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = freezed,
    Object? email = freezed,
    Object? token = freezed,
  }) {
    return _then(_$UserTokenImpl(
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserTokenImpl implements _UserToken {
  const _$UserTokenImpl({this.userName, this.email, this.token});

  factory _$UserTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserTokenImplFromJson(json);

  @override
  final String? userName;
  @override
  final String? email;
  @override
  final String? token;

  @override
  String toString() {
    return 'UserToken(userName: $userName, email: $email, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserTokenImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userName, email, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserTokenImplCopyWith<_$UserTokenImpl> get copyWith =>
      __$$UserTokenImplCopyWithImpl<_$UserTokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserTokenImplToJson(
      this,
    );
  }
}

abstract class _UserToken implements UserToken {
  const factory _UserToken(
      {final String? userName,
      final String? email,
      final String? token}) = _$UserTokenImpl;

  factory _UserToken.fromJson(Map<String, dynamic> json) =
      _$UserTokenImpl.fromJson;

  @override
  String? get userName;
  @override
  String? get email;
  @override
  String? get token;
  @override
  @JsonKey(ignore: true)
  _$$UserTokenImplCopyWith<_$UserTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

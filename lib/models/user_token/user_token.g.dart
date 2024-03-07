// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserTokenImpl _$$UserTokenImplFromJson(Map<String, dynamic> json) =>
    _$UserTokenImpl(
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      token: json['token'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$$UserTokenImplToJson(_$UserTokenImpl instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
      'token': instance.token,
      'userId': instance.userId,
    };

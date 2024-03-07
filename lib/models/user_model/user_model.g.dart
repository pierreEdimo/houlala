// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String?,
      city: json['city'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      streetName: json['streetName'] as String?,
      poBox: json['poBox'] as String?,
      houseNumber: json['houseNumber'] as String?,
      userName: json['userName'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'city': instance.city,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'streetName': instance.streetName,
      'poBox': instance.poBox,
      'houseNumber': instance.houseNumber,
      'userName': instance.userName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

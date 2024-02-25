// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationModelImpl _$$LocationModelImplFromJson(Map<String, dynamic> json) =>
    _$LocationModelImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      telephoneNumber: json['telephoneNumber'] as String?,
      email: json['email'] as String?,
      website: json['website'] as String?,
      uniqueIdentifier: json['uniqueIdentifier'] as String?,
      store: json['store'] as bool?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      category: json['category'] == null
          ? null
          : StoreCategoryModel.fromJson(
              json['category'] as Map<String, dynamic>),
      creator: json['creator'] == null
          ? null
          : Owner.fromJson(json['creator'] as Map<String, dynamic>),
      country: json['country'] == null
          ? null
          : CountryModel.fromJson(json['country'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : LocationAddress.fromJson(json['address'] as Map<String, dynamic>),
      shortDescription: json['shortDescription'] as String?,
    );

Map<String, dynamic> _$$LocationModelImplToJson(_$LocationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'telephoneNumber': instance.telephoneNumber,
      'email': instance.email,
      'website': instance.website,
      'uniqueIdentifier': instance.uniqueIdentifier,
      'store': instance.store,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'category': instance.category,
      'creator': instance.creator,
      'country': instance.country,
      'address': instance.address,
      'shortDescription': instance.shortDescription,
    };

_$LocationAddressImpl _$$LocationAddressImplFromJson(
        Map<String, dynamic> json) =>
    _$LocationAddressImpl(
      id: json['id'] as int?,
      city: json['city'] as String?,
      streetName: json['streetName'] as String?,
      poBox: json['poBox'] as String?,
    );

Map<String, dynamic> _$$LocationAddressImplToJson(
        _$LocationAddressImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'city': instance.city,
      'streetName': instance.streetName,
      'poBox': instance.poBox,
    };

_$OwnerImpl _$$OwnerImplFromJson(Map<String, dynamic> json) => _$OwnerImpl(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
    );

Map<String, dynamic> _$$OwnerImplToJson(_$OwnerImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

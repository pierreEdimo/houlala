import 'package:houlala/model/store_category.dart';

import 'country.dart';

class LocationModel {
  final int? id;
  final String? name;
  final String? telephoneNumber;
  final String? email;
  final String? website;
  final String? uniqueIdentifier;
  final bool? store;
  final String? description;
  final String? imageUrl;
  final Country? country;
  final LocationAddress? address;
  final StoreCategory? category;
  final String? shortDescription;
  final Owner? creator;

  LocationModel({
    this.id,
    this.name,
    this.telephoneNumber,
    this.email,
    this.website,
    this.uniqueIdentifier,
    this.description,
    this.store,
    this.imageUrl,
    this.country,
    this.address,
    this.category,
    this.shortDescription,
    this.creator,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
      id: json["id"],
      name: json["name"],
      telephoneNumber: json["telephoneNumber"],
      email: json["email"],
      website: json["email"],
      uniqueIdentifier: json["uniqueIdentifier"],
      store: json["store"],
      imageUrl: json["imageUrl"],
      country: Country.fromJson(json['country']),
      address: LocationAddress.fromJson(json['address']),
      description: json["description"],
      category: StoreCategory.fromJson(json['category']),
      shortDescription: json["shortDescription"],
      creator: Owner.fromJson(json["creator"]));
}

class LocationAddress {
  final int? id;
  final String? city;
  final String? streetName;
  final String? poBox;

  LocationAddress({this.id, this.city, this.streetName, this.poBox});

  factory LocationAddress.fromJson(Map<String, dynamic> json) =>
      LocationAddress(
        id: json["id"],
        city: json["city"],
        streetName: json["streetName"],
        poBox: json["poBox"],
      );
}

class Owner {
  final String? firstName;
  final String? lastName;

  Owner({
    this.firstName,
    this.lastName,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        firstName: json["firstName"],
        lastName: json["lastName"],
      );
}

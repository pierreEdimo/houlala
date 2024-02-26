import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:houlala/models/country/country_model.dart';
import 'package:houlala/models/store_category/store_category_model.dart';

part 'location_model.freezed.dart';

part 'location_model.g.dart';

@freezed
class LocationModel with _$LocationModel {
  const factory LocationModel(
      {int? id,
      String? name,
      String? telephoneNumber,
      String? email,
      String? website,
      String? uniqueIdentifier,
      bool? store,
      String? description,
      String? imageUrl,
      StoreCategoryModel? category,
      Owner? creator,
      CountryModel? country,
      LocationAddress? address,
      int? productTotalCount,
      int? orderSoldCount,
      String? shortDescription}) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}

@freezed
class LocationAddress with _$LocationAddress {
  const factory LocationAddress(
      {int? id,
      String? city,
      String? streetName,
      String? poBox}) = _LocationAddress;

  factory LocationAddress.fromJson(Map<String, dynamic> json) =>
      _$LocationAddressFromJson(json);
}

@freezed
class Owner with _$Owner {
  const factory Owner({
    String? firstName,
    String? lastName,
  }) = _Owner;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}

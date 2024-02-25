// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) {
  return _LocationModel.fromJson(json);
}

/// @nodoc
mixin _$LocationModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get telephoneNumber => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  String? get uniqueIdentifier => throw _privateConstructorUsedError;
  bool? get store => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  StoreCategoryModel? get category => throw _privateConstructorUsedError;
  Owner? get creator => throw _privateConstructorUsedError;
  CountryModel? get country => throw _privateConstructorUsedError;
  LocationAddress? get address => throw _privateConstructorUsedError;
  String? get shortDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationModelCopyWith<LocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationModelCopyWith<$Res> {
  factory $LocationModelCopyWith(
          LocationModel value, $Res Function(LocationModel) then) =
      _$LocationModelCopyWithImpl<$Res, LocationModel>;
  @useResult
  $Res call(
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
      String? shortDescription});

  $StoreCategoryModelCopyWith<$Res>? get category;
  $OwnerCopyWith<$Res>? get creator;
  $CountryModelCopyWith<$Res>? get country;
  $LocationAddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$LocationModelCopyWithImpl<$Res, $Val extends LocationModel>
    implements $LocationModelCopyWith<$Res> {
  _$LocationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? telephoneNumber = freezed,
    Object? email = freezed,
    Object? website = freezed,
    Object? uniqueIdentifier = freezed,
    Object? store = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? category = freezed,
    Object? creator = freezed,
    Object? country = freezed,
    Object? address = freezed,
    Object? shortDescription = freezed,
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
      telephoneNumber: freezed == telephoneNumber
          ? _value.telephoneNumber
          : telephoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      uniqueIdentifier: freezed == uniqueIdentifier
          ? _value.uniqueIdentifier
          : uniqueIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as bool?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as StoreCategoryModel?,
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as Owner?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as CountryModel?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as LocationAddress?,
      shortDescription: freezed == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StoreCategoryModelCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $StoreCategoryModelCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OwnerCopyWith<$Res>? get creator {
    if (_value.creator == null) {
      return null;
    }

    return $OwnerCopyWith<$Res>(_value.creator!, (value) {
      return _then(_value.copyWith(creator: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CountryModelCopyWith<$Res>? get country {
    if (_value.country == null) {
      return null;
    }

    return $CountryModelCopyWith<$Res>(_value.country!, (value) {
      return _then(_value.copyWith(country: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationAddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $LocationAddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LocationModelImplCopyWith<$Res>
    implements $LocationModelCopyWith<$Res> {
  factory _$$LocationModelImplCopyWith(
          _$LocationModelImpl value, $Res Function(_$LocationModelImpl) then) =
      __$$LocationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
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
      String? shortDescription});

  @override
  $StoreCategoryModelCopyWith<$Res>? get category;
  @override
  $OwnerCopyWith<$Res>? get creator;
  @override
  $CountryModelCopyWith<$Res>? get country;
  @override
  $LocationAddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$LocationModelImplCopyWithImpl<$Res>
    extends _$LocationModelCopyWithImpl<$Res, _$LocationModelImpl>
    implements _$$LocationModelImplCopyWith<$Res> {
  __$$LocationModelImplCopyWithImpl(
      _$LocationModelImpl _value, $Res Function(_$LocationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? telephoneNumber = freezed,
    Object? email = freezed,
    Object? website = freezed,
    Object? uniqueIdentifier = freezed,
    Object? store = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? category = freezed,
    Object? creator = freezed,
    Object? country = freezed,
    Object? address = freezed,
    Object? shortDescription = freezed,
  }) {
    return _then(_$LocationModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      telephoneNumber: freezed == telephoneNumber
          ? _value.telephoneNumber
          : telephoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      uniqueIdentifier: freezed == uniqueIdentifier
          ? _value.uniqueIdentifier
          : uniqueIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as bool?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as StoreCategoryModel?,
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as Owner?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as CountryModel?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as LocationAddress?,
      shortDescription: freezed == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationModelImpl implements _LocationModel {
  const _$LocationModelImpl(
      {this.id,
      this.name,
      this.telephoneNumber,
      this.email,
      this.website,
      this.uniqueIdentifier,
      this.store,
      this.description,
      this.imageUrl,
      this.category,
      this.creator,
      this.country,
      this.address,
      this.shortDescription});

  factory _$LocationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? telephoneNumber;
  @override
  final String? email;
  @override
  final String? website;
  @override
  final String? uniqueIdentifier;
  @override
  final bool? store;
  @override
  final String? description;
  @override
  final String? imageUrl;
  @override
  final StoreCategoryModel? category;
  @override
  final Owner? creator;
  @override
  final CountryModel? country;
  @override
  final LocationAddress? address;
  @override
  final String? shortDescription;

  @override
  String toString() {
    return 'LocationModel(id: $id, name: $name, telephoneNumber: $telephoneNumber, email: $email, website: $website, uniqueIdentifier: $uniqueIdentifier, store: $store, description: $description, imageUrl: $imageUrl, category: $category, creator: $creator, country: $country, address: $address, shortDescription: $shortDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.telephoneNumber, telephoneNumber) ||
                other.telephoneNumber == telephoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.uniqueIdentifier, uniqueIdentifier) ||
                other.uniqueIdentifier == uniqueIdentifier) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.creator, creator) || other.creator == creator) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      telephoneNumber,
      email,
      website,
      uniqueIdentifier,
      store,
      description,
      imageUrl,
      category,
      creator,
      country,
      address,
      shortDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationModelImplCopyWith<_$LocationModelImpl> get copyWith =>
      __$$LocationModelImplCopyWithImpl<_$LocationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationModelImplToJson(
      this,
    );
  }
}

abstract class _LocationModel implements LocationModel {
  const factory _LocationModel(
      {final int? id,
      final String? name,
      final String? telephoneNumber,
      final String? email,
      final String? website,
      final String? uniqueIdentifier,
      final bool? store,
      final String? description,
      final String? imageUrl,
      final StoreCategoryModel? category,
      final Owner? creator,
      final CountryModel? country,
      final LocationAddress? address,
      final String? shortDescription}) = _$LocationModelImpl;

  factory _LocationModel.fromJson(Map<String, dynamic> json) =
      _$LocationModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get telephoneNumber;
  @override
  String? get email;
  @override
  String? get website;
  @override
  String? get uniqueIdentifier;
  @override
  bool? get store;
  @override
  String? get description;
  @override
  String? get imageUrl;
  @override
  StoreCategoryModel? get category;
  @override
  Owner? get creator;
  @override
  CountryModel? get country;
  @override
  LocationAddress? get address;
  @override
  String? get shortDescription;
  @override
  @JsonKey(ignore: true)
  _$$LocationModelImplCopyWith<_$LocationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocationAddress _$LocationAddressFromJson(Map<String, dynamic> json) {
  return _LocationAddress.fromJson(json);
}

/// @nodoc
mixin _$LocationAddress {
  int? get id => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get streetName => throw _privateConstructorUsedError;
  String? get poBox => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationAddressCopyWith<LocationAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationAddressCopyWith<$Res> {
  factory $LocationAddressCopyWith(
          LocationAddress value, $Res Function(LocationAddress) then) =
      _$LocationAddressCopyWithImpl<$Res, LocationAddress>;
  @useResult
  $Res call({int? id, String? city, String? streetName, String? poBox});
}

/// @nodoc
class _$LocationAddressCopyWithImpl<$Res, $Val extends LocationAddress>
    implements $LocationAddressCopyWith<$Res> {
  _$LocationAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? city = freezed,
    Object? streetName = freezed,
    Object? poBox = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      streetName: freezed == streetName
          ? _value.streetName
          : streetName // ignore: cast_nullable_to_non_nullable
              as String?,
      poBox: freezed == poBox
          ? _value.poBox
          : poBox // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationAddressImplCopyWith<$Res>
    implements $LocationAddressCopyWith<$Res> {
  factory _$$LocationAddressImplCopyWith(_$LocationAddressImpl value,
          $Res Function(_$LocationAddressImpl) then) =
      __$$LocationAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? city, String? streetName, String? poBox});
}

/// @nodoc
class __$$LocationAddressImplCopyWithImpl<$Res>
    extends _$LocationAddressCopyWithImpl<$Res, _$LocationAddressImpl>
    implements _$$LocationAddressImplCopyWith<$Res> {
  __$$LocationAddressImplCopyWithImpl(
      _$LocationAddressImpl _value, $Res Function(_$LocationAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? city = freezed,
    Object? streetName = freezed,
    Object? poBox = freezed,
  }) {
    return _then(_$LocationAddressImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      streetName: freezed == streetName
          ? _value.streetName
          : streetName // ignore: cast_nullable_to_non_nullable
              as String?,
      poBox: freezed == poBox
          ? _value.poBox
          : poBox // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationAddressImpl implements _LocationAddress {
  const _$LocationAddressImpl(
      {this.id, this.city, this.streetName, this.poBox});

  factory _$LocationAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationAddressImplFromJson(json);

  @override
  final int? id;
  @override
  final String? city;
  @override
  final String? streetName;
  @override
  final String? poBox;

  @override
  String toString() {
    return 'LocationAddress(id: $id, city: $city, streetName: $streetName, poBox: $poBox)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationAddressImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.streetName, streetName) ||
                other.streetName == streetName) &&
            (identical(other.poBox, poBox) || other.poBox == poBox));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, city, streetName, poBox);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationAddressImplCopyWith<_$LocationAddressImpl> get copyWith =>
      __$$LocationAddressImplCopyWithImpl<_$LocationAddressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationAddressImplToJson(
      this,
    );
  }
}

abstract class _LocationAddress implements LocationAddress {
  const factory _LocationAddress(
      {final int? id,
      final String? city,
      final String? streetName,
      final String? poBox}) = _$LocationAddressImpl;

  factory _LocationAddress.fromJson(Map<String, dynamic> json) =
      _$LocationAddressImpl.fromJson;

  @override
  int? get id;
  @override
  String? get city;
  @override
  String? get streetName;
  @override
  String? get poBox;
  @override
  @JsonKey(ignore: true)
  _$$LocationAddressImplCopyWith<_$LocationAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Owner _$OwnerFromJson(Map<String, dynamic> json) {
  return _Owner.fromJson(json);
}

/// @nodoc
mixin _$Owner {
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OwnerCopyWith<Owner> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnerCopyWith<$Res> {
  factory $OwnerCopyWith(Owner value, $Res Function(Owner) then) =
      _$OwnerCopyWithImpl<$Res, Owner>;
  @useResult
  $Res call({String? firstName, String? lastName});
}

/// @nodoc
class _$OwnerCopyWithImpl<$Res, $Val extends Owner>
    implements $OwnerCopyWith<$Res> {
  _$OwnerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OwnerImplCopyWith<$Res> implements $OwnerCopyWith<$Res> {
  factory _$$OwnerImplCopyWith(
          _$OwnerImpl value, $Res Function(_$OwnerImpl) then) =
      __$$OwnerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? firstName, String? lastName});
}

/// @nodoc
class __$$OwnerImplCopyWithImpl<$Res>
    extends _$OwnerCopyWithImpl<$Res, _$OwnerImpl>
    implements _$$OwnerImplCopyWith<$Res> {
  __$$OwnerImplCopyWithImpl(
      _$OwnerImpl _value, $Res Function(_$OwnerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
  }) {
    return _then(_$OwnerImpl(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OwnerImpl implements _Owner {
  const _$OwnerImpl({this.firstName, this.lastName});

  factory _$OwnerImpl.fromJson(Map<String, dynamic> json) =>
      _$$OwnerImplFromJson(json);

  @override
  final String? firstName;
  @override
  final String? lastName;

  @override
  String toString() {
    return 'Owner(firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OwnerImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OwnerImplCopyWith<_$OwnerImpl> get copyWith =>
      __$$OwnerImplCopyWithImpl<_$OwnerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OwnerImplToJson(
      this,
    );
  }
}

abstract class _Owner implements Owner {
  const factory _Owner({final String? firstName, final String? lastName}) =
      _$OwnerImpl;

  factory _Owner.fromJson(Map<String, dynamic> json) = _$OwnerImpl.fromJson;

  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  @JsonKey(ignore: true)
  _$$OwnerImplCopyWith<_$OwnerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

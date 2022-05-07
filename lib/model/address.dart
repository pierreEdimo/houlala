
import 'package:hive/hive.dart';

part 'address.g.dart';

@HiveType(typeId: 5)
class Address {
  Address({
    this.city,
    this.country,
    this.streetName,
    this.poBox,
  });

  @HiveField(0)
  final String? city;

  @HiveField(1)
  final String? country;

  @HiveField(2)
  final String? streetName;

  @HiveField(3)
  final String? poBox;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    city: json["city"],
    country: json["country"],
    streetName: json["streetName"],
    poBox: json["poBox"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "country": country,
    "streetName": streetName,
    "poBox": poBox,
  };
}
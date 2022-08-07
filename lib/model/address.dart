class Address {
  Address({
    this.city,
    this.country,
    this.streetName,
    this.poBox,
    this.houseNumber,
  });

  final String? city;

  final String? country;

  final String? streetName;

  final String? poBox;

  final String? houseNumber;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json["city"],
        country: json["country"],
        streetName: json["streetName"],
        poBox: json["poBox"],
        houseNumber: json["houseNumber"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "country": country,
        "streetName": streetName,
        "poBox": poBox,
        "houseNumber": houseNumber,
      };
}

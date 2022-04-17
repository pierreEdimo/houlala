class Register {
  Register({
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.address,
    this.telephoneNumber,
  });

  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;
  final Address? address;
  final String? telephoneNumber;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
    email: json["email"],
    password: json["password"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    address: Address.fromJson(json["address"]),
    telephoneNumber: json["telephoneNumber"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "firstName": firstName,
    "lastName": lastName,
    "address": address!.toJson(),
    "telephoneNumber": telephoneNumber,
  };
}

class Address {
  Address({
    this.city,
    this.country,
    this.streetName,
    this.poBox,
  });

  final String? city;
  final String? country;
  final String? streetName;
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

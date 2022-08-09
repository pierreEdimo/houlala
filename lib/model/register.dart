class Register {
  Register({
    this.email,
    this.password,
    this.telephoneNumber,
    this.userName,
    this.name,
    this.poBox,
    this.country,
    this.city,
    this.houseNumber,
    this.streetName,
    this.firstName,
  });

  final String? email;
  final String? password;
  final String? telephoneNumber;
  final String? userName;
  final String? name;
  final String? firstName;
  final String? streetName;
  final String? houseNumber;
  final String? city;
  final String? country;
  final String? poBox;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        email: json["email"],
        password: json["passWord"],
        name: json["lastName"],
        telephoneNumber: json["phoneNumber"],
        userName: json["userName"],
        streetName: json["streetName"],
        poBox: json["poBox"],
        city: json["city"],
        country: json["country"],
        houseNumber: json["houseNumber"],
        firstName: json["firstName"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "passWord": password,
        "phoneNumber": telephoneNumber,
        "userName": userName,
        "country": country,
        "city": city,
        "houseNumber": houseNumber,
        "poBox": poBox,
        "streetName": streetName,
        "lastName": name,
        "firstName": firstName,
      };
}

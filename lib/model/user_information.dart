class UserInformation {
  final String? id;
  final String? name;
  final String? city;
  final String? country;
  final String? email;
  final String? telephoneNumber;
  final String? streetName;
  final String? poBox;
  final String? houseNumber;
  final String? userName;

  UserInformation({
    this.email,
    this.telephoneNumber,
    this.name,
    this.city,
    this.country,
    this.streetName,
    this.poBox,
    this.houseNumber,
    this.userName,
    this.id,
  });

  factory UserInformation.fromJson(Map<String, dynamic> json) =>
      UserInformation(
          email: json["email"],
          telephoneNumber: json["phoneNumber"],
          name: json["name"],
          city: json["city"],
          country: json["country"],
          streetName: json["streetName"],
          houseNumber: json["houseNumber"],
          userName: json["userName"],
          id: json["id"],
          poBox: json["poBox"]);

  Map<String, dynamic> toJson() => {
        "email": email,
        "phoneNumber": telephoneNumber,
        "name": name,
        "city": city,
        "country": country,
        "streetName": streetName,
        "poBox": poBox,
        "houseNumber": houseNumber,
        "userName": userName,
        "id": id
      };
}

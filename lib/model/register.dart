import 'address.dart';

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



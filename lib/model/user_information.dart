class UserInformation {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? telephoneNumber;

  UserInformation(
      {this.email, this.telephoneNumber, this.firstName, this.lastName});

  factory UserInformation.fromJson(Map<String, dynamic> json) =>
      UserInformation(
        email: json["email"] as String,
        telephoneNumber: json["telephoneNumber"] as String,
        firstName: json["firstName"] as String,
        lastName: json["lastName"] as String,
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "telephoneNumber": telephoneNumber,
        "firstName": firstName,
        "lastName": lastName,
      };
}

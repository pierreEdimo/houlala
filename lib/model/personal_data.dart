class PersonalData {
  final String? name;
  final String? userName;
  final String? phoneNumber;
  final String? firstName;

  PersonalData({
    this.name,
    this.userName,
    this.phoneNumber,
    this.firstName,
  });

  factory PersonalData.fromJson(Map<String, dynamic> json) => PersonalData(
        name: json["lastName"],
        userName: json["userName"],
        phoneNumber: json["phoneNumber"],
        firstName: json["firstName"],
      );

  Map<String, dynamic> toJson() => {
        "lastName": name,
        "userName": userName,
        "phoneNumber": phoneNumber,
        "firstName": firstName,
      };
}

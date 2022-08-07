class PersonalData {
  final String? name;
  final String? userName;
  final String? phoneNumber;

  PersonalData({
    this.name,
    this.userName,
    this.phoneNumber,
  });

  factory PersonalData.fromJson(Map<String, dynamic> json) => PersonalData(
        name: json["name"],
        userName: json["userName"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "userName": userName,
        "phoneNumber": phoneNumber,
      };
}

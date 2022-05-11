import 'package:hive/hive.dart';

part 'personal_datas.g.dart';

@HiveType(typeId: 2)
class PersonalData {
  @HiveField(0)
  final String? firstName;

  @HiveField(1)
  final String? lastName;

  @HiveField(2)
  final String? email;

  @HiveField(3)
  final String? telephoneNumber;



  PersonalData({
    this.firstName,
    this.lastName,
    this.email,
    this.telephoneNumber,
  });

  factory PersonalData.fromJson(Map<String, dynamic> json) => PersonalData(
        telephoneNumber: json["telephoneNumber"] as String,
        firstName: json["firstname"] as String,
        lastName: json["lastname"] as String,
        email: json["email"] as String,
      );

  Map<String, dynamic> toJson() => {
        "telephoneNumber": telephoneNumber,
        "firstname": firstName,
        "lastname": lastName,
        "email": email,
      };
}


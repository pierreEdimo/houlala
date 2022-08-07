class EditEmail {
  final String? email;

  EditEmail({this.email});

  factory EditEmail.fromJson(Map<String, dynamic> json) =>
      EditEmail(
        email: json["email"],
      );

  Map<String, dynamic> toJson() =>
      {
        "email": email
      };
}

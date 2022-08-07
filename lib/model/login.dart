class Login {
  Login({
    this.email,
    this.password,
  });

  final String? email;
  final String? password;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    email: json["email"],
    password: json["passWord"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "passWord": password,
  };
}
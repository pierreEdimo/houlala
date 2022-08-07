class Author {
  final String? email;
  final String? userName;
  final String? id;

  Author({
    this.email,
    this.userName,
    this.id,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
      email: json['email'] as String,
      userName: json['userName'] as String,
      id: json['id'] as String);
}

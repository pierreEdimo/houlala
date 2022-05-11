class Author {
  final String? firstName;
  final String? lastName;
  final String? id;

  Author({
    this.firstName,
    this.lastName,
    this.id,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      id: json['_id'] as String);
}

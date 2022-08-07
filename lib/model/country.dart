class Country {
  final String? name;
  final String? code;
  final int? id;

  Country({
    this.id,
    this.name,
    this.code,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      Country(name: json["name"], code: json["code"], id: json["id"]);
}

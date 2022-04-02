class Specialisation {
  final String? id;
  final String? label;

  Specialisation({this.id, this.label});

  factory Specialisation.fromJson(Map<String, dynamic> json) => Specialisation(
        label: json['label'] as String,
        id: json['_id'] as String,
      );
}

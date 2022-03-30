class CategoryType {
  final String? label;
  final String? id;

  CategoryType({this.id, this.label});

  factory CategoryType.fromJson(Map<String, dynamic> json) => CategoryType(
        id: json['_id'] as String,
        label: json['label'] as String,
      );
}

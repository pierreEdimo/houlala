class PopulatedPage {
  final String? name;
  final String? imageUrl;
  final String? id;
  final String? headQuarterCountry;
  final String? headQuarterCity;

  PopulatedPage({
    this.name,
    this.imageUrl,
    this.id,
    this.headQuarterCountry,
    this.headQuarterCity,
  });

  factory PopulatedPage.fromJson(Map<String, dynamic> json) => PopulatedPage(
    imageUrl: json['imageUrl'] as String,
    name: json['name'] as String,
    id: json['_id'] as String,
    headQuarterCountry: json['headQuarters_country'] as String,
    headQuarterCity: json['headQuarters_city'] as String,
  );
}
class SimplifiedLocation {
  final String? name;
  final int? id;
  final String? imageUrl;

  SimplifiedLocation({
    this.id,
    this.name,
    this.imageUrl,
  });

  factory SimplifiedLocation.fromJson(Map<String, dynamic> json) => SimplifiedLocation(
    imageUrl: json['imageUrl'],
    id: json['id'],
    name: json['name'],
  );
}
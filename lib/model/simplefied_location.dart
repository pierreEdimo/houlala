class SimplifiedLocation {
  final String? name;
  final int? id;
  final String? imageUrl;
  final String? email;

  SimplifiedLocation({
    this.id,
    this.name,
    this.imageUrl,
    this.email,
  });

  factory SimplifiedLocation.fromJson(Map<String, dynamic> json) => SimplifiedLocation(
    imageUrl: json['imageUrl'],
    id: json['id'],
    name: json['name'],
    email: json['email']
  );


}
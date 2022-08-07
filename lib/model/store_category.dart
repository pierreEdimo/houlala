class StoreCategory{
  final int? id;
  final String? name;
  final String? thumbNail;

  StoreCategory({
    this.id,
    this.name,
    this.thumbNail
});

  factory StoreCategory.fromJson(Map<String, dynamic> json) => StoreCategory(
    id: json['id'],
    thumbNail: json['thumbNail'],
    name: json['name']
  );
}
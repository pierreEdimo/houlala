import 'package:hive/hive.dart';

part 'product_page.g.dart';

@HiveType(typeId: 4)
class Page {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? id;

  Page({this.name, this.id});

  factory Page.fromJson(Map<String, dynamic> json) => Page(
    name: json['name'] as String,
    id: json['_id'] as String,
  );
}

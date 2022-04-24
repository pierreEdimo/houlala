import 'package:houlala/model/populated_page.dart';


class Post {
  final String? imageUrl;
  final String? title;
  final String? content;
  final PopulatedPage? page;
  final String? id;
  final DateTime? createdAt;

  Post({
    this.page,
    this.imageUrl,
    this.content,
    this.id,
    this.title,
    this.createdAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      imageUrl: json['imageUrl'] as String,
      title: json['title'] as String,
      id: json['_id'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt']),
      page: PopulatedPage.fromJson(json['page']));
}



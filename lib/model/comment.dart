import 'author.dart';

class Comment {
  final String? content;
  final DateTime? createdAt;
  final String? id;
  final Author? author;

  Comment({
    this.content,
    this.createdAt,
    this.id,
    this.author
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    content: json['content'] as String,
    id: json['_id'] as String,
    author: Author.fromJson(json['user']),
    createdAt: DateTime.parse(json['createdAt']),
  );
}

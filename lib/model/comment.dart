import 'author.dart';

class Comment {
  final String? content;
  final DateTime? createdAt;
  final String? id;
  final Author? author;
  final String? postId;

  Comment({
    this.postId,
    this.content,
    this.createdAt,
    this.id,
    this.author
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    content: json['content'] as String,
    id: json['_id'] as String,
    author: Author.fromJson(json['user']),
    postId: json['postId'] as String,
    createdAt: DateTime.parse(json['createdAt']),
  );
}

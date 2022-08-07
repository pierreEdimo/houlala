import 'author.dart';

class Comment {
  final String? content;
  final DateTime? createdAt;
  final String? id;
  final String? postId;
  final Author? author;

  Comment({this.postId, this.content, this.createdAt, this.id, this.author});

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        content: json['content'] as String,
        id: json['_id'] as String,
        postId: json['postId'] as String,
        createdAt: DateTime.parse(json['createdAt']),
        author: Author.fromJson(json['author']),
      );
}

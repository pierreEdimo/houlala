import 'package:houlala/model/simplefied_location.dart';

class Post {
  final String? imageUrl;
  final String? content;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  late  bool? liked;
  final int? likeCount;
  final int? commentCount;
  final SimplifiedLocation? location;

  Post({
    this.imageUrl,
    this.content,
    this.id,
    this.createdAt,
    this.likeCount,
    this.liked,
    this.commentCount,
    this.updatedAt,
    this.location,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      imageUrl: json['imageUrl'],
      id: json['_id'],
      content: json['content'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      commentCount: json['commentCount'],
      likeCount: json['likeCount'],
      location: SimplifiedLocation.fromJson(json['location']),
      liked: json['liked']);
}



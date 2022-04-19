import 'package:houlala/model/post.dart';

class FoundPost {
  FoundPost({
    this.foundPost,
    this.commentCount,
    this.likesCount,
    this.isLiked,
  });

  final Post? foundPost;
  final int? commentCount;
  final int? likesCount;
  bool? isLiked;

  factory FoundPost.fromJson(Map<String, dynamic> json) => FoundPost(
        foundPost: Post.fromJson(json["foundPost"]),
        commentCount: json["commentCount"] as int,
        likesCount: json["likesCount"] as int,
        isLiked: json['isLiked'] as bool,
      );
}

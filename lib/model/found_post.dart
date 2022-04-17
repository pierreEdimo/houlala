import 'package:houlala/model/post.dart';

class FoundPost {
  FoundPost({
    this.foundPost,
    this.commentCount,
    this.likesCount,
  });

  final Post? foundPost;
  final int? commentCount;
  final int? likesCount;

  factory FoundPost.fromJson(Map<String, dynamic> json) => FoundPost(
        foundPost: Post.fromJson(json["foundPost"]),
        commentCount: json["commentCount"] as int,
        likesCount: json["likesCount"] as int,
      );
}

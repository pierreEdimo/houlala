import 'package:houlala/model/post.dart';

class FoundPost {
  FoundPost({
    this.foundPost,
    this.isLiked,
    this.commentCount,
    this.likeCount,
  });

  final Post? foundPost;
  bool? isLiked;
  final int? commentCount;
  final int? likeCount;

  factory FoundPost.fromJson(Map<String, dynamic> json) => FoundPost(
        foundPost: Post.fromJson(json["foundPost"]),
        isLiked: json['isLiked'] as bool,
        commentCount: json['commentCount'] as int,
        likeCount: json['likeCount'] as int,
      );
}

class AddComment {
  final String? userId;
  final String? content;
  final String? postId;

  AddComment({this.userId, this.content, this.postId});

  factory AddComment.fromJson(Map<String, dynamic> json) => AddComment(
        userId: json["user"] as String,
        content: json["content"] as String,
        postId: json["postId"] as String,
      );

  Map<String, dynamic> toJson() => {
        "user": userId,
        "content": content,
        "postId": postId,
      };
}

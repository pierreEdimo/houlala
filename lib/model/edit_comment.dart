class EditComment {
  final String? content;

  EditComment({this.content});

  factory EditComment.fromJson(Map<String, dynamic> json) =>
      EditComment(content: json['content'] as String);

  Map<String, dynamic> toJson() => {"content": content};
}

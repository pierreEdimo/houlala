import 'package:houlala/model/page.dart';

class Post {
  final String? imageUrl;
  final String? title;
  final String? content;
  final PageModel? pageModel;
  final String? id;

  Post({
    this.pageModel,
    this.imageUrl,
    this.content,
    this.id,
    this.title,
  });

  factory Post.fromJson(Map<String, dynamic> json) =>
      Post(
          imageUrl: json['imageUrl'] as String,
          title: json['title'] as String,
          id: json['_id'] as String,
          content: json['content'] as String,
          pageModel: PageModel.fromJson(json['page'])
      );
}
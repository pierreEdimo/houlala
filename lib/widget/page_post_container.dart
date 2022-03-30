import 'package:flutter/material.dart';
import 'package:houlala/widget/list_of_posts.dart';

class PagePostContainer extends StatelessWidget {
  final String? url;

  const PagePostContainer({Key? key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListOfPosts(
      height: 0.25,
      uri: url!,
    );
  }
}

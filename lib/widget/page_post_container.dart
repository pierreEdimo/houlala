import 'package:flutter/material.dart';
import 'package:houlala/widget/list_of_posts.dart';

class PagePostContainer extends StatelessWidget {
  final String? url;
  final String? textError;

  const PagePostContainer({
    Key? key,
    this.url,
    this.textError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListOfPosts(
      textError: textError,
      scrollDirection: Axis.vertical,
      height: MediaQuery.of(context).size.height * 0.25,
      uri: url!,
    );
  }
}

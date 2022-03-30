import 'package:flutter/material.dart';
import 'package:houlala/widget/post_body_container.dart';


class PostDetailContainer extends StatelessWidget {
  final String? uri;

  const PostDetailContainer({Key? key, this.uri}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PostBodyContainer(
          uri: uri!,
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';

class ExpandedTitle extends StatelessWidget {
  final String? title;

  const ExpandedTitle({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: titleStyle,
    );
  }
}

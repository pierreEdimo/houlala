import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';

class ExpandedTitel extends StatelessWidget {
  final String? title;

  const ExpandedTitel({
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

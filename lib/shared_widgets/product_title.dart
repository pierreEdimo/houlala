import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';

class ProductTitle extends StatelessWidget {
  final String? title;
  final int? maxLines;

  const ProductTitle({
    super.key,
    this.title,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return  Text(
      title!,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: titleStyle,
    );
  }
}

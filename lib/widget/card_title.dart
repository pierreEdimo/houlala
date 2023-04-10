import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';

class CardTitle extends StatelessWidget {
  final String? name;

  const CardTitle({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ImageIcon(AssetImage('images/store.png')),
        horizontalSpacing,
        Text(name!, style: titleStyle)
      ],
    );
  }
}

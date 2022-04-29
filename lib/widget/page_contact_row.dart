import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/helper/constants.dart';

class PageContactRow extends StatelessWidget {
  final IconData? icon;
  final String? info;

  const PageContactRow({Key? key, this.icon, this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(
          icon!,
          size: 16,
        ),
        horizontalSpacing,
        Text(info!)
      ],
    );
  }
}

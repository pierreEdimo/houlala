import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/helper/constants.dart';

class PageContactRow extends StatelessWidget {
  final IconData? icon;
  final Widget? child;
  final String? thumbNail;

  const PageContactRow({
    Key? key,
    this.icon,
    this.child,
    this.thumbNail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        thumbNail == null
            ? Container()
            : Text(
                thumbNail!,
              ),
        icon == null
            ? Container()
            : FaIcon(
                icon!,
                size: 18,
              ),
        horizontalSpacing,
        child!,
      ],
    );
  }
}

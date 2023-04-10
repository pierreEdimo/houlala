import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/helper/constants.dart';

class CustomListTile extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final Widget? icon;
  final Color? color;

  const CustomListTile({
    Key? key,
    this.imageUrl,
    this.title,
    this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageIcon(
                AssetImage(imageUrl!),
                size: 27,
                color: color ?? const Color(0xff000000),
              ),
              horizontalSpacing,
              Text(
                title!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          icon == null
              ? const FaIcon(
                  FontAwesomeIcons.angleRight,
                )
              : icon!
        ],
      ),
    );
  }
}

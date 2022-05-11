import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomListTile extends StatelessWidget {
  final IconData? leadingIcon;
  final String? title;
  final Widget? icon;

  const CustomListTile({
    Key? key,
    this.leadingIcon,
    this.title,
    this.icon,
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
              FaIcon(leadingIcon),
              const SizedBox(
                width: 10.0,
              ),
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

import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class CustomListTile extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final Color? color;
  final HeroIcon? leadingIcon;

  const CustomListTile({
    Key? key,
    this.imageUrl,
    this.title,
    this.color,
    this.leadingIcon,
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
              leadingIcon != null ? Container(
                margin: const EdgeInsets.only(right: 10.0),
                child: leadingIcon,
              ) : Container(),
              imageUrl != null
                  ? Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: ImageIcon(
                        AssetImage(imageUrl!),
                        size: 22,
                        color: color ?? const Color(0xff000000),
                      ),
                    )
                  : Container(),
              Text(
                title!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

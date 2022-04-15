import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostAdditionalInfo extends StatelessWidget {
  const PostAdditionalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {},
            child: const FaIcon(
              FontAwesomeIcons.heart,
              size: 22.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: const FaIcon(
              FontAwesomeIcons.shareAlt,
              size: 22.0,
            ),
          )
        ],
      ),
    );
  }
}

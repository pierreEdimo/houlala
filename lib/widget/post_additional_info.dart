import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostAdditionalInfo extends StatelessWidget {
  const PostAdditionalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:  [
          InkWell(
            onTap: () {},
            child: Row(
              children: const [
                FaIcon(FontAwesomeIcons.thumbsUp, size: 22.0,),
                SizedBox(width: 3.0,),
                Text("Aimer")
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Row(
              children: const [
                FaIcon(FontAwesomeIcons.shareAlt, size: 22.0,),
                SizedBox(width: 3.0,),
                Text("Partager")
              ],
            ),
          )
        ],
      ),
    );
  }
}

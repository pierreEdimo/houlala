import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/model/post.dart';
import 'package:houlala/widget/like_button.dart';
import 'custom_button_container.dart';

class PostDetailAppBar extends StatelessWidget {
  final Post? foundPost;

  const PostDetailAppBar({
    Key? key,
    this.foundPost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        color: const Color(0xf2f2f2f2),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButtonContainer(
                icon: const FaIcon(FontAwesomeIcons.angleLeft),
                onPressed: () => Navigator.of(context).pop(),
              ),
              LikeButton(
                foundPost: foundPost,
              )
            ],
          ),
        ),
      ),
    );
  }
}

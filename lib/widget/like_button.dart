import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/main.dart';
import 'package:houlala/model/post.dart';
import 'package:houlala/service/post_service.dart';
import 'package:houlala/widget/custom_button_container.dart';
import 'package:houlala/widget/open_login_modal.dart';
import 'package:provider/provider.dart';

class LikeButton extends StatefulWidget {
  final Post? foundPost;

  const LikeButton({Key? key, this.foundPost}) : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    return CustomButtonContainer(
      icon: widget.foundPost!.liked!
          ? const FaIcon(
              FontAwesomeIcons.solidHeart,
              color: Colors.red,
            )
          : const FaIcon(FontAwesomeIcons.heart),
      onPressed: () async {
        String? userId = await storage.read(key: "userId");

        if (userId == null) {
          openModal(context);
        } else {
          var oldStatus = widget.foundPost!.liked!;
          setState(() {
            widget.foundPost!.liked = !(widget.foundPost!.liked!);
          });
          try {
            await Provider.of<PostService>(context, listen: false)
                .likePost(widget.foundPost!.id!);
          } catch (error) {
            setState(() {
              widget.foundPost!.liked = oldStatus;
            });
          }
        }
      },
    );
  }
}

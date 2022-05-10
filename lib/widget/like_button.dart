import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/main.dart';
import 'package:houlala/model/found_post.dart';
import 'package:houlala/service/post_service.dart';
import 'package:houlala/widget/custom_button_container.dart';
import 'package:houlala/widget/open_login_modal.dart';
import 'package:provider/provider.dart';

class LikeButton extends StatefulWidget {
  final FoundPost? foundPost;

  const LikeButton({Key? key, this.foundPost}) : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    return CustomButtonContainer(
      icon: widget.foundPost!.isLiked!
          ? const FaIcon(
              FontAwesomeIcons.solidHeart,
              color: Colors.red,
            )
          : const FaIcon(FontAwesomeIcons.heart),
      onPressed: () async {
        String? userId = "";

        if(!kIsWeb){
          userId = await storage.read(key: "userId");
        } else {
          userId = userIdBox.get("userId");
        }

        if (userId == null) {
          openModal(context);
        } else {
          var oldStatus = widget.foundPost!.isLiked!;
          setState(() {
            widget.foundPost!.isLiked = !(widget.foundPost!.isLiked!);
          });
          try {
            await Provider.of<PostService>(context, listen: false)
                .likePost(widget.foundPost!.foundPost!.id!);
          } catch (error) {
            setState(() {
              widget.foundPost!.isLiked = oldStatus;
            });
          }
        }
      },
    );
  }
}

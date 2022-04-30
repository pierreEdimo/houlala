import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/main.dart';
import 'package:houlala/model/additional_info.dart';
import 'package:houlala/service/post_service.dart';
import 'package:houlala/widget/open_login_modal.dart';
import 'package:provider/provider.dart';

class HomeLikeButton extends StatefulWidget {
  final AdditionalPostInfo? info;
  final String? postId;

  const HomeLikeButton({
    Key? key,
    this.postId,
    this.info,
  }) : super(key: key);

  @override
  State<HomeLikeButton> createState() => _HomeLikeButtonState();
}

class _HomeLikeButtonState extends State<HomeLikeButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        String? userId = await storage.read(key: "userId");

        if (userId != null) {
          var oldStatus = widget.info!.isLiked!;
          setState(() {
            widget.info!.isLiked = !(widget.info!.isLiked!);
          });
          try {
            await Provider.of<PostService>(context, listen: false)
                .likePost(widget.postId!);
          } catch (error) {
            setState(() {
              widget.info!.isLiked = oldStatus;
            });
          }
        } else {
          openModal(context);
        }
      },
      child: Row(
        children: [
          widget.info!.isLiked!
              ? const FaIcon(
                  FontAwesomeIcons.solidHeart,
                  color: Colors.red,
                )
              : const FaIcon(FontAwesomeIcons.heart),
          const SizedBox(
            width: 3.0,
          ),
          Text(widget.info!.likeCount.toString())
        ],
      ),
    );
  }
}

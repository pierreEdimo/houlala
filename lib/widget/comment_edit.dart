import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/model/edit_comment.dart';
import 'package:houlala/service/comment_service.dart';
import 'package:houlala/widget/show_nack.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/comment.dart';
import 'custom_list_tile.dart';

class CommentEdit extends StatelessWidget {
  final Comment? comment;

  CommentEdit({Key? key, this.comment}) : super(key: key);

  final TextEditingController? _controller = TextEditingController();

  void dispose() {
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller!.text = comment!.content!;

    return InkWell(
      onTap: () {
        Navigator.of(context).pop();

        showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return StandardCustomContainer(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          color: const Color(0xf2f2f2f2),
                          child: TextFormField(
                            controller: _controller,
                            minLines: 1,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 5.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      InkWell(
                        onTap: () async {
                          if (_controller!.text.isNotEmpty) {
                            EditComment newComment =
                                EditComment(content: _controller!.text);

                            await Provider.of<CommentService>(context,
                                    listen: false)
                                .editComment(
                                    comment!.postId!, comment!.id!, newComment);

                            Navigator.of(context).pop();

                            showSnack(
                                const Text(
                                    "Votre Commentaire a ete modifie avec succes"),
                                context);
                          } else {
                            DoNothingAction();
                          }
                        },
                        child: const FaIcon(FontAwesomeIcons.paperPlane),
                      )
                    ],
                  ),
                ),
              );
            });
      },
      child: const Center(
        child: CustomListTile(
          leadingIcon: FontAwesomeIcons.penToSquare,
          title: "modifier",
          icon: Text(""),
        ),
      ),
    );
  }
}

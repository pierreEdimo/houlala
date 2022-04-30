import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/widget/created_at_container.dart';
import 'package:houlala/widget/transparent_card_container.dart';
import '../model/comment.dart';
import 'comment_modal_body.dart';

class CommentContainer extends StatelessWidget {
  final Comment? comment;

  const CommentContainer({
    Key? key,
    this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? userName = comment!.author!.firstName![0].toUpperCase() +
        comment!.author!.lastName![0].toUpperCase();
    return TransparentCardContainer(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          child: Text(userName),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              comment!.author!.lastName! +
                                  " " +
                                  comment!.author!.firstName!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: standardStyle,
                            ),
                          ),
                          horizontalSpacing,
                          Flexible(
                            child: CreatedAtContainer(
                              createdAt: comment!.createdAt!,
                            ),
                          )
                        ],
                      ),
                    ),
                    CommentModelBody(
                      comment: comment,
                    )
                  ],
                ),
                verticalSpacing,
                Text(comment!.content!, style: const TextStyle(fontSize: 14.0))
              ],
            ),
          ),
        )
      ],
    ));
  }
}

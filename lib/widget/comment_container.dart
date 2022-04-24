import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import '../model/comment.dart';

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
    return InkWell(
      onTap: () => print(comment!.id!),
      child: Card(
          elevation: 0,
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
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'PoppinsBold'),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Flexible(
                                  child: Text(
                                    DateFormat.yMMMMEEEEd('fr').format(
                                      comment!.createdAt!,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const InkWell(
                            child: FaIcon(
                              FontAwesomeIcons.ellipsisVertical,
                              size: 13.0,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        comment!.content!,
                          style: const TextStyle(
                            fontSize: 14.0
                          )
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

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
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25,
                child: Center(
                  child: Text(
                    userName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                comment!.author!.firstName! +
                                    " " +
                                    comment!.author!.lastName!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'PoppinsBold',
                                    fontSize: 18.0),
                              ),
                              Text(
                                DateFormat.yMMMMEEEEd('fr')
                                    .format(comment!.createdAt!),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () => print("Hello option"),
                            child: const FaIcon(FontAwesomeIcons.ellipsis),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      comment!.content!,
                      maxLines: 7,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:houlala/service/comment_service.dart';
import 'package:houlala/widget/comment_container.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:provider/provider.dart';

import '../model/comment.dart';

class ListOfComments extends StatelessWidget {
  final String? uri;

  const ListOfComments({
    Key? key,
    this.uri,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<CommentService>(context).fetchAllComments(uri!),
        builder: (BuildContext context, AsyncSnapshot<List<Comment>> snapshot) {
          if (snapshot.hasData) {
            List<Comment>? comments = snapshot.data;

            return StandardCustomContainer(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: comments!
                    .map(
                      (Comment comment) => CommentContainer(
                        comment: comment,
                      ),
                    )
                    .toList(),
              ),
            );
          }
          return Center(
            child: Container(),
          );
        });
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/main.dart';
import 'package:houlala/service/comment_service.dart';
import 'package:houlala/widget/comment_input.dart';
import 'package:houlala/widget/list_of_comment.dart';
import 'package:houlala/widget/post_body_container.dart';
import 'package:provider/provider.dart';

import '../model/add_comment.dart';

class PostDetailScreen extends StatelessWidget {
  static const routeName = "/post_detail";
  final TextEditingController _controller = TextEditingController();

  PostDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  PostBodyContainer(
                    id: id,
                  ),
                  ListOfComments(
                    uri:
                        '${dotenv.env['POST_URL']}/getCommentFromPost?postId=$id',
                  )
                ],
              ),
            ),
          ),
          Material(
            elevation: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        color: const Color(0xf2f2f2f2),
                        child: CommentInput(
                          controller: _controller,
                          minLines: 1,
                          maxLines: 3,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          if (_controller.text.isEmpty) {
                            DoNothingAction();
                          } else {
                            var userId = await storage.read(key: "userId");
                            AddComment newComment = AddComment(
                                userId: userId,
                                content: _controller.text,
                                postId: id);
                            await Provider.of<CommentService>(context,
                                    listen: false)
                                .addComment(newComment);
                          }
                        },
                        icon: const FaIcon(FontAwesomeIcons.paperPlane))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

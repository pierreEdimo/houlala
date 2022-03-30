import 'package:flutter/material.dart';
import 'package:houlala/screens/post_detail_screen.dart';

import '../model/post.dart';

class PostContainer extends StatelessWidget {
  final Post? post;

  const PostContainer({Key? key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(PostDetailScreen.routeName, arguments: post!.id!),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(post!.pageModel!.imageUrl!),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    post!.pageModel!.name!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        fontFamily: "PoppinsBold"),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    post!.title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    post!.content!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  post!.imageUrl!.isEmpty
                      ? Container()
                      : Container(
                          constraints: const BoxConstraints(
                            minHeight: 200,
                            maxHeight: 250,
                          ),
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                post!.imageUrl!,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

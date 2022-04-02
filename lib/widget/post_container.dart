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
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Card(
          color: const Color(0xfefefefe),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(post!.page!.imageUrl!),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        post!.page!.name!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            fontFamily: "PoppinsBold"),
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
                      Text(
                        post!.content!,
                        maxLines: post!.imageUrl!.isEmpty ? 5 : 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      post!.imageUrl!.isEmpty
                          ? Container()
                          : Container(
                             constraints: const BoxConstraints(
                               minHeight: 200
                             ),
                              width: MediaQuery.of(context).size.width * 1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
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
        ),
      ),
    );
  }
}

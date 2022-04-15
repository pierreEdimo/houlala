import 'package:flutter/material.dart';
import 'package:houlala/screens/post_detail_screen.dart';

import '../model/post.dart';

class PostContainer extends StatelessWidget {
  final Post? post;
  final double? width;
  final double? height;
  final Axis? scrollDirection;

  const PostContainer({
    Key? key,
    this.post,
    this.width,
    this.height,
    this.scrollDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(PostDetailScreen.routeName, arguments: post!.id!),
      child: scrollDirection == Axis.horizontal
          ? SizedBox(
              width: width == null
                  ? MediaQuery.of(context).size.width * 1
                  : width!,
              child: SizedBox(
                height: height == null
                    ? MediaQuery.of(context).size.height * 0.5
                    : height!,
                child: CustomCard(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PostAvatar(
                        post: post,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            PostAuthor(
                              post: post,
                            ),
                            PostTitle(
                              post: post,
                            ),
                            PostContent(
                              post: post,
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Expanded(
                              child: PostImage(
                                post: post,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          : CustomCard(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PostAvatar(
                    post: post!,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        PostAuthor(
                          post: post,
                        ),
                        PostTitle(
                          post: post,
                        ),
                        PostContent(
                          post: post,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        post!.imageUrl!.isEmpty
                            ? Container()
                            : SizedBox(
                                height: 180,
                                child: PostImage(
                                  post: post,
                                ),
                              )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class PostImage extends StatelessWidget {
  final Post? post;

  const PostImage({
    Key? key,
    this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return post!.imageUrl!.isEmpty
        ? Container()
        : Container(
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
          );
  }
}

class PostTitle extends StatelessWidget {
  final Post? post;

  const PostTitle({
    Key? key,
    this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      post!.title!,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
      ),
    );
  }
}

class PostAuthor extends StatelessWidget {
  final Post? post;

  const PostAuthor({
    Key? key,
    this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      post!.page!.name!,
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          fontFamily: "PoppinsBold"),
    );
  }
}

class PostAvatar extends StatelessWidget {
  final Post? post;

  const PostAvatar({
    Key? key,
    this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(post!.page!.imageUrl!),
    );
  }
}

class PostContent extends StatelessWidget {
  final Post? post;

  const PostContent({
    Key? key,
    this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      post!.content!,
      maxLines: post!.imageUrl!.isEmpty ? 7 : 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 13),
    );
  }
}

class CustomCard extends StatelessWidget {
  final Widget? child;

  const CustomCard({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xfefefefe),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: child!,
      ),
    );
  }
}

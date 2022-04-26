import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/model/additional_info.dart';
import 'package:houlala/service/post_service.dart';
import 'package:houlala/widget/created_at_container.dart';
import 'package:houlala/widget/home_like_button.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:sizer/sizer.dart';

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
    switch (scrollDirection) {
      case Axis.vertical:
        return CustomCard(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Flexible(
                                child: PostAuthor(
                                  post: post,
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Flexible(
                                child: CreatedAtContainer(
                                  createdAt: post!.createdAt!,
                                ),
                              )
                            ],
                          ),
                        ),
                        OnTapIcon(
                          post: post,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    PostTitle(
                      post: post,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    PostContent(
                      post: post,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    post!.imageUrl!.isEmpty
                        ? Container()
                        : Container(
                            constraints: const BoxConstraints(
                              minHeight: 150,
                              maxHeight: 340,
                            ),
                            child: PostImage(
                              post: post,
                            ),
                          ),
                    AdditionalInformation(
                      post: post,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      case Axis.horizontal:
        return SizedBox(
          width: 90.w,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(width: 1, color: Colors.grey.shade300)),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PostAvatar(
                      post: post,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: PostAuthor(
                                        post: post,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Flexible(
                                      child: CreatedAtContainer(
                                        createdAt: post!.createdAt!,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              OnTapIcon(
                                post: post,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          PostContent(
                            post: post,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          post!.imageUrl!.isEmpty
                              ? Container()
                              : Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 50.0),
                                    child: PostImage(
                                      post: post,
                                    ),
                                  ),
                                )
                        ],
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: AdditionalInformation(
                    post: post,
                  ),
                )
              ],
            ),
            margin: const EdgeInsets.only(right: 10.0),
          ),
        );
      default:
        return Container();
    }
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
              borderRadius: BorderRadius.circular(10.0),
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
          fontSize: 18.0,
          fontFamily: 'PoppinsBold'),
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
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
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
    return AutoSizeText(
      post!.content!,
      maxLines: post!.imageUrl!.isEmpty ? 16 : 3,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 14.0),
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
      color: Colors.transparent,
      elevation: 0,
      child: child!,
    );
  }
}

class OnTapIcon extends StatelessWidget {
  final Post? post;

  const OnTapIcon({
    Key? key,
    this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const FaIcon(FontAwesomeIcons.ellipsisVertical),
    );
  }
}

class AdditionalInformation extends StatelessWidget {
  final Post? post;

  const AdditionalInformation({Key? key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<PostService>(context).getAdditionalInfo(post!.id!),
      builder:
          (BuildContext context, AsyncSnapshot<AdditionalPostInfo> snapshot) {
        if (snapshot.hasData) {
          AdditionalPostInfo info = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                HomeLikeButton(
                  postId: post!.id!,
                  info: info,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Row(
                  children: [
                    const ImageIcon(
                      AssetImage("images/comment.png"),
                      size: 22.0,
                    ),
                    const SizedBox(
                      width: 3.0,
                    ),
                    Text(
                      info.commentCount.toString(),
                    )
                  ],
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:houlala/screens/post_detail_screen.dart';
import 'package:houlala/service/post_service.dart';
import 'package:houlala/widget/custom_avatar.dart';
import 'package:houlala/widget/post_container.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../model/post.dart';

class ListOfPosts extends StatelessWidget {
  final String? uri;
  final Widget? child;
  final double? errorHeight;
  final Axis? scrollDirection;
  final String? textError;
  final double? postWidth;

  const ListOfPosts(
      {Key? key,
      this.uri,
      this.child,
      this.errorHeight,
      this.scrollDirection,
      this.postWidth,
      this.textError})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<PostService>(context, listen: true).fetchPosts(uri!),
      builder: (context, AsyncSnapshot<List<Post>> snapshot) {
        if (snapshot.hasError) {
          return SizedBox(
            height: errorHeight == null
                ? MediaQuery.of(context).size.height * 1
                : errorHeight!,
            child: Center(
              child: Text(
                textError!,
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
        if (snapshot.hasData) {
          List<Post> posts = snapshot.data!;

          switch (scrollDirection) {
            case Axis.vertical:
              return posts.isEmpty
                  ? SizedBox(
                      height: errorHeight == null ? 25.h : errorHeight!,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CustomAvatar(
                              localAsset: "images/no-talk.png",
                              radius: 50,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              textError!,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      children: posts
                          .map(
                            (Post post) => InkWell(
                              onTap: () => Navigator.of(context).pushNamed(
                                  PostDetailScreen.routeName,
                                  arguments: post.id),
                              child: PostContainer(
                                scrollDirection: scrollDirection,
                                post: post,
                              ),
                            ),
                          )
                          .toList(),
                    );
            case Axis.horizontal:
              return posts.isEmpty
                  ? Container()
                  : SizedBox(
                      height: 490,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          child == null ? Container() : child!,
                          const SizedBox(
                            height: 10.0,
                          ),
                          Expanded(
                            child: ListView(
                              scrollDirection: scrollDirection!,
                              children: posts
                                  .map(
                                    (Post post) => InkWell(
                                      onTap: () => Navigator.of(context)
                                          .pushNamed(PostDetailScreen.routeName,
                                              arguments: post.id),
                                      child: PostContainer(
                                        postWidth: postWidth,
                                        post: post,
                                        scrollDirection: scrollDirection,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    );
            default:
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

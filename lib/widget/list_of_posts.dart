import 'package:flutter/material.dart';
import 'package:houlala/service/post_service.dart';
import 'package:houlala/widget/post_container.dart';
import 'package:provider/provider.dart';
import '../model/post.dart';

class ListOfPosts extends StatelessWidget {
  final String? uri;
  final Widget? child;
  final double? height;
  final Axis? scrollDirection;
  final String? textError;

  const ListOfPosts(
      {Key? key,
      this.uri,
      this.child,
      this.height,
      this.scrollDirection,
      this.textError})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<PostService>(context).fetchPosts(uri!),
      builder: (context, AsyncSnapshot<List<Post>> snapshot) {
        if (snapshot.hasError) {
          return SizedBox(
            height: height == null
                ? MediaQuery.of(context).size.height * 1
                : height!,
            child: Center(
              child: Text(snapshot.error.toString()),
            ),
          );
        }
        if (snapshot.hasData) {
          List<Post> posts = snapshot.data!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              child != null ? child! : Container(),
              posts.isEmpty
                  ? SizedBox(
                      height: height == null
                          ? MediaQuery.of(context).size.height * 1
                          : height!,
                      child: Center(
                        child: Text(
                          textError!,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : scrollDirection == Axis.horizontal
                      ? Expanded(
                          child: ListView(
                            scrollDirection: scrollDirection!,
                            padding: EdgeInsets.zero,
                            children: posts
                                .map(
                                  (Post post) => PostContainer(
                                    post: post,
                                  ),
                                )
                                .toList(),
                          ),
                        )
                      : ListView(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          children: posts
                              .map((Post post) => PostContainer(
                                    post: post,
                                  ))
                              .toList(),
                        )
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

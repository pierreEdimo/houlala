import 'package:flutter/material.dart';
import 'package:houlala/service/post_service.dart';
import 'package:houlala/widget/post_container.dart';
import 'package:provider/provider.dart';
import '../model/post.dart';

class ListOfPosts extends StatelessWidget {
  final String? uri;
  final Widget? child;
  final double? height;

  const ListOfPosts({
    Key? key,
    this.uri,
    this.child,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<PostService>(context).fetchPosts(uri!),
      builder: (context, AsyncSnapshot<List<Post>> snapshot) {
        if (snapshot.hasError) {
          return SizedBox(
            height: height == null
                ? MediaQuery.of(context).size.height * 1
                : MediaQuery.of(context).size.height * height!,
            child: Center(
              child: Text(snapshot.error.toString()),
            ),
          );
        }
        if (snapshot.hasData) {
          List<Post> posts = snapshot.data!;

          return Column(
            children: [
              child != null ? child! : Container(),
              posts.isEmpty
                  ? SizedBox(
                      height: height == null
                          ? MediaQuery.of(context).size.height * 1
                          : MediaQuery.of(context).size.height * height!,
                      child: const Center(
                        child: Text(
                          "aucuns Posts n'a encore ete fait",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : ListView(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      children: posts
                          .map(
                            (Post post) => PostContainer(
                              post: post,
                            ),
                          )
                          .toList(),
                    ),
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

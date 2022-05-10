import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/model/found_post.dart';
import 'package:houlala/widget/created_at_container.dart';
import 'package:houlala/widget/markdown_container.dart';
import 'package:houlala/widget/post_detail_app_bar.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:provider/provider.dart';
import '../helper/constants.dart';
import '../screens/page_detail_screen.dart';
import '../service/post_service.dart';

class PostBodyContainer extends StatelessWidget {
  final String? id;

  const PostBodyContainer({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<PostService>(context).fetchSinglePost(id!),
      builder: (context, AsyncSnapshot<FoundPost> snapshot) {
        if (snapshot.hasData) {
          FoundPost foundPost = snapshot.data!;
          return Column(
            children: [
              SizedBox(
                height: 120.0,
                child: PostDetailAppBar(
                  foundPost: foundPost,
                ),
              ),
              StandardCustomContainer(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).pushNamed(
                            PageDetailScreen.screenName,
                            arguments: foundPost.foundPost!.page!.id),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                foundPost.foundPost!.page!.imageUrl!,
                              ),
                            ),
                            horizontalSpacing,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      foundPost.foundPost!.page!.name!,
                                      style: nameTitleStyle,
                                    ),
                                    horizontalSpacing,
                                    CreatedAtContainer(
                                      createdAt:
                                          foundPost.foundPost!.createdAt!,
                                    )
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const FaIcon(
                                      FontAwesomeIcons.building,
                                      size: 14,
                                    ),
                                    horizontalSpacing,
                                    Text(
                                      '${foundPost.foundPost!.page!.headQuarterCity!}, ${foundPost.foundPost!.page!.headQuarterCountry!}',
                                      style: subtitle,
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        foundPost.foundPost!.title!,
                        style: titleStyle,
                      ),
                      MarkdownContainer(
                        data: foundPost.foundPost!.content!,
                      ),
                      standardSizedBox,
                      foundPost.foundPost!.imageUrl!.isEmpty
                          ? Container()
                          : Container(
                              constraints: const BoxConstraints(
                                maxHeight: 300,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      foundPost.foundPost!.imageUrl!),
                                ),
                              ),
                            ),
                      standardSizedBox,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            foundPost.likeCount!.toString(),
                            style: standardStyle,
                          ),
                          const SizedBox(width: 3.0),
                          const Text("personne(s) ont aime ce post")
                        ],
                      ),
                    ],
                  ),
                ),
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

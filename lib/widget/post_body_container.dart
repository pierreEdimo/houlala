import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/model/found_post.dart';
import 'package:houlala/widget/post_detail_app_bar.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:intl/intl.dart';
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
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                PostDetailAppBar(
                  foundPost: foundPost,
                ),
                StandardCustomContainer(
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
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      foundPost.foundPost!.page!.name!,
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "PoppinsBold",
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      'le ${DateFormat.yMMMMEEEEd('fr').format(foundPost.foundPost!.createdAt!)}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
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
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${foundPost.foundPost!.page!.headQuarterCity!}, ${foundPost.foundPost!.page!.headQuarterCountry!}',
                                      style: const TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
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
                        style: const TextStyle(
                          fontFamily: 'PoppinsBold',
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      Markdown(
                        data: foundPost.foundPost!.content!,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        padding: EdgeInsets.zero,
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
                            foundPost.likesCount!.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                fontFamily: 'PoppinsBold'),
                          ),
                          const SizedBox(width: 3.0),
                          const Text("personnes ont aime ce post")
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

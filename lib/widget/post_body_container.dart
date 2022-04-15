import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/widget/post_detail_app_bar.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../helper/constants.dart';
import '../model/post.dart';
import '../screens/page_detail_screen.dart';
import '../service/post_service.dart';

class PostBodyContainer extends StatelessWidget {
  final String? uri;

  const PostBodyContainer({Key? key, this.uri}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<PostService>(context).fetchSinglePost(uri!),
      builder: (context, AsyncSnapshot<Post> snapshot) {
        if (snapshot.hasData) {
          Post post = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                PostDetailAppBar(),
                StandardCustomContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).pushNamed(
                            PageDetailScreen.screenName,
                            arguments: post.page!.id),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                post.page!.imageUrl!,
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
                                      post.page!.name!,
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
                                      'le ${DateFormat.yMMMMEEEEd('fr').format(post.createdAt!)}',
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
                                      '${post.page!.headQuarterCity!}, ${post.page!.headQuarterCountry!}',
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
                        post.title!,
                        style: const TextStyle(
                          fontFamily: 'PoppinsBold',
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      Markdown(
                        data: post.content!,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        padding: EdgeInsets.zero,
                      ),
                      standardSizedBox,
                      post.imageUrl!.isEmpty
                          ? Container()
                          : Container(
                              constraints: const BoxConstraints(
                                maxHeight: 300,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(post.imageUrl!),
                                ),
                              ),
                            ),
                      standardSizedBox,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            "123",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                fontFamily: 'PoppinsBold'),
                          ),
                          SizedBox(width: 3.0),
                          Text("personnes ont aime ce post")
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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/model/post.dart';
import 'package:houlala/widget/created_at_container.dart';
import 'package:houlala/widget/markdown_container.dart';
import 'package:houlala/widget/post_detail_app_bar.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../helper/constants.dart';
import '../service/post_service.dart';

class PostBodyContainer extends StatelessWidget {
  final String? id;

  const PostBodyContainer({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<PostService>(context).fetchSinglePost(id!),
      builder: (context, AsyncSnapshot<Post> snapshot) {
        if (snapshot.hasData) {
          Post foundPost = snapshot.data!;
          return Column(
            children: [
              SizedBox(
                height: !kIsWeb ? 90.0 : 70.0,
                child: PostDetailAppBar(
                  foundPost: foundPost,
                ),
              ),
              StandardCustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundImage: NetworkImage(
                              foundPost.location!.imageUrl!,
                            ),
                          ),
                          horizontalSpacing,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Houlala",
                                    style: nameTitleStyle,
                                  ),
                                  horizontalSpacing,
                                  CreatedAtContainer(
                                    createdAt: foundPost.createdAt!,
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
                                    'Yaounde, Cameroun',
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
                    MarkdownContainer(
                      data: foundPost.content!,
                    ),
                    standardSizedBox,
                    foundPost.imageUrl!.isEmpty
                        ? Container()
                        : Container(
                            constraints: const BoxConstraints(
                              maxHeight: 300,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(foundPost.imageUrl!),
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
            ],
          );
        }
        return  SizedBox(
          height: 100.h,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

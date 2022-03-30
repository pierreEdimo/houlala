import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/widget/custom_box_container.dart';
import 'package:houlala/widget/list_of_posts.dart';
import 'package:houlala/widget/post_app_bar.dart';

class AllPostsScreen extends StatelessWidget {
  const AllPostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AllPostAppBar(
        title: "Newsfeed",
      ),
      body: CustomBoxContainer(
        child: SingleChildScrollView(
          child: ListOfPosts(
            uri: dotenv.env['POST_URL'],
          ),
        ),
      ),
    );
  }
}

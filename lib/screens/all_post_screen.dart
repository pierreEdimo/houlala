import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/custom_box_container.dart';
import 'package:houlala/widget/list_of_posts.dart';

class AllPostsScreen extends StatelessWidget {
  const AllPostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithReturn(
        elevation: 1,
        title: "Newsfeed",
      ),
      body: CustomBoxContainer(
        child: SingleChildScrollView(
          child: ListOfPosts(
            scrollDirection: Axis.vertical,
            uri: dotenv.env['POST_URL'],
            textError: "Aucun Posts n'a encore ete cree",
          ),
        ),
      ),
    );
  }
}

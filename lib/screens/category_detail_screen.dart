import 'package:flutter/material.dart';
import 'package:houlala/model/page_screen_arguments.dart';
import 'package:houlala/widget/category_detail_container.dart';

class CategoryDetailScreen extends StatelessWidget {
  static const routeName = "/categoryDetail";

  const CategoryDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as PageScreenArguments;

    return Scaffold(
      body: CategoryDetailContainer(
        categoryName: args.categoryName,
        categoryId: args.categoryId,
        imageUrl: args.imageUrl,
      ),
    );
  }
}

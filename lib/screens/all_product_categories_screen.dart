import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:houlala/widget/vertical_grid_of_categories.dart';

class AllProductCategories extends StatelessWidget {
  const AllProductCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithReturn(
        title: 'Categories',
        elevation: 1,
      ),
      body: StandardCustomContainer(
        child: VerticalListOfCategories(
          shrinkwrap: false,
          uri:
              '${dotenv.env['CATEGORY_URL']}',
        ),
      ),
    );
  }
}

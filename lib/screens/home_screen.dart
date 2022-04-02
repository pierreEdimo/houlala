import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/widget/grid_pages.dart';
import 'package:houlala/widget/list_of_posts.dart';
import 'package:houlala/widget/standard_custom_app_bar.dart';
import 'package:houlala/widget/custom_box_container.dart';
import 'package:houlala/widget/flexible_row.dart';
import 'package:houlala/widget/grid_of_products.dart';
import 'package:houlala/widget/list_of_categories.dart';

import '../helper/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'houlala',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomBoxContainer(
              child: SizedBox(
                height: 170,
                child: ListOfCategories(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 5.0),
                    child: const FlexibleRow(
                      title: "Categories de produits",
                      urlValue: "/all_categories",
                    ),
                  ),
                  uri:
                      '${dotenv.env['CATEGORY_URL']}/getRandomCategories?size=6&categoryType=624037f8292cdadb3ad45b7a',
                  direction: Axis.horizontal,
                  shrinkWrap: true,
                ),
              ),
            ),
            standardSizedBox,
            CustomBoxContainer(
              child: GridOfProducts(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 5.0),
                  child: const FlexibleRow(
                    title: 'fruits & legumes',
                    urlValue: "/all_fruits",
                  ),
                ),
                uri:
                    '${dotenv.env['PRODUCT_URL']}/getRandomProducts?size=4&categoryId=621a245eaf69ff81e170c5f6',
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                widthRatio: 1,
                heightRatio: 1.5,
              ),
            ),
            standardSizedBox,
            CustomBoxContainer(
              child: SizedBox(
                height: 130,
                child: GridPages(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 5.0),
                    child: const FlexibleRow(
                      title: 'Nos Partenaires',
                      urlValue: "/all_pages",
                    ),
                  ),
                  uri: '${dotenv.env['PAGE_URL']}/getRandomPages?size=4',
                  direction: Axis.horizontal,
                ),
              ),
            ),
            standardSizedBox,
            CustomBoxContainer(
              child: SizedBox(
                height: 350,
                child: ListOfPosts(
                  scrollDirection: Axis.horizontal,
                  height: 0.5,
                  child: const FlexibleRow(
                    title: "Quelques posts recents",
                    urlValue: "/all_posts",
                  ),
                  uri: '${dotenv.env['POST_URL']}/getRandomPosts?size=10',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

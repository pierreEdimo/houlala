import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/widget/grid_of_jobs.dart';
import 'package:houlala/widget/grid_of_products.dart';
import 'package:houlala/widget/grid_pages.dart';
import 'package:houlala/widget/list_of_posts.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:houlala/widget/vertical_grid_of_categories.dart';

import 'custom_intern_navigation.dart';

class SearchResultContainer extends StatelessWidget {
  final String? searchWorld;

  SearchResultContainer({Key? key, this.searchWorld}) : super(key: key);

  final List<String> _menuItems = [
    "produits",
    "categories",
    "magasins",
    "posts",
    "jobs"
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = [
      StandardCustomContainer(
        child: GridOfProducts(
          uri: '${dotenv.env['PRODUCT_URL']}/search?searchword=$searchWorld',
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          widthRatio: 1,
          heightRatio: 1.5,
        ),
      ),
      StandardCustomContainer(
        child: VerticalListOfCategories(
          uri: '${dotenv.env['CATEGORY_URL']}/search?searchword=$searchWorld',
          shrinkwrap: true,
          height: 0.8,
          error: "Aucunes categories n'ont ete trouvee",
        ),
      ),
      StandardCustomContainer(
        child: GridPages(
          uri: '${dotenv.env['PAGE_URL']}/search?searchword=$searchWorld',
          direction: Axis.vertical,
        ),
      ),
      StandardCustomContainer(
        child: ListOfPosts(
          scrollDirection: Axis.vertical,
          uri: '${dotenv.env['POST_URL']}/search?searchWord=$searchWorld',
          height: 0.7,
        ),
      ),
      StandardCustomContainer(
        child: GridOfJobs(
          uri: '${dotenv.env['JOB_URL']}/search?searchword=$searchWorld',
          scrollDirection: Axis.vertical,
          pageName: "",
          height: 0.7,
        ),
      )
    ];

    return CustomInternNavigation(
      menuItems: _menuItems,
      widgetOptions: _widgetOptions,
      elevationValue: 2.0,
      verticalPadding: 23.0,
      horizontalPadding: 15.0,
      height: 0.1,
    );
  }
}


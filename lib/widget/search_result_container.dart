import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/widget/grid_of_products.dart';
import 'package:houlala/widget/grid_pages.dart';
import 'package:houlala/widget/list_of_posts.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:houlala/widget/vertical_grid_of_categories.dart';
import 'package:sizer/sizer.dart';

import 'custom_intern_navigation.dart';

class SearchResultContainer extends StatelessWidget {
  final String? searchword;

  SearchResultContainer({Key? key, this.searchword}) : super(key: key);

  final List<String> _menuItems = [
    "produits",
    "categories",
    "magasins",
    "posts",
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = [
      StandardCustomContainer(
        child: GridOfProducts(
          height: 80.h,
          textError: "Aucuns produits appelle $searchword n'a ete trouve\n"
              "svp verifiez plutard",
          uri: '${dotenv.env['PRODUCT_URL']}/search?searchWord=$searchword',
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          widthRatio: 1,
          heightRatio: 1.5,
        ),
      ),
      StandardCustomContainer(
        child: VerticalListOfCategories(
          uri: '${dotenv.env['CATEGORY_URL']}/search?searchword=$searchword',
          shrinkwrap: true,
          height: 0.8,
          error: "Aucunes categories appeles $searchword n'a ete trouvee\n"
              "veuillez reessayer plutard",
        ),
      ),
      StandardCustomContainer(
        child: GridPages(
          height: 80.h,
          textError: "Aucuns magasins appele $searchword n'a ete trouve\n"
              "svp veuillez reessayer plutard",
          uri: '${dotenv.env['LOCATION_URL']}/search?word=$searchword',
          direction: Axis.vertical,
        ),
      ),
      StandardCustomContainer(
        child: ListOfPosts(
          scrollDirection: Axis.vertical,
          uri: '${dotenv.env['POST_URL']}/search?word=$searchword',
          errorHeight: 80.h,
          textError: "Aucuns Posts titre $searchword n'a ete trouve\n"
              "veuillez reessayer plutard",
        ),
      ),
    ];
    return CustomInternNavigation(
      menuItems: _menuItems,
      widgetOptions: _widgetOptions,
      elevationValue: 0,
      verticalPadding: 23.0,
      horizontalPadding: 15.0,
      height: 0.1,
    );
  }
}

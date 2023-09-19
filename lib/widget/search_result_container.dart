import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/widget/grid_of_products.dart';
import 'package:houlala/widget/grid_pages.dart';
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
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = [
      StandardCustomContainer(
        child: GridOfProducts(
          height: 50.h,
          textError: "Aucuns produits appelle $searchword n'a ete trouve\n"
              "svp verifiez plutard",
          uri: '${dotenv.env['PRODUCT_URL']}/search?word=$searchword',
          crossAxisCount: 2,
          widthRatio: 1,
          heightRatio: 1.5,
        ),
      ),
      StandardCustomContainer(
        child: VerticalListOfCategories(
          uri: '${dotenv.env['CATEGORY_URL']}/search?searchWord=$searchword',
          shrinkwrap: true,
          height: 50.h,
          error: "Aucunes categories appeles $searchword n'a ete trouvee\n"
              "veuillez reessayer plutard",
        ),
      ),
      StandardCustomContainer(
        child: GridPages(
          height: 50.h,
          textError: "Aucuns magasins appeles $searchword n'a ete trouve\n"
              "svp veuillez reessayer plutard",
          uri: '${dotenv.env['LOCATION_URL']}/search?word=$searchword',
          direction: Axis.vertical,
        ),
      )
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

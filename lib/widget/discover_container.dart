import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/widget/column_of_shop_box.dart';
import 'package:houlala/widget/custom_intern_navigation.dart';
import 'package:houlala/widget/discover_container_box.dart';
import 'package:houlala/widget/list_of_posts.dart';

class DiscoverContainer extends StatelessWidget {
  DiscoverContainer({Key? key}) : super(key: key);

  final List<String> _menuItems = [
    "tous",
    "produits",
    "magasins",
    "posts",
  ];

  final List<Widget> _widgetOptions = [
    DiscoverContainerBox(
      height: 0.7,
      error: "",
      uri: dotenv.env['CATEGORY_URL'],
    ),
    DiscoverContainerBox(
        height: 0.7,
        error: "",
        uri:
            '${dotenv.env['CATEGORY_URL']}/filterCategoriesByType?categoryType=624037f8292cdadb3ad45b7a&limit=0'),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: const ColumnOfShopBox(
        categoryName: "",
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListOfPosts(
        textError: "Aucuns Posts",
        scrollDirection: Axis.vertical,
        uri: dotenv.env['POST_URL'],
      ),
    ),
/*   StandardCustomContainer(
      child: GridOfJobs(
        uri: dotenv.env['JOB_URL'],
        scrollDirection: Axis.vertical,
        ratio: 2.5,
        textError: "Desole Nous n'avons pas encore de Jobs pour l'instant\n"
            "reessayez plus tard",
        height: 0.7,
      ),
    )*/
  ];

  @override
  Widget build(BuildContext context) {
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

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/widget/column_of_shop_box.dart';
import 'package:houlala/widget/custom_intern_navigation.dart';
import 'package:houlala/widget/discover_container_box.dart';

class DiscoverContainer extends StatelessWidget {
  DiscoverContainer({Key? key}) : super(key: key);

  final List<String> _menuItems = [
    "tous",
    "produits",
    "magasins",
    "services",
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
        uri: '${dotenv.env['CATEGORY_URL']}/filter?categoryType=produits'),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: const ColumnOfShopBox(
        categoryName: "",
      ),
    ),
    DiscoverContainerBox(
      error: "Desole nous n'avons pas encore d'offre en matiere de services"
          "Nous travaillons d'arrache pied pour ameliorer nos offres\n"
          "svp reessayez plutard. Excellente journee",
      uri: '${dotenv.env['CATEGORY_URL']}/filter?categoryType=services',
      height: 0.7,
    ),
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

import 'package:flutter/material.dart';

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
      SearchResult(result: '${searchWorld!},produits',),
      SearchResult(result: '${searchWorld!}, categories',),
      SearchResult(result: '${searchWorld!}, magasins',),
      SearchResult(result: '${searchWorld!}, posts',),
      SearchResult(result: '${searchWorld!}, jobs',)
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

class SearchResult extends StatelessWidget {
  final String? result;

  const SearchResult({Key? key, this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        result!,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:houlala/model/store_category_argument.dart';
import 'package:houlala/service/category_service.dart';
import 'package:houlala/widget/discovery_category_container.dart';
import 'package:provider/provider.dart';

import '../model/store_category.dart';

class HorizontalStoreCategoryList extends StatelessWidget {
  final String? uri;

  const HorizontalStoreCategoryList({
    Key? key,
    this.uri,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<CategoryService>(context)
            .fetchAllDiscoveryCategories(uri!),
        builder: (BuildContext context,
            AsyncSnapshot<List<StoreCategory>> snapshot) {
          if (snapshot.hasData) {
            List<StoreCategory> categories = snapshot.data!;

            return ListView(
              scrollDirection: Axis.horizontal,
              children: categories
                  .map(
                    (StoreCategory category) => GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed(
                        '/discovery_category_detail',
                        arguments: StoreCategoryArguments(
                          id: category.id,
                          name: category.name,
                          thumbNail: category.thumbNail,
                        ),
                      ),
                      child: DiscoveryCategoryContainer(
                        name: category.name,
                        thumbNail: category.thumbNail,
                      ),
                    ),
                  )
                  .toList(),
            );
          }
          return Container();
        });
  }
}

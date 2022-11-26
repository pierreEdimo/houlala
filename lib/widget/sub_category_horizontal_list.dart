import 'package:flutter/material.dart';
import 'package:houlala/model/sub_category_parameter.dart';
import 'package:houlala/service/category_service.dart';
import 'package:houlala/widget/sub_category_container.dart';
import 'package:provider/provider.dart';

import '../model/product_sub_category.dart';

class SubCategoryHorizontalList extends StatelessWidget {
  final String? uri;

  const SubCategoryHorizontalList({
    Key? key,
    this.uri,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<CategoryService>(context).fetchSubCategories(uri!),
      builder: (BuildContext context,
          AsyncSnapshot<List<ProductSubCategory>> snapshot) {
        if (snapshot.hasData) {
          List<ProductSubCategory> categories = snapshot.data!;

          return ListView(
            scrollDirection: Axis.horizontal,
            children: categories
                .map((category) => GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed(
                        '/sub_category',
                        arguments: SubCategoryParameter(
                          id: category.id,
                          label: category.label,
                          thumbNail: category.thumbNailUrl
                        ),
                      ),
                      child: SubCategoryContainer(
                        name: category.label,
                        thumbNail: category.thumbNailUrl,
                      ),
                    ))
                .toList(),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

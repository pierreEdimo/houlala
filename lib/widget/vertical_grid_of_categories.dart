import 'package:flutter/material.dart';
import 'package:houlala/service/category_service.dart';
import 'package:houlala/widget/category_container.dart';
import 'package:houlala/widget/no_items.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../model/product_category.dart';

class VerticalListOfCategories extends StatelessWidget {
  final String? uri;
  final bool? shrinkwrap;
  final String? error;
  final double? height;

  const VerticalListOfCategories({
    Key? key,
    this.uri,
    this.shrinkwrap,
    this.error,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<CategoryService>(context).fetchAllCategories(uri!),
      builder: (context, AsyncSnapshot<List<CategoryModel>> snapshot) {
        if (snapshot.hasError) {
          return SizedBox(
            height: height!,
            child: Center(
              child: Text(snapshot.error.toString()),
            ),
          );
        }
        if (snapshot.hasData) {
          List<CategoryModel> categories = snapshot.data!;

          return categories.isEmpty
              ? VerticalNoItem(
                  height: height,
                  radius: 60,
                  imageAsset: 'images/categories.png',
                  errorMessage: error,
                )
              : GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.9,
                  children: categories
                      .map((CategoryModel categoryModel) => CategoryContainer(
                            radius: 40,
                            categoryModel: categoryModel,
                            weight: 100.w,
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

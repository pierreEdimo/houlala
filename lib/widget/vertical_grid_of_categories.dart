import 'package:flutter/material.dart';
import 'package:houlala/service/category_service.dart';
import 'package:houlala/widget/category_container.dart';
import 'package:provider/provider.dart';

import '../model/category.dart';

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
            height: MediaQuery.of(context).size.height * height!,
            child: Center(
              child: Text(snapshot.error.toString()),
            ),
          );
        }
        if (snapshot.hasData) {
          List<CategoryModel> categories = snapshot.data!;

          return categories.isEmpty
              ? SizedBox(
               height: MediaQuery.of(context).size.height * height!,
                child: Center(
                    child: Text(
                      error!,
                      textAlign: TextAlign.center,
                    ),
                  ),
              )
              : GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: categories
                      .map((CategoryModel categoryModel) => CategoryContainer(
                            categoryModel: categoryModel,
                            weight: MediaQuery.of(context).size.width * 1,
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

import 'package:flutter/material.dart';
import 'package:houlala/model/product_category.dart';
import 'package:houlala/service/category_service.dart';
import 'package:houlala/widget/category_container.dart';
import 'package:provider/provider.dart';

class ListOfCategories extends StatelessWidget {
  final String? uri;
  final Axis? direction;
  final bool? shrinkWrap;
  final Widget? child;

  const ListOfCategories({
    Key? key,
    this.uri,
    this.direction,
    this.shrinkWrap,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<CategoryService>(context).fetchAllCategories(uri!),
      builder:
          (BuildContext context, AsyncSnapshot<List<CategoryModel>> snapshot) {
        if (snapshot.hasData) {
          List<CategoryModel> categories = snapshot.data!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              child != null ? child! : Container() ,
              Expanded(
                child: ListView(
                  scrollDirection: direction!,
                  shrinkWrap: shrinkWrap!,
                  children: categories
                      .map((CategoryModel category) => CategoryContainer(
                            categoryModel: category,
                            weight: 150,
                          ))
                      .toList(),
                ),
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

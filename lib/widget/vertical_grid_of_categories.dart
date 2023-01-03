import 'package:flutter/material.dart';
import 'package:houlala/service/category_service.dart';
import 'package:houlala/widget/category_container.dart';
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.transparent,
                        child: ClipRRect(
                          child: Image.asset("images/categories.png"),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        error!,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              )
              : GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  childAspectRatio: 2.4/3,
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

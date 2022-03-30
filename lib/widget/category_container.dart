import 'package:flutter/material.dart';
import 'package:houlala/model/page_screen_arguments.dart';
import 'package:houlala/screens/category_detail_screen.dart';
import 'package:houlala/widget/background_image.dart';

import '../model/category.dart';

class CategoryContainer extends StatelessWidget {
  final CategoryModel? categoryModel;
  final double? weight;

  const CategoryContainer({
    Key? key,
    this.categoryModel,
    this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.of(context).pushNamed(CategoryDetailScreen.routeName,
              arguments: PageScreenArguments(
                categoryId: categoryModel!.id!,
                categoryName: categoryModel!.name!,
                categoryType: categoryModel!.categoryType!.label!,
                imageUrl: categoryModel!.imageUrl!,
              )),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: SizedBox(
                width: weight!,
                child: BackgroundImage(
                  imageUrl: categoryModel!.imageUrl!,
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              categoryModel!.name!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'PoppinsBold',
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:houlala/model/page_screen_arguments.dart';
import 'package:houlala/screens/category_detail_screen.dart';
import 'package:houlala/widget/background_image.dart';
import 'package:houlala/widget/transparent_card_container.dart';

import '../model/product_category.dart';

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
                imageUrl: categoryModel!.imageUrl!,
              )),
      child: TransparentCardContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'PoppinsBold',
                fontSize: 18.0
              ),
            )
          ],
        ),
      ),
    );
  }
}

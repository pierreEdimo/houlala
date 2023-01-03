import 'package:flutter/material.dart';
import 'package:houlala/model/page_screen_arguments.dart';
import 'package:houlala/screens/category_detail_screen.dart';
import 'package:houlala/widget/custom_avatar.dart';
import 'package:houlala/widget/transparent_card_container.dart';

import '../model/product_category.dart';

class CategoryContainer extends StatelessWidget {
  final CategoryModel? categoryModel;
  final double? weight;
  final double? radius;

  const CategoryContainer({
    Key? key,
    this.categoryModel,
    this.weight,
    this.radius,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: weight!,
              child: Center(
                child: CustomAvatar(
                  radius: radius,
                  thumbnailUrl: categoryModel!.imageUrl!,
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            SizedBox(
              width: weight,
              child: Text(
                categoryModel!.name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PoppinsBold',
                  fontSize: 18.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

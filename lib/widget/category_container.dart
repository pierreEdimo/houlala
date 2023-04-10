import 'package:flutter/material.dart';
import 'package:houlala/model/page_screen_arguments.dart';
import 'package:houlala/screens/category_detail_screen.dart';
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
        child: Stack(
          children: [
            SizedBox(
              width: weight!,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          categoryModel!.imageUrl!,
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
            Container(
              width: 105,
              alignment: Alignment.topLeft,
              height: 30,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                ),
              ),
            ),
            Container(
              width: 100,
              alignment: Alignment.topLeft,
              child: Text(
                categoryModel!.name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PoppinsBold',
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

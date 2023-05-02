import 'package:flutter/material.dart';
import 'package:houlala/widget/custom_box_container.dart';
import 'package:houlala/widget/no_items.dart';
import 'package:sizer/sizer.dart';

class DefaultCategoryContainer extends StatelessWidget {
  final String? categoryName;

  const DefaultCategoryContainer({Key? key, this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBoxContainer(
      child: VerticalNoItem(
        height: 70.h,
        radius: 60,
        imageAsset: 'images/stock.png',
        errorMessage:
        "Pas de produits dans la categorie $categoryName pour le moment.",
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:houlala/widget/default_category_container.dart';
import 'package:houlala/widget/shop_container.dart';
import 'package:houlala/widget/store_body_container.dart';
import 'package:houlala/widget/transformed_container.dart';

import 'fruits_lettuces_container.dart';

class CategoryDetailContainer extends StatefulWidget {
  final String? categoryName;
  final String? categoryId;
  final String? imageUrl;

  const CategoryDetailContainer(
      {Key? key, this.categoryName, this.categoryId, this.imageUrl})
      : super(key: key);

  @override
  State<CategoryDetailContainer> createState() =>
      _CategoryDetailContainerState();
}

class _CategoryDetailContainerState extends State<CategoryDetailContainer> {
  @override
  Widget build(BuildContext context) {
    switch (widget.categoryName) {
      case 'Fruits & legumes':
        return FruitsLettucesContainer(
          categoryName: widget.categoryName,
          imageUrl: widget.imageUrl!,
        );
      case 'Magasins':
        return ShopContainer(
          categoryName: widget.categoryName!,
          imageUrl: widget.imageUrl,
          child: const TransformedContainer(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: StoreBodyContainer(),
            ),
          ),
        );
      default:
        return Scaffold(
          body: SingleChildScrollView(
              child: DefaultCategoryContainer(
            imageUrl: widget.imageUrl,
            categoryName: widget.categoryName,
          )),
        );
    }
  }
}

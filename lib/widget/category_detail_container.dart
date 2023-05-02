import 'package:flutter/material.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/default_category_container.dart';
import 'package:houlala/widget/shop_container.dart';
import 'package:houlala/widget/store_body_container.dart';

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
      case 'fruits & legumes':
        return Scaffold(
          appBar: AppBarWithReturn(
            title: "fruits & legumes",
            color: Colors.transparent,
            elevation: 1,
          ),
          body: const FruitsLettucesContainer(),
        );
      case 'boutique':
        return Scaffold(
          appBar: AppBarWithReturn(
            title: "boutique",
            color: Colors.transparent,
            elevation: 1,
          ),
          body: const ShopContainer(
            child: StoreBodyContainer(
              height: 0.7,
            ),
          ),
        );
      default:
        return Scaffold(
          appBar: AppBarWithReturn(
            elevation: 1,
            title: "${widget.categoryName}",
            color: Colors.transparent,
          ),
          body: SingleChildScrollView(
              child: DefaultCategoryContainer(
            categoryName: widget.categoryName,
          )),
        );
    }
  }
}

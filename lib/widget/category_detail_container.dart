import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/widget/column_of_shop_box.dart';
import 'package:houlala/widget/default_category_container.dart';
import 'package:houlala/widget/fruits_lettuces_container.dart';
import 'package:houlala/widget/shop_container.dart';
import 'package:houlala/widget/transformed_container.dart';

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
          fruitUri:
              '${dotenv.env['PRODUCT_URL']}/filter?category_Id=${widget.categoryId}&productType=fruits',
          lettuceUri:
              '${dotenv.env['PRODUCT_URL']}/filter?category_Id=${widget.categoryId}&productType=legumes',
          tuberCulesUri:
              '${dotenv.env['PRODUCT_URL']}/filter?category_Id=${widget.categoryId}&productType=tubercules',
        );
      case 'Magasins':
        return ShopContainer(
          imageUrl: widget.imageUrl,
          child: TransformedContainer(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              child: ColumnOfShopBox(
                categoryName: widget.categoryName,
              ),
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

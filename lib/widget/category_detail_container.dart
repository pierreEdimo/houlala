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
              '${dotenv.env['PRODUCT_URL']}/filterProductsByCategoryAndProductType?categoryId=${widget.categoryId}&productType=624601b9be57262127759a17',
          lettuceUri:
              '${dotenv.env['PRODUCT_URL']}/filterProductsByCategoryAndProductType?categoryId=${widget.categoryId}&productType=6246033dbe57262127759a28',
          tuberCulesUri:
              '${dotenv.env['PRODUCT_URL']}/filterProductsByCategoryAndProductType?categoryId=${widget.categoryId}&productType=6246032fbe57262127759a26',
        );
      case 'Magasins':
        return ShopContainer(
          imageUrl: widget.imageUrl,
          child: TransformedContainer(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
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

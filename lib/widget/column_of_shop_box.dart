import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/widget/shop_container_box.dart';

class ColumnOfShopBox extends StatelessWidget {
  final String? categoryName;

  const ColumnOfShopBox({Key? key, this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        categoryName!.isNotEmpty
            ? Text(
                categoryName!,
                style: detailTitleStyle,
              )
            : Container(),
        SizedBox(
          height: categoryName!.isNotEmpty ? 20.0 : 0.0,
        ),
        ShopContainerBox(
          shopUrl:
              '${dotenv.env['PAGE_URL']}/filterPageByCategoryIdAndSpecialisation?categoryId=6233b38345bff7f776f0d30e&specialisation=6245a243dd701819d970a0be',
          title: 'Electronique Grand public',
        ),
        verticalSpacing,
        ShopContainerBox(
          shopUrl:
              '${dotenv.env['PAGE_URL']}/filterPageByCategoryIdAndSpecialisation?categoryId=6233b38345bff7f776f0d30e&specialisation=6245a221dd701819d970a0bc',
          title: 'Aliments',
        ),
        verticalSpacing,
        ShopContainerBox(
          shopUrl:
              '${dotenv.env['PAGE_URL']}/filterPageByCategoryIdAndSpecialisation?categoryId=6233b38345bff7f776f0d30e&specialisation=6245a273dd701819d970a0c0',
          title: 'Habits & Chaussures',
        )
      ],
    );
  }
}

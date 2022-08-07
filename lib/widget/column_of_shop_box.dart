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
        ShopContainerBox(
          shopUrl:
              '${dotenv.env['LOCATION_URL']}',
          title: 'Electronique Grand public',
        ),
        verticalSpacing,
        ShopContainerBox(
          shopUrl:
              '${dotenv.env['LOCATION_URL']}/',
          title: 'Aliments',
        ),
        verticalSpacing,
        ShopContainerBox(
          shopUrl:
              '${dotenv.env['LOCATION_URL']}',
          title: 'Habits & Chaussures',
        )
      ],
    );
  }
}

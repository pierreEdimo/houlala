import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/model/page.dart';
import 'package:houlala/widget/custom_column_container.dart';
import 'package:houlala/widget/grid_of_products.dart';

import 'flexible_row.dart';
import 'list_of_posts.dart';

class PageHomeContainer extends StatelessWidget {
  final PageModel? pageModel;

  const PageHomeContainer({Key? key, this.pageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomColumnContainer(
          child: const Text(
            "A Propos",
            style: TextStyle(fontSize: 17),
          ),
          gridList: Markdown(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            data: pageModel!.description!,
          ),
        ),
        standardSizedBox,
        SizedBox(
          height: 280,
          child: GridOfProducts(
            child: Container(
              margin: const EdgeInsets.only(bottom: 5.0),
              child: const Text(
                "Produits",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PoppinsBold',
                    fontSize: 17),
              ),
            ),
            scrollDirection: Axis.horizontal,
            crossAxisCount: 1,
            uri:
                '${dotenv.env['PRODUCT_URL']}/getRandomProductsByPageId?size=4&pageId=${pageModel!.id}',
            heightRatio: 1,
            widthRatio: 1.5,
          ),
        ),
        standardSizedBox,
        SizedBox(
          height: 350,
          child: ListOfPosts(
            scrollDirection: Axis.horizontal,
            height: 0.5,
            child:  FlexibleRow(
              title: "Quelques posts par ${pageModel!.name}",
              urlValue: "/all_posts",
            ),
            uri: '${dotenv.env['POST_URL']}/getRandomPostsByPageId?size=10&pageId=${pageModel!.id}',
          ),
        )
      ],
    );
  }
}

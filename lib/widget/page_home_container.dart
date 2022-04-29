import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/model/page.dart';
import 'package:houlala/widget/custom_column_container.dart';
import 'package:houlala/widget/grid_of_products.dart';
import 'package:houlala/widget/markdown_container.dart';
import 'list_of_posts.dart';
import 'package:sizer/sizer.dart';

class PageHomeContainer extends StatelessWidget {
  final PageModel? pageModel;

  const PageHomeContainer({Key? key, this.pageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomColumnContainer(
          child: Text(
            "A Propos",
            style: standardStyle,
          ),
          gridList: MarkdownContainer(
            data: pageModel!.description!,
          ),
        ),
        standardSizedBox,
        SizedBox(
          height: 280,
          child: GridOfProducts(
            height: 25.h,
            textError: "${pageModel!.name} n'a pas encore insere de produits"
                "svp veuillez verifier plutard",
            child: Container(
              margin: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                "Produits",
                style: standardStyle,
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
        ListOfPosts(
          textError: "${pageModel!.name!} n'a pas encore insere de posts"
              "svp venez verifier plutard",
          scrollDirection: Axis.horizontal,
          errorHeight: 35.h,
          child: Text(
            "posts par ${pageModel!.name}",
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                fontFamily: "PoppinsBold"),
          ),
          uri:
              '${dotenv.env['POST_URL']}/getRandomPostsByPageId?size=10&pageId=${pageModel!.id}',
        )
      ],
    );
  }
}

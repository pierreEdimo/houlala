import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/model/location.dart';
import 'package:houlala/widget/custom_column_container.dart';
import 'package:houlala/widget/grid_of_products.dart';
import 'package:houlala/widget/markdown_container.dart';
import 'package:sizer/sizer.dart';

class PageHomeContainer extends StatelessWidget {
  final LocationModel? pageModel;

  const PageHomeContainer({Key? key, this.pageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomColumnContainer(
          child: const Text(
            "A Propos",
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              fontFamily: "PoppinsBold",
            ),
          ),
          gridList: MarkdownContainer(
            data: pageModel!.shortDescription!,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
          child: GridOfProducts(
            height: 25.h,
            textError: "${pageModel!.name} n'a pas encore insere de produits"
                "svp veuillez verifier plutard",
            child: Container(
              margin: const EdgeInsets.only(bottom: 5.0),
              child: const Text(
                "Recemment ajoutes",
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "PoppinsBold"),
              ),
            ),
            crossAxisCount: 2,
            uri:
                '${dotenv.env['PRODUCT_URL']}/random/location/${pageModel!.uniqueIdentifier!}?size=6',
            heightRatio: 1.5,
            widthRatio: 1,
          ),
        ),
      ],
    );
  }
}

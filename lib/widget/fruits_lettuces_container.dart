import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/grid_of_products.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:houlala/widget/sub_category_horizontal_list.dart';
import 'package:houlala/widget/transformed_container.dart';
import 'package:sizer/sizer.dart';

class FruitsLettucesContainer extends StatelessWidget {
  final String? imageUrl;
  final String? categoryName;

  const FruitsLettucesContainer({
    Key? key,
    this.imageUrl,
    this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Material(
            elevation: 1,
            child: Stack(
              children: [
                SizedBox(
                  height: 35.h,
                  child: Container(
                    width: 100.w,
                    color: const Color(0xf2f2f2f2),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(imageUrl!),
                        ),
                        Text(
                          categoryName!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "PoppinsBold",
                            fontSize: 28.0,
                            color: Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: !kIsWeb ? null : 70.0,
                  child: AppBarWithReturn(
                    title: "",
                    elevation: 0,
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
          TransformedContainer(
            child: StandardCustomContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: "PoppinsBold",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                    child: SubCategoryHorizontalList(
                      uri:
                          '${dotenv.env['SUBCATEGORY_URL']}/category/638d214e9e725bd8c2dca355',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GridOfProducts(
                    child: const Text(
                      "Recemment ajoutees",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: "PoppinsBold",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    height: 30.h,
                    textError: "Aucuns produits appelle n'a ete trouve\n"
                        "svp verifiez plutard",
                    uri:
                        '${dotenv.env['PRODUCT_URL']}/random/category/638d214e9e725bd8c2dca355?size=10',
                    crossAxisCount: 2,
                    scrollDirection: Axis.vertical,
                    widthRatio: 1,
                    heightRatio: 1.5,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

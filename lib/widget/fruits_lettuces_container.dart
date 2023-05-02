import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/widget/grid_of_products.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:houlala/widget/sub_category_horizontal_list.dart';
import 'package:sizer/sizer.dart';

class FruitsLettucesContainer extends StatelessWidget {
  const FruitsLettucesContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StandardCustomContainer(
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
                        '${dotenv.env['SUBCATEGORY_URL']}/category/6443faff8c04e0c6cc8a4e43',
                  ),
                ),
                verticalSpacing,
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
                      '${dotenv.env['PRODUCT_URL']}/random/category/6443faff8c04e0c6cc8a4e43?size=10',
                  crossAxisCount: 2,
                  widthRatio: 1,
                  heightRatio: 1.5,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

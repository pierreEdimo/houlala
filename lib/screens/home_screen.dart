import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/widget/container_wirth_connectivity_checker.dart';
import 'package:houlala/widget/grid_pages.dart';
import 'package:houlala/widget/standard_custom_app_bar.dart';
import 'package:houlala/widget/custom_box_container.dart';
import 'package:houlala/widget/flexible_row.dart';
import 'package:houlala/widget/grid_of_products.dart';
import 'package:houlala/widget/list_of_categories.dart';
import 'package:sizer/sizer.dart';
import '../helper/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'houlala',
      ),
      body: ContainerWithConnectivityChecker(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomBoxContainer(
                  child: SizedBox(
                    height: 180,
                    child: ListOfCategories(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 5.0),
                        child: const FlexibleRow(
                          title: "Categories",
                          urlValue: "/all_categories",
                        ),
                      ),
                      uri: '${dotenv.env['CATEGORY_URL']}/random?size=10',
                      direction: Axis.horizontal,
                      shrinkWrap: true,
                    ),
                  ),
                ),
                standardSizedBox,
                CustomBoxContainer(
                  child: GridOfProducts(
                    height: 180,
                    textError: "Aucuns produits",
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 5.0),
                      child: const FlexibleRow(
                        title: 'fruits & legumes',
                        urlValue: "/all_fruits",
                      ),
                    ),
                    uri:
                        '${dotenv.env['PRODUCT_URL']}/random/category/638d214e9e725bd8c2dca355?size=4',
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    widthRatio: 1,
                    heightRatio: 1.5,
                  ),
                ),
                standardSizedBox,
                CustomBoxContainer(
                  child: SizedBox(
                    height: 220,
                    child: GridPages(
                      height: 25.h,
                      width: 90.w,
                      textError: "Aucunes Pages",
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 5.0),
                        child: const FlexibleRow(
                          title: 'Magasins',
                          urlValue: "/all_pages",
                        ),
                      ),
                      uri: '${dotenv.env['LOCATION_URL']}/store?limit=10',
                      direction: Axis.horizontal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

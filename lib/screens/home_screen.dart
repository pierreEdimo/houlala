import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/widget/container_wirth_connectivity_checker.dart';
import 'package:houlala/widget/grid_pages.dart';
import 'package:houlala/widget/list_of_posts.dart';
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
    return ResponsiveHomeScreen(
      categoryListHeight: 220,
      productGridHeight: 25.h,
      scrollDirection: Axis.vertical,
      crossAxisCount: 2,
      widthRatio: 1,
      heightRatio: 1.5,
      pageGridWidth: 90.w,
      postWidth: 90.w,
    );
  }
}

class ResponsiveHomeScreen extends StatelessWidget {
  final double? categoryListHeight;
  final double? productGridHeight;
  final int? crossAxisCount;
  final double? widthRatio;
  final double? heightRatio;
  final Axis? scrollDirection;
  final double? pageGridWidth;
  final double? postWidth;
  final double? tabletProductGridHeight;

  const ResponsiveHomeScreen(
      {Key? key,
      this.categoryListHeight,
      this.productGridHeight,
      this.widthRatio,
      this.heightRatio,
      this.crossAxisCount,
      this.scrollDirection,
      this.pageGridWidth,
      this.tabletProductGridHeight,
      this.postWidth})
      : super(key: key);

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
                    height: categoryListHeight,
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
                  child: SizedBox(
                    height: tabletProductGridHeight,
                    child: GridOfProducts(
                      height: productGridHeight,
                      textError: "Aucuns Produits",
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 5.0),
                        child: const FlexibleRow(
                          title: 'fruits & legumes',
                          urlValue: "/all_fruits",
                        ),
                      ),
                      uri:
                          '${dotenv.env['PRODUCT_URL']}/random/category/621a245eaf69ff81e170c5f6?size=4',
                      scrollDirection: scrollDirection,
                      crossAxisCount: crossAxisCount,
                      widthRatio: widthRatio,
                      heightRatio: heightRatio,
                    ),
                  ),
                ),
                standardSizedBox,
                CustomBoxContainer(
                  child: SizedBox(
                    height: 130,
                    child: GridPages(
                      height: 115,
                      width: pageGridWidth,
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
                standardSizedBox,
                CustomBoxContainer(
                  child: ListOfPosts(
                    postWidth: postWidth,
                    textError: "Aucuns posts",
                    scrollDirection: Axis.horizontal,
                    errorHeight: 35.h,
                    child: const FlexibleRow(
                      title: "Les posts recents",
                      urlValue: "/all_posts",
                    ),
                    uri: '${dotenv.env['POST_URL']}/random?size=10',
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

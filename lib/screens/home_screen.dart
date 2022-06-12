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
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizer/sizer.dart';
import '../helper/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        switch (sizingInformation.deviceScreenType) {
          case DeviceScreenType.desktop:
            return const Scaffold(
              body: Center(
                child: Text(
                  "Houlala est encore en plein developpement , nous travaillons chaque jour pour ameliorer la qualite des services proposees par notre application, ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35.0,
                  ),
                ),
              ),
            );
          case DeviceScreenType.tablet:
            return OrientationLayoutBuilder(
              portrait: (context) {
                return ResponsiveHomeScreen(
                  categoryListHeight: 20.h,
                  tabletProductGridHeight: 30.h,
                  scrollDirection: Axis.horizontal,
                  crossAxisCount: 1,
                  widthRatio: 1.5,
                  heightRatio: 1,
                  pageGridWidth: 45.w,
                  postWidth: 45.w,
                );
              },
              landscape: (context) {
                return ResponsiveHomeScreen(
                  categoryListHeight: 35.h,
                  tabletProductGridHeight: 70.h,
                  scrollDirection: Axis.horizontal,
                  crossAxisCount: 1,
                  widthRatio: 1.5,
                  heightRatio: 1,
                  pageGridWidth: 45.w,
                  postWidth: 45.w,
                );
              },
            );
          case DeviceScreenType.mobile:
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
          default:
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
      },
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
                          title: "Categories de produits",
                          urlValue: "/all_categories",
                        ),
                      ),
                      uri:
                          '${dotenv.env['CATEGORY_URL']}/getRandomCategories?size=6&categoryType=624037f8292cdadb3ad45b7a',
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
                          '${dotenv.env['PRODUCT_URL']}/getRandomProducts?size=4&categoryId=621a245eaf69ff81e170c5f6',
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
                      uri: '${dotenv.env['PAGE_URL']}/getRandomPages?size=4',
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
                    uri: '${dotenv.env['POST_URL']}/getRandomPosts?size=10',
                  ),
                ),
                // CustomBoxContainer(
                //   child: GridOfJobs(
                //     child: Text(
                //       "Les Jobs recents",
                //       style: standardStyle,
                //     ),
                //     scrollDirection: Axis.vertical,
                //     ratio: 2.5,
                //     uri: '${dotenv.env['JOB_URL']}/getRandomJobs?size=4',
                //     height: 0.25,
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/widget/container_wirth_connectivity_checker.dart';
import 'package:houlala/widget/grid_of_jobs.dart';
import 'package:houlala/widget/grid_pages.dart';
import 'package:houlala/widget/list_of_posts.dart';
import 'package:houlala/widget/standard_custom_app_bar.dart';
import 'package:houlala/widget/custom_box_container.dart';
import 'package:houlala/widget/flexible_row.dart';
import 'package:houlala/widget/grid_of_products.dart';
import 'package:houlala/widget/list_of_categories.dart';
import 'package:houlala/widget/web_app_bar.dart';
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
            return Scaffold(
              appBar: WebAppBar(),
              body: const Center(child: Text("Hello World!"),),
            );
          case DeviceScreenType.tablet:
          default:
            return Scaffold(
              appBar: CustomAppBar(
                title: 'houlala',
              ),
              body: ContainerWithConnectivityChecker(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomBoxContainer(
                        child: SizedBox(
                          height: 30.h,
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
                        child: GridOfProducts(
                          height: 25.h,
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
                          scrollDirection: Axis.vertical,
                          crossAxisCount: 2,
                          widthRatio: 1,
                          heightRatio: 1.5,
                        ),
                      ),
                      standardSizedBox,
                      CustomBoxContainer(
                        child: SizedBox(
                          height: 130,
                          child: GridPages(
                            height: 115,
                            textError: "Aucunes Pages",
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 5.0),
                              child: const FlexibleRow(
                                title: 'Quelques Magasins',
                                urlValue: "/all_pages",
                              ),
                            ),
                            uri:
                                '${dotenv.env['PAGE_URL']}/getRandomPages?size=4',
                            direction: Axis.horizontal,
                          ),
                        ),
                      ),
                      standardSizedBox,
                      CustomBoxContainer(
                        child: ListOfPosts(
                          textError: "Aucuns posts",
                          scrollDirection: Axis.horizontal,
                          errorHeight: 35.h,
                          child: const FlexibleRow(
                            title: "Quelques posts recents",
                            urlValue: "/all_posts",
                          ),
                          uri:
                              '${dotenv.env['POST_URL']}/getRandomPosts?size=10',
                        ),
                      ),
                      standardSizedBox,
                      CustomBoxContainer(
                        child: GridOfJobs(
                          child: Text(
                            "Quelques offres de Jobs",
                            style: standardStyle,
                          ),
                          scrollDirection: Axis.vertical,
                          ratio: 2.5,
                          uri: '${dotenv.env['JOB_URL']}/getRandomJobs?size=4',
                          height: 0.25,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}

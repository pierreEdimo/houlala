import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/widget/grid_pages.dart';
import 'package:houlala/widget/standard_custom_app_bar.dart';
import 'package:houlala/widget/custom_box_container.dart';
import 'package:houlala/widget/flexible_row.dart';
import 'package:houlala/widget/grid_of_products.dart';
import 'package:houlala/widget/list_of_categories.dart';

import '../helper/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'houlala',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomBoxContainer(
              child:  SizedBox(
                height: MediaQuery.of(context).size.height * 0.30,
                child: ListOfCategories(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 5.0),
                    child: const FlexibleRow(
                      title: "Categories de produits",
                      urlValue: "/all_categories",
                    ),
                  ),
                  uri:
                  '${dotenv.env['CATEGORY_URL']}/filter/with_limit?categoryType=produits&limit=10',
                  direction: Axis.horizontal,
                  shrinkWrap: true,
                ),
              ),
            ),
            standardSizedBox,
            CustomBoxContainer(
              child: GridOfProducts(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 5.0),
                  child: const FlexibleRow(
                    title: 'fruits & legumes',
                    urlValue: "/all_fruits",
                  ),
                ),
                uri:
                '${dotenv.env['PRODUCT_URL']}/filter/with_limit?productType=fruits&limit=4',
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                widthRatio: 1,
                heightRatio: 1.35,
              ),
            ),
            standardSizedBox,
            CustomBoxContainer(
              child: SizedBox(
                height: 130,
                child: GridPages(
                  child: Container(
                    margin: const  EdgeInsets.only(bottom: 5.0),
                    child: const FlexibleRow(
                      title: 'Nos Partenaires',
                      urlValue: "/all_pages",
                    ),
                  ),
                  uri: '${dotenv.env['PAGE_URL']}/filter?limit=10',
                  direction: Axis.horizontal,
                  ratio: 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

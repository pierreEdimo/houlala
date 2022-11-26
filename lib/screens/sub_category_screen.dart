import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/model/sub_category_parameter.dart';
import 'package:houlala/widget/grid_of_products.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:houlala/widget/transformed_container.dart';
import 'package:sizer/sizer.dart';

import '../widget/app_bar_with_return.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subCategoryParameter =
        ModalRoute.of(context)!.settings.arguments as SubCategoryParameter;
    return Scaffold(
      body: SingleChildScrollView(
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
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                NetworkImage(subCategoryParameter.thumbNail!),
                          ),
                          Text(
                            subCategoryParameter.label!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "PoppinsBold",
                                fontSize: 28.0,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: !kIsWeb ? null : 70.0,
                    child: AppBarWithReturn(
                      color: Colors.transparent,
                      elevation: 0,
                      title: "",
                    ),
                  )
                ],
              ),
            ),
            TransformedContainer(
              child: StandardCustomContainer(
                child: GridOfProducts(
                  height: 50.h,
                  textError: "Aucuns produits appelle n'a ete trouve\n"
                      "svp verifiez plutard",
                  uri:
                      '${dotenv.env['PRODUCT_URL']}/type/${subCategoryParameter.id}?limit=0',
                  crossAxisCount: 2,
                  scrollDirection: Axis.vertical,
                  widthRatio: 1,
                  heightRatio: 1.5,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

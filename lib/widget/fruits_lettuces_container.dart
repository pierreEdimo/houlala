import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/widget/blur_container.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/background_image.dart';
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
          Stack(
            children: [
              SizedBox(
                height: 35.h,
                child: BackgroundImage(
                  borderRadius: 0.0,
                  imageUrl: imageUrl!,
                ),
              ),
              const BlurContainer(),
              SizedBox(
                height: 30.h,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    categoryName!,
                    style: detailTitleStyle,
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
                          '${dotenv.env['SUBCATEGORY_URL']}/category/637062247d728921c4e3fa19',
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
                        '${dotenv.env['PRODUCT_URL']}/random/category/637062247d728921c4e3fa19?size=10',
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

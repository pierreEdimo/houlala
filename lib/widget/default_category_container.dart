import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/widget/transformed_container.dart';
import 'package:sizer/sizer.dart';

import 'blur_container.dart';
import 'app_bar_with_return.dart';
import 'background_image.dart';

class DefaultCategoryContainer extends StatelessWidget {
  final String? imageUrl;
  final String? categoryName;

  const DefaultCategoryContainer({Key? key, this.categoryName, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              child: BackgroundImage(
                borderRadius: 0,
                imageUrl: imageUrl!,
              ),
              height: 35.h,
            ),
            const BlurContainer(),
            SizedBox(
              height: 30.h,
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Text(
                  categoryName!,
                  style: detailTitleStyle,
                ),
              ),
            ),
            SizedBox(
              height: !kIsWeb ? null : 70.0,
              child: AppBarWithReturn(
                elevation: 0,
                color: Colors.transparent,
                title: "",
              ),
            )
          ],
        ),
        TransformedContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
                child: Center(
                  child: Text(
                    "Desole nous n'avons pac encore des produits de categorie ${categoryName!} "
                    "nous travaillons tres dure chaque jour pour ameliorer nos services "
                    "svp soyez patients et reeasseyez plutard.\n"
                    "excellentes journee",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

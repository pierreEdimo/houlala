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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
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
                          color: Colors.black,
                          fontFamily: "poppinsBold",
                          fontSize: 28.0,
                        ),
                      ),
                    ],
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

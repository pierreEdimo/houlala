import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/widget/no_items.dart';
import 'package:houlala/widget/transformed_container.dart';
import 'package:sizer/sizer.dart';
import 'app_bar_with_return.dart';

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
                  color: lightgrey,
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
              AppBarWithReturn(
                elevation: 0,
                color: Colors.transparent,
                title: "",
              )
            ],
          ),
        ),
        TransformedContainer(
            child: VerticalNoItem(
          height: 50.h,
          radius: 60,
          imageAsset: 'images/stock.png',
          errorMessage:
              "Pas de produits dans la categorie $categoryName pour le moment.",
        )),
      ],
    );
  }
}

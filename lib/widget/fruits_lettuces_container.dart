import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/background_image.dart';
import 'package:houlala/widget/fruits_lettuces_box_container.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:houlala/widget/transformed_container.dart';
import 'package:sizer/sizer.dart';



class FruitsLettucesContainer extends StatelessWidget {
  final String? fruitUri;
  final String? lettuceUri;
  final String? tuberCulesUri;
  final String? imageUrl;
  final String? categoryName;

  const FruitsLettucesContainer({
    Key? key,
    this.fruitUri,
    this.lettuceUri,
    this.tuberCulesUri,
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
                height: 50.h,
                child: BackgroundImage(
                  borderRadius: 0.0,
                  imageUrl: imageUrl!,
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
                  Text(
                    categoryName!,
                    style: detailTitleStyle,
                  ),
                  verticalSpacing,
                  FruitsLettucesBoxContainer(
                    uri: fruitUri!,
                    title: "fruits",
                  ),
                  verticalSpacing,
                  FruitsLettucesBoxContainer(
                    uri: lettuceUri!,
                    title: "legumes",
                  ),
                  verticalSpacing,
                  FruitsLettucesBoxContainer(
                    uri: tuberCulesUri,
                    title: "tubercules",
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

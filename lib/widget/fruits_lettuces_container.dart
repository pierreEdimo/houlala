import 'package:flutter/material.dart';
import 'package:houlala/helper/constants.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/background_image.dart';
import 'package:houlala/widget/fruits_lettuces_box_container.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:houlala/widget/transformed_container.dart';

//Color(0xe2e2e2e2);

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
                height: MediaQuery.of(context).size.height * 0.5,
                child: BackgroundImage(
                  imageUrl: imageUrl!,
                ),
              ),
              AppBarWithReturn(
                title: "",
                elevation: 0,
                color: Colors.transparent,
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
                    style:detailTitleStyle,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  FruitsLettucesBoxContainer(
                    uri: fruitUri!,
                    title: "fruits",
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  FruitsLettucesBoxContainer(
                    uri: lettuceUri!,
                    title: "legumes",
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
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

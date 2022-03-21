import 'package:flutter/material.dart';
import 'package:houlala/widget/transformed_container.dart';

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
                imageUrl: imageUrl!,
              ),
              height: MediaQuery.of(context).size.height * 0.5,
            ),
            AppBarWithReturn(
              elevation: 0,
              color: Colors.transparent,
              title: "",
            )
          ],
        ),
        TransformedContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categoryName!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PoppinsBold',
                    fontSize: 28.0),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
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

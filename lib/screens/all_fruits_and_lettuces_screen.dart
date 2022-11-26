import 'package:flutter/material.dart';
import 'package:houlala/widget/fruits_lettuces_container.dart';

class AllFruits extends StatelessWidget {
  const AllFruits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FruitsLettucesContainer(
        categoryName: "fruits & legumes",
        imageUrl:
            "https://upload.houlala.store/Images/237ea3a0-c05c-4776-a234-88d2ade1155f.jpg",
      ),
    );
  }
}

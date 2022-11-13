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
            "https://upload.houlala.store/Images/849d21c7-6436-485a-97b5-03144287c8c7.jpg",
      ),
    );
  }
}

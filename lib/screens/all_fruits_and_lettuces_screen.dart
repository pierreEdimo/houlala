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
            "https://upload.houlala.store/images/953471eb-d461-4844-ae5e-ff7636196663.jpg",
      ),
    );
  }
}

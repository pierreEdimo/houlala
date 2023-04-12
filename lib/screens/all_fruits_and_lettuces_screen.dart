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
            "http://upload.houlala.store/images/00b35eef-6d53-46df-8379-2a62c106046e.jpg",
      ),
    );
  }
}

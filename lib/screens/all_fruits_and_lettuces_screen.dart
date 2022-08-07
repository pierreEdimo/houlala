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
            "https://images.unsplash.com/photo-1573246123716-6b1782bfc499?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
      ),
    );
  }
}

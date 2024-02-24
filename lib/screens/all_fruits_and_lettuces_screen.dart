import 'package:flutter/material.dart';
import 'package:houlala/widget/fruits_lettuces_container.dart';

import '../widget/app_bar_with_return.dart';

class AllFruits extends StatelessWidget {
  const AllFruits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: AppBarWithReturn(
        title: "fruits & legumes",
        elevation: 1,
        color: Colors.transparent,
      ),
      body: FruitsLettucesContainer(),
    );
  }
}

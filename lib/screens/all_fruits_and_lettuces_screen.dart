import 'package:flutter/material.dart';
import '../widget/app_bar_with_return.dart';

class AllFruits extends StatelessWidget {
  const AllFruits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBarWithReturn(
        title: "fruits & legumes",
        elevation: 1,
        color: Colors.transparent,
      ),
      body: const Center(
        child: Text("Fruits & Legumes"),
      ),
    );
  }
}

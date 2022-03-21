import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/widget/fruits_lettuces_container.dart';

class AllFruits extends StatelessWidget {
  const AllFruits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  FruitsLettucesContainer(
        categoryName: "fruits & legumes",
        imageUrl: "https://images.unsplash.com/photo-1573246123716-6b1782bfc499?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
        fruitUri: '${dotenv.env['PRODUCT_URL']}/filter?productType=fruits&category_Id=621a245eaf69ff81e170c5f6',
        lettuceUri: '${dotenv.env['PRODUCT_URL']}/filter?productType=legumes&category_Id=621a245eaf69ff81e170c5f6' ,
        tuberCulesUri: '${dotenv.env['PRODUCT_URL']}/filter?category_Id=621a245eaf69ff81e170c5f6&productType=tubercules',
      ),
    );
  }
}

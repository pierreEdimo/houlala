import 'package:flutter/material.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/column_of_shop_box.dart';
import 'package:houlala/widget/standard_custom_container.dart';

class AllPageScreen extends StatelessWidget {
  const AllPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBarWithReturn(
        title: "Nos Partenaires" ,
        elevation: 1,
      ),
      body: const SingleChildScrollView(
        child: StandardCustomContainer(
          child: ColumnOfShopBox(
            categoryName: "",
          ),
        ),
      ),
    );
  }
}

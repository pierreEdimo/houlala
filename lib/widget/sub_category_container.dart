import 'package:flutter/material.dart';
import 'package:houlala/model/product_sub_category.dart';

class SubCategoryContainer extends StatelessWidget {
  final ProductSubCategory? category;

  const SubCategoryContainer({
    Key? key,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xf2f2f2f2),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            category!.label!,
            style: const TextStyle(
              fontFamily: 'PoppinsBold',
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}

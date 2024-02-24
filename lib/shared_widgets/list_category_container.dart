import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:houlala/model/page_screen_arguments.dart';
import 'package:houlala/screens/category_detail_screen.dart';

import '../models/product_category/category_model.dart';

class ListCategoryContainer extends StatelessWidget {
  final CategoryModel? categoryModel;

  const ListCategoryContainer({super.key, this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        CategoryDetailScreen.routeName,
        arguments: PageScreenArguments(
          categoryId: categoryModel!.id,
          imageUrl: categoryModel!.imageUrl,
          categoryName: categoryModel!.name!
        )
      ),
      child: Card(
        color: Colors.white,
        child: SizedBox(
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8.0), 
                    topLeft: Radius.circular(8.0)
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      categoryModel!.imageUrl!
                    ),
                    fit: BoxFit.cover
                  )
                ),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  categoryModel!.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

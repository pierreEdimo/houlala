import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:houlala/models/product_category/category_model.dart';
import 'package:houlala/screens/category_detail_screen.dart';
import '../models/page_screen_args/page_screen_arguments.dart';

class GridCategoryContainer extends StatelessWidget {
  final CategoryModel? categoryModel;

  const GridCategoryContainer({
    super.key,
    this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        CategoryDetailScreen.routeName,
        arguments: PageScreenArguments(
            categoryId: categoryModel!.id,
            categoryName: categoryModel!.name),
      ),
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                  image: DecorationImage(
                      image: NetworkImage(categoryModel!.imageUrl!),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                categoryModel!.name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

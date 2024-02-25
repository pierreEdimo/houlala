import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houlala/controllers/pcategory_controller.dart';
import 'package:houlala/models/product_category/category_model.dart';
import 'package:houlala/shared_widgets/custom_body_container.dart';
import 'package:houlala/shared_widgets/list_category_container.dart';
import '../widget/custom_box_container.dart';

class HomeCategoryBox extends ConsumerWidget {
  const HomeCategoryBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PCategoryController categoryController = PCategoryController(ref);
    List<CategoryModel> categoryList =
        categoryController.getCategoryListWithLimit(8);
    return CustomBodyContainer(
      loading: categoryController.pCategoryLoading(),
      error: categoryController.pCategoryError(),
      errorMessage: categoryController.getPCategoryErrorMessage(),
      loadingHeight: 300,
      child: CustomBoxContainer(
        title: 'Decouvrez nos produits par categorie',
        urlValue: 'all_categories',
        child: SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: categoryList
                .map(
                  (category) => ListCategoryContainer(
                    categoryModel: category,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

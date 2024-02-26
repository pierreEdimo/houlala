import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houlala/controllers/sub_category_controller.dart';
import 'package:houlala/models/sub_category/sub_category_model.dart';
import 'package:houlala/shared_widgets/custom_body_container.dart';
import 'package:houlala/shared_widgets/sub_category_container.dart';

class FruitsLettucesBody extends ConsumerWidget {
  final String? categoryName;

  const FruitsLettucesBody({
    super.key,
    this.categoryName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SubCategoryController subCategoryController = SubCategoryController(ref);
    List<SubCategoryModel> subCategoryList =
        subCategoryController.getSubCategoriesByCategoryName(categoryName!);

    return CustomBodyContainer(
      loading: subCategoryController.loading,
      error: subCategoryController.hasError,
      loadingHeight: MediaQuery.of(context).size.height * 1,
      errorMessage: subCategoryController.errorMessage,
      child: ListView(
        padding: EdgeInsets.zero,
        children: subCategoryList
            .map(
              (subCategory) => SubCategoryContainer(
                subCategoryModel: subCategory,
              ),
            )
            .toList(),
      ),
    );
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houlala/providers/sub_category_provider.dart';

import '../models/sub_category/sub_category_model.dart';

class SubCategoryController {
  WidgetRef ref;

  SubCategoryController(this.ref);

  List<SubCategoryModel> get subCategoryList {
    return ref.watch(subCategoryStateNotifierProvider).categoryList;
  }

  bool get hasError {
    return ref.watch(subCategoryStateNotifierProvider).error;
  }

  String get errorMessage {
    return ref.watch(subCategoryStateNotifierProvider).errorMessage;
  }

  bool get loading {
    return ref.watch(subCategoryStateNotifierProvider).loading;
  }

  List<SubCategoryModel> getSubCategoriesByCategoryName(String categoryName) {
    return subCategoryList
        .where((element) =>
            element.categoryName!
                .toLowerCase()
                .compareTo(categoryName.toLowerCase()) ==
            0)
        .toList();
  }

  SubCategoryModel getSelectedSubCategory(int subCategoryId) {
    return subCategoryList.firstWhere((element) => element.id == subCategoryId);
  }
}

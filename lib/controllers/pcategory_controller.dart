import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product_category/category_model.dart';
import '../providers/category_provider.dart';

class PCategoryController {
  WidgetRef ref; 

  PCategoryController(this.ref);

  bool pCategoryLoading(){
    return ref.watch(pCategoryStateNotifierProvider)
        .loading;
  }

  bool pCategoryError(){
    return ref.watch(pCategoryStateNotifierProvider)
        .error;
  }

  String getPCategoryErrorMessage(){
    return ref.watch(pCategoryStateNotifierProvider)
        .errorMessage;
  }
  
  List<CategoryModel> getCategoryListWithLimit(int limit){
    return ref.watch(pCategoryStateNotifierProvider)
        .categoryList
        .take(limit)
        .toList();
  }

  List<CategoryModel> get categories {
    return ref.watch(pCategoryStateNotifierProvider)
        .categoryList;
  }
}
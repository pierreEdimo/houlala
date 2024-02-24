import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houlala/models/product_category/category_model.dart';
import 'package:houlala/repositories/category/category_repository.dart';
import 'package:houlala/state/product_category/p_category_model.state.dart';

final pCategoryRepositoryProvider =
    Provider<CategoryRepository>((ref) => CategoryRepository());

final pCategoryStateNotifierProvider =
    StateNotifierProvider<CategoryStateNotifier, PCategoryModelState>(
            (ref) => CategoryStateNotifier(ref.watch(pCategoryRepositoryProvider)));

class CategoryStateNotifier extends StateNotifier<PCategoryModelState> {
  final CategoryRepository categoryRepository;

  CategoryStateNotifier(this.categoryRepository) : super(PCategoryModelState()){
    if(state.categoryList.isEmpty){
      loadCategories();
    }
  }

  Future<void> loadCategories() async {
    try {
      state = state.copyWith(loading: true);
      List<CategoryModel> categoryList =
          await categoryRepository.fetchAllCategories();
      state = state.copyWith(categoryList: categoryList, loading: false);
    } catch (e) {
      state = state.copyWith(
          error: true,
          errorMessage:
              "impossible d'avoir acces aux categories. Svp reessayez plutard");
    }
  }
}

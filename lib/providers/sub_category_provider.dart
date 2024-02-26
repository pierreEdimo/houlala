import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houlala/models/sub_category/sub_category_model.dart';
import 'package:houlala/repositories/sub_category/sub_category_repository.dart';
import 'package:houlala/state/sub_category/sub_category_model.state.dart';

final subCategoryRepositoryProvider =
    Provider<SubCategoryRepository>((ref) => SubCategoryRepository());

final subCategoryStateNotifierProvider =
    StateNotifierProvider<SubCategoryStateNotifier, SubCategoryModelState>(
        (ref) =>
            SubCategoryStateNotifier(ref.watch(subCategoryRepositoryProvider)));

class SubCategoryStateNotifier extends StateNotifier<SubCategoryModelState> {
  final SubCategoryRepository subCategoryRepository;

  SubCategoryStateNotifier(this.subCategoryRepository)
      : super(SubCategoryModelState()) {
    loadSubCategories();
  }

  Future<void> loadSubCategories() async {
    try {
      state = state.copyWith(loading: true);
      List<SubCategoryModel> categoryList =
          await subCategoryRepository.fetchAllSubCategories();
      state = state.copyWith(categoryList: categoryList, loading: false);
    } catch (e) {
      state = state.copyWith(
          error: true,
          errorMessage:
              "impossible d'avoir acces aux categories. Svp reessayez plutard");
    }
  }
}

import '../../models/product_category/category_model.dart';

abstract class CategoryRepositoryInterface{
  Future<List<CategoryModel>> fetchAllCategories();
}
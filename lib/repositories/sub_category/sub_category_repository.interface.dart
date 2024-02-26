import 'package:houlala/models/sub_category/sub_category_model.dart';

abstract class SubCategoryRepositoryInterface{
  Future<List<SubCategoryModel>> fetchAllSubCategories(); 
}